@ECHO OFF

CALL __Global.cmd

ECHO *** Gofix ***
ECHO Fix finds Go programs that use old APIs and rewrites them to use newer ones
ECHO.

go tool fix -diff "%GOPATH%"
ECHO.

PAUSE