@ECHO OFF
Setlocal EnableDelayedExpansion

ECHO Starting up LiteIDE with the correct paths...

SET BUILDBIT=64

REM Set the root folder, replace slashes with backslashes
SET ROOTDIRT=%CD%
SET ROOTDIR=%ROOTDIRT:\=/%
SET ROOTDIR2=%ROOTDIRT:\=\\%
SET ROOTDIR3=%ROOTDIRT:\=\%

IF NOT EXIST liteide_config\locked.txt (
REM Copy over the system paths
CALL liteide_config\jrepl.bat "WORKROOT=" "WORKROOT=%ROOTDIR3%" /F liteide_config\system%BUILDBIT%.env /O liteide_config\system2.env
COPY liteide_config\system2.env liteide\share\liteide\liteenv\system.env
DEL liteide_config\system2.env

REM Make the config directory it if doesn't exist
IF NOT EXIST liteide\share\liteide\liteapp\config (
MKDIR liteide\share\liteide\liteapp\config
)

REM Write the current directory to a liteide.ini
COPY liteide_config\config\liteide.ini liteide_config\config\liteide2.ini
ECHO.>> liteide_config\config\liteide2.ini
ECHO [session]>> liteide_config\config\liteide2.ini
ECHO default_folderList=%ROOTDIR%/workspace/src>> liteide_config\config\liteide2.ini
ECHO.>> liteide_config\config\liteide2.ini
ECHO [FileManager]>> liteide_config\config\liteide2.ini
ECHO initpath=%ROOTDIR%/workspace/src>> liteide_config\config\liteide2.ini
REM ECHO.>> liteide_config\config\liteide2.ini
REM ECHO [golangdoc]>> liteide_config\config\liteide2.ini
REM ECHO goroot=!ROOTDIR2!\\go>> liteide_config\config\liteide2.ini
COPY /Y liteide_config\config\global.ini liteide\share\liteide\liteapp\config\global.ini
COPY /Y liteide_config\config\liteide2.ini liteide\share\liteide\liteapp\config\liteide.ini
DEL liteide_config\config\liteide2.ini

ECHO Delete this file to reset LiteIDE to the default settings the next time you run LiteIDE.cmd > liteide_config\locked.txt
) ELSE (
REM Find the name of the last root folder
SET ENDING=THISWONTREPLACE
for /f "tokens=*" %%a in (liteide\share\liteide\liteapp\config\liteide.ini) do (
SET P=%%a
SET BEGINNING=!P:~0,19!
IF "!BEGINNING!"=="default_folderList=" (
  SET ENDING=!P:~19!
  SET ENDING=!ENDING:~0,-14!
  SET ENDING2=!ENDING:/=\\!
)
)

REM Replace the last root folder name with the new root folder name in the liteide config
CALL liteide_config\jrepl.bat "!ENDING!" "%ROOTDIR%" /F liteide\share\liteide\liteapp\config\liteide.ini /O -
CALL liteide_config\jrepl.bat "!ENDING2!" "%ROOTDIR2%" /F liteide\share\liteide\liteapp\config\liteide.ini /O -
CALL liteide_config\jrepl.bat "!ENDING2:~4!" "%ROOTDIR3:~3%" /F liteide\share\liteide\liteapp\config\liteide.ini /O -

REM Replace the last root folder name with the new root folder name in the environment paths
CALL liteide_config\jrepl.bat "!ENDING2!" "%ROOTDIR3%" /F liteide\share\liteide\liteenv\system.env /O -
)

REM Start LiteIDE
start liteide\bin\liteide.exe