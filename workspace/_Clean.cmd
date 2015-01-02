@ECHO OFF
Setlocal EnableDelayedExpansion

CALL __Global.cmd

ECHO *** Goclean ***
ECHO Clean removes object files from package source directories
ECHO.

go list ./... > "%GOPATH%\packages.txt"

FOR /F "tokens=*" %%A IN (packages.txt) DO (
SET PACKAGE=%%A

ECHO Cleaning: !PACKAGE!
go clean -i !PACKAGE!
ECHO.

)

ECHO *** Cleaning Up ***
DEL /F /Q "%GOPATH%\packages.txt"
ECHO.