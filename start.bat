@echo off
chcp 65001 >nul
title AurPay - Iraqi Agentic Payments Platform
color 0A
echo.
echo  ============================================================
echo    AurPay  -  أور پاي   (pure Next.js - no Python backend)
echo  ============================================================
echo.
cd /d "%~dp0"
if not exist node_modules (
    echo  [1/2] Installing dependencies ^(first run only^)...
    call npm install
)
echo  [2/2] Starting AurPay on http://localhost:3000 ...
echo.
call npm run dev
pause
