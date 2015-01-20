@ECHO OFF
Setlocal EnableDelayedExpansion

CALL __Global.cmd

ECHO *** Gofmt ***
ECHO Gofmt formats Go programs
ECHO.

FOR /F "tokens=*" %%A IN (Packages.txt) DO (
SET PACKAGE=%%A

ECHO Formatting: !PACKAGE!
gofmt -s -w "%GOPATH%\src\!PACKAGE!"
ECHO.

)

PAUSE