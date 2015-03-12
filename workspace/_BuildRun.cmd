@ECHO OFF
Setlocal EnableDelayedExpansion

CALL __Global.cmd

ECHO *** Go Build then Run ***
ECHO Run compiles and runs the main package
ECHO.

FOR /F "tokens=*" %%A IN (Packages.txt) DO (
SET PACKAGE=%%A
SET FIRSTLETTER=!PACKAGE:~0,1!

IF NOT !FIRSTLETTER!==# (
ECHO Running: !PACKAGE!
cd "%GOPATH%\src\!PACKAGE!"

for %%F in (!PACKAGE!) do (
go build -v %LDFLAGS%
%%~nxF.exe
ECHO.

IF !ERRORLEVEL! NEQ 0 PAUSE
)

)

)