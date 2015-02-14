@ECHO OFF
Setlocal EnableDelayedExpansion

CALL __Global.cmd

ECHO *** Go Build ***
ECHO Build compiles packages and dependencies
ECHO.

FOR /F "tokens=*" %%A IN (Packages.txt) DO (
SET PACKAGE=%%A
SET FIRSTLETTER=!PACKAGE:~0,1!

IF NOT !FIRSTLETTER!==# (
ECHO Building: !PACKAGE!
cd "%GOPATH%\src\!PACKAGE!"
go build -v %LDFLAGS% !PACKAGE!
ECHO.

IF !ERRORLEVEL! NEQ 0 PAUSE
)

)
