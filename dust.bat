@echo off
title Dota 2 Ping Tester
rem Dota 2 Ping Tester by kradnozd@gmail.com
mode con:cols=55 lines=52
setlocal EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)

:startpinging
cls
call :ColorText 05 "-------------------------------------------------"
echo.
call :ColorText 50 "+   Dust - Dota 2 Ping Tester by @tungkradle    +"
echo.
call :ColorText 05 "-------------------------------------------------"
echo.

echo.
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³      SOUTH EAST ASIA                   Ping  ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
<nul set /p=. SEA Server 1 (Singapore) ............ 
call :Dota2Ping 103.28.54.1
echo.
<nul set /p=. SEA Server 2 (Singapore) ............ 
call :Dota2Ping 103.10.124.1
echo.
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³      EUROPE                            Ping  ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
<nul set /p=. EU West Server (Luxembourg) ......... 
call :Dota2Ping 146.66.152.1
echo.
<nul set /p=. EU East Server (Vienna) ............. 
call :Dota2Ping 146.66.155.1
echo.
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³      RUSSIA                            Ping  ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
<nul set /p=. Russia Server 1 (Stockholm) ......... 
call :Dota2Ping 146.66.156.1
echo.
<nul set /p=. Russia Server 1 (Stockholm) ......... 
call :Dota2Ping 185.25.180.1
echo.
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³      US                                Ping  ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
<nul set /p=. US Server West (Seattle) ............ 
call :Dota2Ping 192.69.96.1
echo.
<nul set /p=. US Server East (Sterling) ........... 
call :Dota2Ping 208.78.164.1
echo.
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³      SOUTH AMERICA                     Ping  ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
<nul set /p=. South America #1 (Sao Paulo) ........ 
call :Dota2Ping gru.valve.net
echo.
<nul set /p=. South America #2 (Sao Paulo) ........ 
call :Dota2Ping 209.197.29.1
echo.
<nul set /p=. South America #3 (Sao Paulo) ........ 
call :Dota2Ping 209.197.25.1
echo.
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³      CHINA                             Ping  ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
<nul set /p=. Perfect World (Telecom) ............. 
call :Dota2Ping 183.136.230.1
echo.
<nul set /p=. Perfect World (Unicom) .............. 
call :Dota2Ping 61.182.135.1
echo.
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³      AUSTRALIA                         Ping  ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
<nul set /p=. Australia Server (Sydney) ........... 
call :Dota2Ping 103.10.125.1
echo.
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³      SOUTH AFRICA                      Ping  ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
<nul set /p=. South Africa #1 (Cape Town) ......... 
call :Dota2Ping cpt-1.valve.net
echo.
<nul set /p=. South Africa #2 (Cape Town) ......... 
call :Dota2Ping 197.80.200.1
echo.
<nul set /p=. South Africa #3 (Johannesburg) ...... 
call :Dota2Ping 196.38.180.1
echo.
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³      DUBAI                             Ping  ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
<nul set /p=. Dubai Server (UAE) .................. 
call :Dota2Ping dxb.valve.net
echo.

echo.
set choice=
set /p choice="Do you want to restart pinging? (Y/N)"
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='y' goto startpinging
if '%choice%'=='Y' goto startpinging
goto :eof

:ColorText
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
goto :eof

:Dota2Ping
set ms=Error
for /f "tokens=4 delims=ms=" %%i in ('ping.exe -n 1 %1 ^| find "Average"') do set ms=%%i
if %ms% lss 100 ( 
	call :ColorText 0a %ms%
	call :ColorText 0a "ms"
) 
if %ms% geq 100 (
	if %ms% lss 250 (
		call :ColorText 0e %ms%
		call :ColorText 0e "ms"
	)
	if %ms% gtr 250 (
		if %ms%==Error (
			call :ColorText 0c "Failed"
		) else (
			call :ColorText 0c %ms%
			call :ColorText 0c "ms"
		)
	)
)
goto :eof