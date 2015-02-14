@ECHO OFF
Setlocal EnableDelayedExpansion

CALL __Global.cmd

ECHO *** Go Get ***
ECHO Get downloads and installs the packages named by the import paths, along with their dependencies.
ECHO.

FOR /F "tokens=*" %%A IN (GetPackages.txt) DO (
SET PACKAGE=%%A
SET FIRSTLETTER=!PACKAGE:~0,1!

IF NOT !FIRSTLETTER!==# (
ECHO Getting: !PACKAGE!
go get !PACKAGE!
ECHO.

IF !ERRORLEVEL! NEQ 0 PAUSE
)

)