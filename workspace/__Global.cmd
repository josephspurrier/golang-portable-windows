@ECHO OFF

FOR %%a in ("%CD%\..") DO SET WORKROOT=%%~fa
SET GOROOT=%WORKROOT%\go
SET GOPATH=%CD%
SET GIT=%WORKROOT%\git\bin
SET GIT_SSL_NO_VERIFY=1
SET MERCURIAL=%WORKROOT%\mercurial
SET DIFF=%WORKROOT%\diff\bin
SET /P BUILDBIT=<..\BUILDBIT.txt
SET PATH=c:\mingw%BUILDBIT%\bin;%GOROOT%\bin%BUILDBIT%;%GOPATH%\bin;%GIT%;%MERCURIAL%;%DIFF%;%PATH%

FOR /F "TOKENS=1* DELIMS= " %%A IN ('DATE/T') DO SET CDATE=%%B
FOR /F "TOKENS=1,2 eol=/ DELIMS=/ " %%A IN ('DATE/T') DO SET mm=%%B
FOR /F "TOKENS=1,2 DELIMS=/ eol=/" %%A IN ('echo %CDATE%') DO SET dd=%%B
FOR /F "TOKENS=2,3 DELIMS=/ " %%A IN ('echo %CDATE%') DO SET yyyy=%%B
SET DATE=%yyyy%%mm%%dd%
SET TIME=%TIME: =0%
SET TIME=%TIME::=.%
SET TIME=%TIME:.=%
SET TIMESTAMP=%DATE%%TIME%

FOR /f "delims=" %%x in (BuildVersion.txt) DO SET VERSION=%%x

SET LDFLAGS=-ldflags "-X main.Version=%VERSION% -X main.BuildDate=%TIMESTAMP%"