@echo off
chcp 65001 >nul
echo ============================================
echo   Cai dat: Tu dong chay khi mo may tinh
echo ============================================
echo.
powershell -NoProfile -Command "$s=(New-Object -COM WScript.Shell).CreateShortcut('%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\QuanLyHoSoNVQS.lnk'); $s.TargetPath='%~dp0dist\QuanLyHoSoNVQS.exe'; $s.WorkingDirectory='%~dp0dist'; $s.WindowStyle=7; $s.Description='He thong Quan ly Ho so NVQS'; $s.Save()"
if %errorlevel%==0 (
  echo.
  echo    Da cai dat thanh cong!
  echo    Tu lan mo may tiep theo, phan mem se tu dong chay ngam.
  echo    Ban chi can mo trinh duyet vao http://localhost:3000 la dung duoc.
) else (
  echo.
  echo    Co loi xay ra. Vui long thu lai hoac lien he ho tro.
)
echo.
pause
