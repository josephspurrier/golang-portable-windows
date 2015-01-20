@ECHO OFF
Setlocal EnableDelayedExpansion

CALL __Global.cmd

ECHO *** Gobuild ***
ECHO Build compiles packages and dependencies with race condition detector
ECHO.

FOR /F "tokens=*" %%A IN (Packages.txt) DO (
SET PACKAGE=%%A

ECHO Building: !PACKAGE!
cd "%GOPATH%\src\!PACKAGE!"
go build -v -race %LDFLAGS% !PACKAGE!
ECHO.

IF !ERRORLEVEL! NEQ 0 PAUSE

)
