@echo off
REM ======================================================================
REM   CSV MERGER - INTERACTIVE MODE
REM ======================================================================

setlocal enabledelayedexpansion

REM Setup merge vault
set VAULT=%~dp0merge_vault
if not exist "%VAULT%" mkdir "%VAULT%"

REM Check Python once at startup
python --version >nul 2>&1
if errorlevel 1 (
    cls
    echo.
    echo ======================================================================
    echo   ERROR: Python not found!
    echo ======================================================================
    echo.
    echo Please install Python 3.x from: https://www.python.org/downloads/
    echo Make sure to check "Add Python to PATH" during installation
    echo.
    pause
    exit /b 1
)

:MAIN_LOOP
cls
echo.
echo ======================================================================
echo   CSV MERGER
echo ======================================================================
echo.
echo Drag a folder into this window and press Enter...
echo (or type the path manually)
echo.
echo Type 'exit' to quit
echo.
echo ----------------------------------------------------------------------
echo.
set /p INPUT_PATH="Folder path: "

REM Remove quotes and extra spaces
set INPUT_PATH=%INPUT_PATH:"=%
set INPUT_PATH=%INPUT_PATH:  = %

REM Fix missing drive letter (common when dragging into CMD)
REM If path starts with :\ then prepend C
if "%INPUT_PATH:~0,2%"==":\" set INPUT_PATH=C%INPUT_PATH%
REM If path starts with :\Users then prepend C
if "%INPUT_PATH:~0,7%"==":\Users" set INPUT_PATH=C%INPUT_PATH%

REM Check for exit
if /i "%INPUT_PATH%"=="exit" (
    echo.
    echo Goodbye!
    timeout /t 2 >nul
    exit /b 0
)

REM Check if path is empty
if "%INPUT_PATH%"=="" (
    echo.
    echo ERROR: No path provided!
    timeout /t 2 >nul
    goto MAIN_LOOP
)

REM Check if path exists
if not exist "%INPUT_PATH%" (
    echo.
    echo ERROR: Path not found!
    echo.
    echo Tried: %INPUT_PATH%
    echo.
    echo TIP: Right-click the folder and copy path, then paste here
    echo.
    pause
    goto MAIN_LOOP
)

REM Check if it's a folder
if not exist "%INPUT_PATH%\*" (
    echo.
    echo ERROR: This is not a folder. Please drag a FOLDER.
    echo.
    pause
    goto MAIN_LOOP
)

:FOLDER_SCAN
echo.
echo ======================================================================
echo   SCANNING FOLDER...
echo ======================================================================
echo.
echo Folder: %INPUT_PATH%
echo.

REM Count CSV files
set COUNT=0

for /f "delims=" %%F in ('dir /b "%INPUT_PATH%\*.csv" 2^>nul') do (
    set /a COUNT+=1
    echo [!COUNT!] %%F
)

echo.
echo ----------------------------------------------------------------------

if %COUNT%==0 (
    echo.
    echo No CSV files found in this folder!
    echo.
    echo Please make sure the folder contains .csv files
    echo.
    pause
    goto MAIN_LOOP
)

echo.
echo ======================================================================
echo   *** YOU ARE ABOUT TO MERGE ALL THESE FILES INTO ONE ***
echo ======================================================================
echo.
echo   Total CSV files found: %COUNT%
echo.
echo   All files will be combined into a single mega CSV file
echo   with one header and all data rows merged together.
echo.
echo ----------------------------------------------------------------------
echo.
set /p CONFIRM="Continue with merge? (Y/N): "

if /i not "%CONFIRM%"=="Y" (
    echo.
    echo Merge cancelled.
    timeout /t 2 >nul
    goto MAIN_LOOP
)

echo.
echo ======================================================================
echo   STARTING MERGE...
echo ======================================================================
echo.

REM Create timestamped output folder
for /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c%%a%%b)
for /f "tokens=1-2 delims=/: " %%a in ('time /t') do (set mytime=%%a%%b)
set mytime=%mytime: =0%
set OUTPUT_FOLDER=%VAULT%\%mydate%_%mytime%
mkdir "%OUTPUT_FOLDER%" 2>nul

REM Merge all files
python "%~dp0csv_merger.py" -d "%INPUT_PATH%" -o "%OUTPUT_FOLDER%\MERGED_ALL.csv" -v
if errorlevel 1 (
    echo.
    echo ERROR: Merge failed!
    pause
    goto MAIN_LOOP
)

echo.
echo ======================================================================
echo   *** MERGE COMPLETE! ***
echo ======================================================================
echo.
echo   ^>^>^>  ALL FILES MERGED SUCCESSFULLY!  ^<^<^<
echo.
echo   Output: merge_vault\%mydate%_%mytime%\
echo   Files: %COUNT%
echo.
echo   Made with love by ringmast4r ^<3
echo.
echo ======================================================================
echo.
start "" "%OUTPUT_FOLDER%"
echo ----------------------------------------------------------------------
echo What next?
echo.
echo   1. Merge ANOTHER folder
echo   2. Exit
echo.
set /p NEXT="Enter choice (1-2): "

if "%NEXT%"=="2" (
    echo.
    echo Goodbye!
    timeout /t 2 >nul
    exit /b 0
)

goto MAIN_LOOP
