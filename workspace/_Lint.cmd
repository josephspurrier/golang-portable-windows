@ECHO OFF
Setlocal EnableDelayedExpansion

CALL __Global.cmd

ECHO *** Golint ***
ECHO Lint prints out style mistakes
ECHO.

go get github.com/golang/lint/golint

FOR /F "tokens=*" %%A IN (Packages.txt) DO (
SET PACKAGE=%%A
SET FIRSTLETTER=!PACKAGE:~0,1!

IF NOT !FIRSTLETTER!==# (
ECHO Linting: !PACKAGE!
cd "%GOPATH%\src\!PACKAGE!"
golint
ECHO.
)

)

PAUSE