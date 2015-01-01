@ECHO OFF
Setlocal EnableDelayedExpansion

CALL __Global.cmd

ECHO *** Goinstall ***
ECHO Installs the packages named by the import paths
ECHO.

go list ./... > "%GOPATH%\packages.txt"

for /F "tokens=*" %%A in (packages.txt) do (
set PACKAGE=%%A

SET FIRST=!PACKAGE:~0,1!

ECHO Installing: !PACKAGE!
cd "%GOPATH%\src\!PACKAGE!"
go install -v %LDFLAGS% !PACKAGE!
ECHO.

)

ECHO *** Cleaning Up ***
DEL /F /Q "%GOPATH%\packages.txt"
ECHO.

PAUSE