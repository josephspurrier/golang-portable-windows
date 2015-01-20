@ECHO OFF
Setlocal EnableDelayedExpansion

CALL __Global.cmd

ECHO *** Gotest ***
ECHO Test runs package tests
ECHO.

FOR /F "tokens=*" %%A IN (Packages.txt) DO (
SET PACKAGE=%%A

IF "!FIRST!" == "_" (
ECHO Skipping: !PACKAGE!
ECHO.
) ELSE (
ECHO Testing: !PACKAGE!
go test -coverprofile="%GOPATH%\test.tmp" -race -cover !PACKAGE!
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