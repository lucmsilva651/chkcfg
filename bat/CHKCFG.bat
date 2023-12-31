@echo off
chcp 65001 >nul

rem startup
title CHKCFG [User: %USERNAME%]
echo 	CHKCFG [User: %USERNAME%]
echo 	2023 Lucas Gabriel (lucmsilva)
echo 	-------------------------------------------------
echo 	This project is in development. Incompatibilities can occur.
echo 	If the program crashes past this screen, your Windows system
echo 	isn't compatible with some method that I use to collect
echo 	system data. Sorry for the inconvenience. But, if it works,
echo 	give me a feedback sending a message on Telegram:
echo 	https://t.me/lucmsilva651.
echo 	-------------------------------------------------
echo 	Wait 20 seconds or press any key to continue.
timeout /t 20 >nul
goto collect

:collect
rem importing data from wmic
echo.
echo 	Collecting data via wmic
FOR /F "tokens=2 delims='='" %%A in ('wmic BASEBOARD GET SERIALNUMBER /value') do SET serialnumber=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic BASEBOARD GET MANUFACTURER /value') do SET manufacturer=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic OS GET NAME /value') do SET osname=%%A
FOR /F "tokens=1 delims='|'" %%A in ("%OSNAME%") do SET osname=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic COMPUTERSYSTEM GET MODEL /value') do SET model=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic CSPRODUCT GET VERSION /value') do SET secmodel=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic BIOS GET SMBIOSBIOSVersion /value') do SET biosver=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic COMPUTERSYSTEM GET SYSTEMTYPE /value') do SET systype=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic BASEBOARD GET PRODUCT /value') do SET mbproduct=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic BASEBOARD GET VERSION /value') do SET mbvariant=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic OS GET WINDOWSDIRECTORY /value') do SET windowsdir=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic OS GET VERSION /value') do SET windowsver=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic CPU GET NAME /value') do SET cpuname=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic CPU GET NUMBEROFCORES /value') do SET cpucores=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic CPU GET NUMBEROFLOGICALPROCESSORS /value') do SET cputhreads=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic CPU GET VIRTUALIZATIONFIRMWAREENABLED /value') do SET virtenabled=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic CPU GET CURRENTCLOCKSPEED /value') do SET cpuclock=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic MEMORYCHIP GET SPEED /value') do SET ramclock=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic MEMORYCHIP GET CAPACITY /value') do SET rambytes=%%A
echo 	OK
goto main

rem main update code
:main
cls
echo.
echo 	CHKCFG [User: %USERNAME%]
echo 	2023 Lucas Gabriel (lucmsilva)
echo 	-------------------------------------------------
echo 	Main computer info: [Updates every ~1 sec.]
echo.
echo 	Date + Time: %DATE% ▪ %TIME%
echo 	Username: %USERNAME% ▪ Path: %USERPROFILE%
echo 	Computer name: %COMPUTERNAME%
echo 	Manufacturer: %MANUFACTURER% ▪ Model: %MODEL%
echo 	2nd model: %secmodel%
echo 	Serial number: %SERIALNUMBER% ▪ BIOS Version: %BIOSVER%
echo 	Motherboard model: %MBPRODUCT% ▪ Variant: %MBVARIANT%
echo 	System drive: %SystemDrive%\ ▪ System Root: %WINDOWSDIR%
echo 	Program Files: %ProgramFiles% ▪ %ProgramFiles(x86)%
echo 	Operating system: %OSNAME% ▪ Version: %WINDOWSVER%
echo 	CPU name: %CPUNAME%
echo 	Number of cores: %CPUCORES% ▪ Threads: %CPUTHREADS%
echo 	System type: %SYSTYPE% ▪ Virtualization: %VIRTENABLED%
echo 	CPU clock: %CPUCLOCK% MHz
echo 	CPU identifier: %PROCESSOR_IDENTIFIER%
echo 	RAM size: %RAMBYTES% bytes ▪ Clock: %RAMCLOCK% MHz
echo 	-------------------------------------------------

timeout /t 1 /nobreak >nul
goto main