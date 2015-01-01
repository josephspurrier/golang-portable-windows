@ECHO OFF

CALL __Global.cmd

ECHO *** Golint ***
ECHO Lint prints out style mistakes
ECHO.

go get github.com/golang/lint/golint
golint
ECHO.

PAUSE