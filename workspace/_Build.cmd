@ECHO OFF
Setlocal EnableDelayedExpansion

CALL __Global.cmd

ECHO *** Gobuild ***
ECHO Build compiles packages and dependencies
ECHO.

go list ./... > "%GOPATH%\packages.txt"

FOR /F "tokens=*" %%A IN (packages.txt) DO (
SET PACKAGE=%%A

ECHO Building: !PACKAGE!
cd "%GOPATH%\src\!PACKAGE!"
go build -v %LDFLAGS% !PACKAGE!
ECHO.

IF !ERRORLEVEL! NEQ 0 PAUSE

)

ECHO *** Cleaning Up ***
DEL /F /Q "%GOPATH%\packages.txt"
ECHO.
