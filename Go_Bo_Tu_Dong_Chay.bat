@echo off
chcp 65001 >nul
echo ============================================
echo   Go bo: Tu dong chay khi mo may tinh
echo ============================================
echo.
if exist "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\QuanLyHoSoNVQS.lnk" (
  del "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\QuanLyHoSoNVQS.lnk"
  echo    Da go bo tu dong chay.
) else (
  echo    Chua cai dat tu dong chay tren may nay.
)
echo.
pause
