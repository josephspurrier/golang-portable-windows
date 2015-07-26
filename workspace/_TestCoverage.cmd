@ECHO OFF
Setlocal EnableDelayedExpansion

CALL __Global.cmd

ECHO *** Go Test ***
ECHO Test runs package tests
ECHO.

FOR /F "tokens=*" %%A IN (Packages.txt) DO (
SET PACKAGE=%%A
SET FIRSTLETTER=!PACKAGE:~0,1!

IF NOT !FIRSTLETTER!==# (
ECHO Testing: !PACKAGE!

IF %BUILDBIT%==32 (
go test -coverprofile="%GOPATH%\test.tmp" -cover !PACKAGE!
) ELSE (
go test -coverprofile="%GOPATH%\test.tmp" -race -cover !PACKAGE!
)

ECHO.

IF EXIST "%GOPATH%\test.tmp" (
ECHO *** Gotool ***
ECHO Tool generates an html coverage map - web browser with test coverage
go tool cover -html="%GOPATH%\test.tmp"
DEL /F /Q "%GOPATH%\test.tmp"
) ELSE (
ECHO Skipping coverage map
)

ECHO.

)
)

PAUSE