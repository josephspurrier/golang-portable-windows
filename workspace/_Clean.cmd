@ECHO OFF
Setlocal EnableDelayedExpansion

CALL __Global.cmd

ECHO *** Go Clean ***
ECHO Clean removes object files from package source directories
ECHO.

FOR /F "tokens=*" %%A IN (Packages.txt) DO (
SET PACKAGE=%%A
SET FIRSTLETTER=!PACKAGE:~0,1!

IF NOT !FIRSTLETTER!==# (
ECHO Cleaning: !PACKAGE!
go clean -i !PACKAGE!
ECHO.
)

)