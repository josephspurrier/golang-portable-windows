@ECHO OFF

CALL __Global.cmd

ECHO *** Godoc ***
ECHO Godoc extracts and generates documentation for Go programs
ECHO.

ECHO Web browser opened to http://localhost:6060
start http://localhost:6060
godoc -http=:6060
ECHO.