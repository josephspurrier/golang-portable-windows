@ECHO OFF
Setlocal EnableDelayedExpansion

CALL __Global.cmd

ECHO *** Go Build ***
ECHO Build compiles packages and dependencies with race condition detector
ECHO.

FOR /F "tokens=*" %%A IN (Packages.txt) DO (
SET PACKAGE=%%A
SET FIRSTLETTER=!PACKAGE:~0,1!

IF NOT !FIRSTLETTER!==# (
ECHO Building: !PACKAGE!
cd "%GOPATH%\src\!PACKAGE!"
DEL /Q /F *.syso > nul 2>&1
go build -v -race %LDFLAGS% !PACKAGE!
ECHO.

IF !ERRORLEVEL! NEQ 0 PAUSE
)

)
