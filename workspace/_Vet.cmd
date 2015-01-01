@ECHO OFF

CALL __Global.cmd

ECHO *** Govet ***
ECHO Vet examines Go source code and reports suspicious constructs
ECHO.

go vet ./...
ECHO.

PAUSE