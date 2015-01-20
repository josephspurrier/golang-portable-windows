@ECHO OFF
Setlocal EnableDelayedExpansion

CALL __Global.cmd

ECHO *** Govet ***
ECHO Vet examines Go source code and reports suspicious constructs
ECHO.

FOR /F "tokens=*" %%A IN (Packages.txt) DO (
SET PACKAGE=%%A

ECHO Vetting: !PACKAGE!
go vet !PACKAGE!
ECHO.

)

PAUSE