@ECHO OFF
Setlocal EnableDelayedExpansion

CALL __Global.cmd

ECHO *** Go Generate ***
ECHO Runs commands described by directives within existing files
ECHO.

FOR /F "tokens=*" %%A IN (Packages.txt) DO (
SET PACKAGE=%%A
SET FIRSTLETTER=!PACKAGE:~0,1!

IF NOT !FIRSTLETTER!==# (
ECHO Building: !PACKAGE!
cd "%GOPATH%\src\!PACKAGE!"
go generate
ECHO.

IF !ERRORLEVEL! NEQ 0 PAUSE
)

)
