@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo.
echo  === Publicar portfolio en Firebase Hosting ===
echo.
where node >nul 2>nul
if errorlevel 1 (
  echo  Falta Node.js. Instalalo desde https://nodejs.org ^(version LTS^) y volve a ejecutar este archivo.
  pause
  exit /b 1
)
echo  1/2 Iniciando sesion en Firebase ^(se abre el navegador si hace falta^)...
call npx -y firebase-tools@latest login
echo.
echo  2/2 Publicando la pagina...
call npx -y firebase-tools@latest deploy --only hosting
echo.
echo  Listo. Tu pagina: https://joaquinfernandez-dev.web.app
pause
