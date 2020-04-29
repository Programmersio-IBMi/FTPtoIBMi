@echo off
rem **************************************************************
rem  on command prompt navigate to your save file location
rem  .\upload.bat ibmi.example.com bob mypassword saveFileName.savf
rem **************************************************************
set TEMPFILE=restore.fts
set HOST=%1
set USER=%2
set PASS=%3
set SAVF=%4
set LIB=restore
if "%HOST%"=="" goto usage
if "%USER%"=="" goto usage
if "%PASS%"=="" goto usage
echo %USER%> %TEMPFILE%
echo %PASS%>> %TEMPFILE%
echo quote site namefmt 1 >> %TEMPFILE%
echo cd /QSYS.LIB/QGPL.LIB >> %TEMPFILE%
echo quote site namefmt 0 >> %TEMPFILE%
echo quote crtl %LIB%>> %TEMPFILE%
echo cd %LIB%>> %TEMPFILE%
echo bin>> %TEMPFILE%
echo quote rcmd CRTSAVF FILE(%LIB%/%SAVF%) >> %TEMPFILE%
echo put %SAVF% %SAVF% >> %TEMPFILE%
echo quit >> %TEMPFILE%
ftp -s:%TEMPFILE% %HOST%
del %TEMPFILE%
goto end
:	
echo.
echo USAGE: upload HOST USERID PASSWORD
echo.
echo      HOST = FTP host you want to upload to (as400.example.com)
echo    USERID = UserID to log in with
echo  PASSWORD = Password to log in with
echo.
:end
