@ECHO OFF

CALL __Global.cmd

ECHO *** Gofmt ***
ECHO Gofmt formats Go programs
ECHO.

gofmt -s -w "%GOPATH%"
ECHO.

ECHO *** Gotest ***
ECHO Test runs package tests
ECHO.

go test ./... -race -cover
ECHO.

PAUSE