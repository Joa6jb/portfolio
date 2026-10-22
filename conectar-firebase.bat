@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo.
echo  === Conectar GitHub con Firebase (publicacion automatica) ===
echo.
echo  [1/4] Trayendo la ultima version desde GitHub...
git pull --rebase origin main

echo.
echo  [2/4] Iniciando sesion en Firebase (cuenta joaquinfernandezds@gmail.com)...
call npx -y firebase-tools@latest login

echo.
echo  [3/4] Conectando con GitHub. Se va a abrir el navegador para autorizar
echo        a Firebase en tu cuenta de GitHub: acepta ("Authorize").
echo  ------------------------------------------------------------------
echo   Despues responde asi:
echo    - "For which GitHub repository...?"            -^>  Joa6jb/portfolio
echo    - "...run a build script before every deploy?" -^>  N
echo    - "...automatic deployment ... when a PR is merged?" -^>  Y
echo    - "What is the name of the GitHub branch...?"  -^>  main
echo  ------------------------------------------------------------------
call npx -y firebase-tools@latest init hosting:github --project joaquinfernandez-dev

if not exist ".github\workflows\firebase-hosting-merge.yml" (
  echo.
  echo  No se crearon los archivos de publicacion automatica.
  echo  Copia todo lo que aparece arriba y pasaselo a Claude.
  pause & exit /b 1
)

echo.
echo  [4/4] Subiendo la configuracion a GitHub...
git add .github firebase.json .firebaserc
git commit -m "Publicacion automatica en Firebase"
git push

echo.
echo  Listo. Revisa https://github.com/Joa6jb/portfolio/actions
echo  Desde ahora cada "git push" actualiza https://joaquinfernandez-dev.web.app
pause
