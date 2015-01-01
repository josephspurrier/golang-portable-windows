@ECHO OFF
Setlocal EnableDelayedExpansion

CALL __Global.cmd

ECHO *** Gobuild ***
ECHO Build compiles packages and dependencies without race condition detector
ECHO.

go list ./... > "%GOPATH%\packages.txt"

for /F "tokens=*" %%A in (packages.txt) do (
set PACKAGE=%%A

SET FIRST=!PACKAGE:~0,1!

ECHO Building: !PACKAGE!
cd "%GOPATH%\src\!PACKAGE!"
go build -v %LDFLAGS% !PACKAGE!
ECHO.

)

ECHO *** Cleaning Up ***
DEL /F /Q "%GOPATH%\packages.txt"
ECHO.

PAUSE