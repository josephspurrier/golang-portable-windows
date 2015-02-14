@ECHO OFF
Setlocal EnableDelayedExpansion

CALL __Global.cmd

ECHO *** Gofmt ***
ECHO Gofmt formats Go programs
ECHO.

FOR /F "tokens=*" %%A IN (Packages.txt) DO (
SET PACKAGE=%%A
SET FIRSTLETTER=!PACKAGE:~0,1!

IF NOT !FIRSTLETTER!==# (
ECHO Formatting: !PACKAGE!
gofmt -s -w "%GOPATH%\src\!PACKAGE!"
ECHO.
)

)

PAUSE