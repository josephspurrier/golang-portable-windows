@ECHO OFF
Setlocal EnableDelayedExpansion

CALL __Global.cmd

ECHO *** Goclean ***
ECHO Clean removes object files from package source directories
ECHO.

go list ./... > "%GOPATH%\packages.txt"

for /F "tokens=*" %%A in (packages.txt) do (
set PACKAGE=%%A

SET FIRST=!PACKAGE:~0,1!

ECHO Cleaning: !PACKAGE!
go clean -i !PACKAGE!
ECHO.

)

ECHO *** Cleaning Up ***
DEL /F /Q "%GOPATH%\packages.txt"
ECHO.