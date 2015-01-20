@ECHO OFF

CALL __Global.cmd

ECHO *** Go List ***
ECHO List outputs the packages named by the import paths, one per line.
ECHO.

go list ./...
ECHO.

PAUSE