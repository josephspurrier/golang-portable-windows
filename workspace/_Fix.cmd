@ECHO OFF
Setlocal EnableDelayedExpansion
CALL __Global.cmd

ECHO *** Go Fix ***
ECHO Fix finds Go programs that use old APIs and rewrites them to use newer ones
ECHO.

FOR /F "tokens=*" %%A IN (Packages.txt) DO (
SET PACKAGE=%%A
SET FIRSTLETTER=!PACKAGE:~0,1!

IF NOT !FIRSTLETTER!==# (
ECHO Fixing: !PACKAGE!
go tool fix "%GOPATH%\src\!PACKAGE!"
ECHO.
)

)

PAUSE