@ECHO OFF
Setlocal EnableDelayedExpansion

CALL __Global.cmd

ECHO *** Go Install ***
ECHO Installs the packages named by the import paths
ECHO.

FOR /F "tokens=*" %%A IN (Packages.txt) DO (
SET PACKAGE=%%A
SET FIRSTLETTER=!PACKAGE:~0,1!

IF NOT !FIRSTLETTER!==# (
ECHO Installing: !PACKAGE!
cd "%GOPATH%\src\!PACKAGE!"
go install -v %LDFLAGS% !PACKAGE!
ECHO.

IF !ERRORLEVEL! NEQ 0 PAUSE
)

)
