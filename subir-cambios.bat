@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo.
echo  === Subir cambios a GitHub (y publicar en la pagina) ===
echo.
set "MSG="
set /p MSG= Describi brevemente el cambio (Enter = "Actualizacion del portfolio"): 
if "%MSG%"=="" set "MSG=Actualizacion del portfolio"

git add -A
git commit -m "%MSG%"

echo.
echo  Trayendo cambios hechos desde GitHub...
git pull --rebase origin main
if errorlevel 1 (
  echo.
  echo  Hubo un conflicto al combinar los cambios. Copia lo de arriba y pasaselo a Claude.
  git rebase --abort >nul 2>nul
  pause & exit /b 1
)

echo.
echo  Subiendo a GitHub...
git push origin main
if errorlevel 1 (
  echo.
  echo  No se pudo subir. Copia lo de arriba y pasaselo a Claude.
  pause & exit /b 1
)

echo.
echo  Listo. En 1-2 minutos se actualiza https://joaquinfernandez-dev.web.app
echo  Progreso: https://github.com/Joa6jb/portfolio/actions
pause
