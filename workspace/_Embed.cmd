@ECHO OFF
Setlocal EnableDelayedExpansion

CALL __Global.cmd

ECHO *** Goversioninfo ***
ECHO Creates a syso file with version information and an icon
ECHO Go Build will automatically embed the resource
ECHO Icon should be named: icon.ico
ECHO Version Info should be named: versioninfo.json
ECHO Code available here: https://github.com/josephspurrier/goversioninfo
ECHO.

FOR /F "tokens=*" %%A IN (Packages.txt) DO (
SET PACKAGE=%%A
SET FIRSTLETTER=!PACKAGE:~0,1!

IF NOT !FIRSTLETTER!==# (
ECHO Creating SYSO File: !PACKAGE!
CD "%GOPATH%\src\!PACKAGE!"
goversioninfo -icon=icon.ico
ECHO.
)

)