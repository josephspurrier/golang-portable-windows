@ECHO OFF
Setlocal EnableDelayedExpansion

CALL __Global.cmd

ECHO *** Go Test ***
ECHO Test runs package tests
ECHO.

FOR /F "tokens=*" %%A IN (Packages.txt) DO (
SET PACKAGE=%%A
SET FIRSTLETTER=!PACKAGE:~0,1!

IF NOT !FIRSTLETTER!==# (
ECHO Testing: !PACKAGE!
cd "%GOPATH%\src\!PACKAGE!"
go test !PACKAGE! -race -cover
ECHO.
)

)

PAUSE