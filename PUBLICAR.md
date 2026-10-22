# Cómo publicar el portfolio

Sitio: https://joaquinfernandez-dev.web.app
Repositorio: https://github.com/Joa6jb/portfolio

## Configuración inicial (una sola vez)
1. Instalá **Git** (https://git-scm.com/download/win) y **Node.js LTS** (https://nodejs.org).
2. Doble clic en `configurar-github.bat` y seguí las indicaciones en pantalla.

## Cada vez que cambies algo
Doble clic en `subir-cambios.bat` (te pide una descripción corta y sube todo).

O, si preferís la terminal:
```
git add .
git commit -m "Describí el cambio"
git pull --rebase
git push
```
GitHub publica la página sola en 1-2 minutos. El progreso se ve en la pestaña **Actions** del repositorio.

## Publicación manual (por si la necesitás)
Doble clic en `publicar.bat`.

## Importante
Si editás algo directamente en la web de GitHub, `subir-cambios.bat` trae esos cambios antes de subir los tuyos, así no se pisan.
