@ECHO OFF

CALL __Global.cmd

ECHO *** Golist ***
ECHO List lists the packages named by the import paths, one per line.
ECHO.

go list ./...
ECHO.

PAUSE