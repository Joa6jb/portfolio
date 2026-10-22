@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo.
echo  === Configurar GitHub + publicacion automatica en Firebase ===
echo.
where git >nul 2>nul
if errorlevel 1 (
  echo  Falta Git. Instalalo desde https://git-scm.com/download/win y volve a ejecutar este archivo.
  pause & exit /b 1
)
where node >nul 2>nul
if errorlevel 1 (
  echo  Falta Node.js. Instalalo desde https://nodejs.org ^(version LTS^) y volve a ejecutar este archivo.
  pause & exit /b 1
)

echo  [1/4] Preparando el repositorio local...
if not exist ".git" git init -b main
git config user.name "Joaquin Fernandez"
git config user.email "joaquinfernandezds@gmail.com"
git add .
git commit -m "Primera version del portfolio" >nul 2>nul
git branch -M main
git remote remove origin >nul 2>nul
git remote add origin https://github.com/Joa6jb/portfolio.git

echo.
echo  [2/4] Subiendo los archivos a GitHub ^(si te pide iniciar sesion, hacelo en la ventana que se abre^)...
git push -u origin main
if errorlevel 1 (
  echo.
  echo  No se pudo subir a GitHub. Copia el error de arriba y pasaselo a Claude.
  pause & exit /b 1
)

echo.
echo  [3/4] Conectando GitHub con Firebase...
echo  ------------------------------------------------------------------
echo   Responde asi a las preguntas que van a aparecer:
echo    - Repositorio:  Joa6jb/portfolio
echo    - "Set up the workflow to run a build script...?"   -^> N
echo    - "...overwrite?" ^(si pregunta por archivos existentes^) -^> N
echo    - "Set up automatic deployment ... when a PR is merged?" -^> Y
echo    - Rama:  main
echo  ------------------------------------------------------------------
call npx -y firebase-tools@latest login
call npx -y firebase-tools@latest init hosting:github --project joaquinfernandez-dev

echo.
echo  [4/4] Guardando la configuracion final en GitHub...
git add .
git commit -m "Publicacion automatica en Firebase" >nul 2>nul
git push

echo.
echo  Listo. Desde ahora, cada "git push" actualiza https://joaquinfernandez-dev.web.app
echo  Podes ver el progreso en https://github.com/Joa6jb/portfolio/actions
pause
