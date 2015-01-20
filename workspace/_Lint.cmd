@ECHO OFF
Setlocal EnableDelayedExpansion

CALL __Global.cmd

ECHO *** Golint ***
ECHO Lint prints out style mistakes
ECHO.

go get github.com/golang/lint/golint

FOR /F "tokens=*" %%A IN (Packages.txt) DO (
SET PACKAGE=%%A

ECHO Linting: !PACKAGE!
cd "%GOPATH%\src\!PACKAGE!"
golint
ECHO.

)

PAUSE