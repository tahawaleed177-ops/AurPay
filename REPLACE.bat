@echo off
REM ============================================================
REM  AurPay update cleanup - run ONCE after extracting 2.zip
REM  over your project folder (from the project root).
REM  Removes files made obsolete by the pure-Next.js port.
REM ============================================================
cd /d "%~dp0"
echo.
echo   Cleaning up obsolete files...
echo.
if exist "src\app\api\[...path]" (
    rmdir /s /q "src\app\api\[...path]"
    echo     removed  src\app\api\[...path]        ^(old localhost:8000 proxy^)
)
if exist "src\app\api\internal\spawn-backend" (
    rmdir /s /q "src\app\api\internal\spawn-backend"
    echo     removed  src\app\api\internal\spawn-backend  ^(Python spawner^)
)
if exist "src\lib\db.ts" (
    del /q "src\lib\db.ts"
    echo     removed  src\lib\db.ts               ^(unused prisma stub^)
)
if exist "bun.lock" (
    del /q "bun.lock"
    echo     removed  bun.lock                     ^(regenerated on next install^)
)
echo.
echo   Done! Now run:
echo       npm install    then    npm run dev
echo    ^(or:  bun install   then   bun run dev^)
echo.
echo   Browser: http://localhost:3000
echo.
pause
