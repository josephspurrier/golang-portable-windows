@ECHO OFF
Setlocal EnableDelayedExpansion

CALL __Global.cmd

ECHO *** Gotest ***
ECHO Test runs package tests
ECHO.

FOR /F "tokens=*" %%A IN (Packages.txt) DO (
SET PACKAGE=%%A

ECHO Testing: !PACKAGE!
cd "%GOPATH%\src\!PACKAGE!"
go test !PACKAGE! -race -cover
ECHO.

)

PAUSE