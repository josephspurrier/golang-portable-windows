@ECHO OFF
Setlocal EnableDelayedExpansion

CALL __Global.cmd

ECHO *** Goget ***
ECHO Get downloads and installs the packages named by the import paths, along with their dependencies.
ECHO.

FOR /F "tokens=*" %%A IN (GetPackages.txt) DO (
SET PACKAGE=%%A

ECHO Getting: !PACKAGE!
go get !PACKAGE!
ECHO.

)

PAUSE