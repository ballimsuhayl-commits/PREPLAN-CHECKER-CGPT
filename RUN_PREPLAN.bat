@echo off
setlocal enabledelayedexpansion
cd /d "%~dp0"

echo ================================
echo UDG Pre-Plan Submission Checker
echo ================================

REM Ensure Node is available
where node >nul 2>&1
if errorlevel 1 (
  echo ERROR: Node.js is not installed or not on PATH.
  echo Install Node.js LTS and try again.
  pause
  exit /b 1
)

REM Install dependencies once
if not exist "node_modules" (
  echo Installing dependencies (first run only)...
  call npm install
  if errorlevel 1 (
    echo ERROR: npm install failed.
    pause
    exit /b 1
  )
)

echo Starting server...
start "" "http://127.0.0.1:5174"
call npm run start
pause
