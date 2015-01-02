@ECHO OFF
Setlocal EnableDelayedExpansion

CALL __Global.cmd

ECHO *** Gobuild ***
ECHO Build compiles packages and dependencies with race condition detector
ECHO.

go list ./... > "%GOPATH%\packages.txt"

FOR /F "tokens=*" %%A IN (packages.txt) DO (
SET PACKAGE=%%A

ECHO Building: !PACKAGE!
cd "%GOPATH%\src\!PACKAGE!"
go build -v -race %LDFLAGS% !PACKAGE!
ECHO.

)

ECHO *** Cleaning Up ***
DEL /F /Q "%GOPATH%\packages.txt"
ECHO.

PAUSE