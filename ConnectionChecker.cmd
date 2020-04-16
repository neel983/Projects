@echo off
del Hi.txt
color 0a
set /p address=<Readme.md
set /p t=Set waiting time in seconds:
:start
ping -t %address% -n 1 >pingResult.txt
FOR /F "tokens=2 skip=2" %%v IN (pingResult.txt) DO echo %%v>>Hi.txt
set /p d=<Hi.txt
if "%d%" == "from" goto Found
goto error
exit

:error
del Hi.txt
timeout /T %t% /NOBREAK
cls
goto start

:Found
CoonectionEstablished.mp3
exit