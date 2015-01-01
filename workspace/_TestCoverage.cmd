@ECHO OFF
Setlocal EnableDelayedExpansion

CALL __Global.cmd

ECHO *** Gofmt ***
ECHO Gofmt formats Go programs
gofmt -s -w "%GOPATH%"
ECHO.

ECHO *** Gotest ***
ECHO Test runs package tests
ECHO.

go list ./... > "%GOPATH%\packages.txt"

for /F "tokens=*" %%A in (packages.txt) do (
set PACKAGE=%%A

SET FIRST=!PACKAGE:~0,1!

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

ECHO *** Cleaning Up ***
DEL /F /Q "%GOPATH%\packages.txt"
ECHO.

PAUSE