@echo off
rem **************************************************************
rem  on command prompt navigate to your save file location
rem  .\download.bat ibmi.example.com bob mypassword library saveFileName.savf
rem **************************************************************
set TEMPFILE=download.fts
set HOST=%1
set USER=%2
set PASS=%3
set LIB=%4
set SAVF=%5
if "%HOST%"=="" goto usage
if "%USER%"=="" goto usage
if "%PASS%"=="" goto usage
if "%LIB%"=="" goto usage
if "%SAVF%"=="" goto usage
echo %USER%> %TEMPFILE%
echo %PASS%>> %TEMPFILE%
echo quote site namefmt 1 >> %TEMPFILE%
echo cd /QSYS.LIB/QGPL.LIB >> %TEMPFILE%
echo quote site namefmt 0 >> %TEMPFILE%
echo cd %LIB%>> %TEMPFILE%
echo bin>> %TEMPFILE%
echo get %SAVF% %SAVF% >> %TEMPFILE%
echo quit >> %TEMPFILE%
ftp -s:%TEMPFILE% %HOST%
del %TEMPFILE%
goto end
:usage	
echo.
echo USAGE: upload HOST USERID PASSWORD LIBRARY SAVF
echo.
echo      HOST = FTP host you want to upload to (as400.example.com)
echo    USERID = UserID to log in with
echo  PASSWORD = Password to log in with
echo.
:end
