@ECHO OFF
Setlocal EnableDelayedExpansion

CALL __Global.cmd

ECHO *** Gofmt ***
ECHO Gofmt formats Go programs
ECHO.

gofmt -s -w "%GOPATH%"
ECHO.

ECHO *** Gotest ***
ECHO Test runs package tests
ECHO.

FOR /F "tokens=*" %%A IN (Packages.txt) DO (
SET PACKAGE=%%A

ECHO Testing: !PACKAGE!
cd "%GOPATH%\src\!PACKAGE!"
go test !PACKAGE! -race -bench=.
ECHO.

)

PAUSE