@ECHO OFF
Setlocal EnableDelayedExpansion

CALL __Global.cmd

ECHO *** Go Vet ***
ECHO Vet examines Go source code and reports suspicious constructs
ECHO.

FOR /F "tokens=*" %%A IN (Packages.txt) DO (
SET PACKAGE=%%A
SET FIRSTLETTER=!PACKAGE:~0,1!

IF NOT !FIRSTLETTER!==# (
ECHO Vetting: !PACKAGE!
go vet !PACKAGE!
ECHO.
)

)

PAUSE