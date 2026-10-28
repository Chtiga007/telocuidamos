@echo off
echo ======================================================
echo   Subiendo TeLoCuidamos.com a GitHub (@Chtiga007)
echo ======================================================
echo.
cd /d "%~dp0"
echo 1. Verificando repositorio...
git remote -v
echo.
echo 2. Enviando archivos a https://github.com/Chtiga007/telocuidamos ...
echo (Si es la primera vez, se abrira una ventana para iniciar sesion en GitHub)
echo.
git push -u origin main
echo.
if %ERRORLEVEL% EQU 0 (
    echo ======================================================
    echo   EXITO: Tu proyecto ya esta disponible en GitHub!
    echo   https://github.com/Chtiga007/telocuidamos
    echo ======================================================
) else (
    echo.
    echo ATENCION:
    echo Asegurate de haber creado el repositorio vacio llamado 'telocuidamos' en:
    echo https://github.com/new
    echo (Sin README, sin licencia, repositorio vacio)
)
echo.
pause
