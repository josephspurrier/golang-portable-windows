@ECHO OFF
Setlocal EnableDelayedExpansion

CALL __Global.cmd

ECHO *** Goinstall ***
ECHO Installs the packages named by the import paths
ECHO.

go list ./... > "%GOPATH%\packages.txt"

FOR /F "tokens=*" %%A IN (packages.txt) DO (
SET PACKAGE=%%A

ECHO Installing: !PACKAGE!
cd "%GOPATH%\src\!PACKAGE!"
go install -v %LDFLAGS% !PACKAGE!
ECHO.

IF !ERRORLEVEL! NEQ 0 PAUSE

)

ECHO *** Cleaning Up ***
DEL /F /Q "%GOPATH%\packages.txt"
ECHO.
