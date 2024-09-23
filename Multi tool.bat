@echo off
chcp 65001 >nul
color 3
cls

set attempts=0
set max_attempts=3

:initialize
cls
title Multi-Tool - Authentication Required
echo.
echo ███╗   ███╗██╗   ██╗██╗     ████████╗██╗        ████████╗ █████╗  █████╗ ██╗
echo ████╗ ████║██║   ██║██║     ╚══██╔══╝██║        ╚══██╔══╝██╔══██╗██╔══██╗██║
echo ██╔████╔██║██║   ██║██║        ██║   ██║  █████╗   ██║   ██║  ██║██║  ██║██║
echo ██║╚██╔╝██║██║   ██║██║        ██║   ██║  ╚════╝   ██║   ██║  ██║██║  ██║██║
echo ██║ ╚═╝ ██║╚██████╔╝███████╗   ██║   ██║           ██║   ╚█████╔╝╚█████╔╝███████╗
echo ╚═╝     ╚═╝ ╚═════╝ ╚══════╝   ╚═╝   ╚═╝           ╚═╝    ╚════╝  ╚════╝ ╚══════╝
echo.
echo Welcome to the vifez multi tool
echo Please log in to proceed.
echo.

set /p username=Enter Username: 
set /p password=Enter Password: 

if "%username%"=="root" if "%password%"=="root" goto welcome
set /a attempts+=1
if %attempts% geq %max_attempts% (
    echo [!] Too many failed attempts! Exiting now...
    timeout 2 >nul
    exit /b
)
echo [!] Incorrect login, please try again. You have %attempts%/%max_attempts% attempts remaining.
pause
goto initialize

:welcome
cls
title Multi-Tool Dashboard
echo.
echo.
echo You have successfully logged in, %username%!
echo Here’s a motivational quote for you:
echo.
call :random_quote
echo.
timeout 3 >nul
goto main_menu

:main_menu
cls
title Multi-Tool - [%username%]
echo ╔═══════════════════════════════════════════════╗
echo ║            Multi-Tool Dashboard               ║
echo ║                                               ║
echo ║    1. Calculator                              ║
echo ║    2. Save a Note                             ║
echo ║    3. View System Information                 ║
echo ║    4. View Credits                            ║
echo ║    5. Exit                                    ║
echo ║                                               ║
echo ╚═══════════════════════════════════════════════╝
echo.
set /p choice=Select an option [%username%]: 

if "%choice%"=="1" goto calculator
if "%choice%"=="2" goto save_note
if "%choice%"=="3" goto system_info
if "%choice%"=="4" goto credits
if "%choice%"=="5" goto exit_tool

echo [!] Invalid choice. Please select a valid option.
timeout 1 >nul
goto main_menu

:calculator
cls
echo ╔═══════════════════════════════════════════════╗
echo ║               Simple Calculator               ║
echo ╚═══════════════════════════════════════════════╝
echo.
set /p calc_expr=Enter expression (e.g., 1231*321): 

for /f "delims=" %%a in ('powershell -command "& {try { [math]::round([double](%calc_expr%), 3) } catch { 'Invalid expression' }}"') do set result=%%a

echo Result: %result%
pause
goto main_menu

:save_note
cls
echo ╔═══════════════════════════════════════════════╗
echo ║                 Save a Note                   ║
echo ╚═══════════════════════════════════════════════╝
echo.
set /p note=Write your note: 
echo %note% >> notes.txt
echo Note saved to "notes.txt".
pause
goto main_menu

:system_info
cls
echo ╔═══════════════════════════════════════════════╗
echo ║             System Information                ║
echo ╚═══════════════════════════════════════════════╝
echo.
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"System Type" /C:"Total Physical Memory"
echo.
pause
goto main_menu

:credits
cls
echo ╔═══════════════════════════════════════════════╗
echo ║                  CREDITS                      ║
echo ║                                               ║
echo ║      This tool was developed by: vifez        ║
echo ║                                               ║
echo ╚═══════════════════════════════════════════════╝
echo.
timeout 3 >nul
goto main_menu

:exit_tool
cls
echo Logging out...
echo (Please wait)
timeout 2 >nul
exit /b

:random_quote
set /a randnum=%random% %% 5
if %randnum%==0 echo "developed by vifez fr."
if %randnum%==1 echo "Put a quote here"
if %randnum%==2 echo "Put a quote here"
if %randnum%==3 echo "Put a quote here"
if %randnum%==4 echo "Put a quote here"