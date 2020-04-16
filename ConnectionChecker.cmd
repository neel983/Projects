@echo off
del Hi.txt
color 0a
set /p t=Set waiting time in seconds:
:start

ping -t 10.15.109.1 -n 1 >pingResult.txt
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
start wmplayer.exe "./CoonectionEstablished.mp3"
exit