@echo off
echo Verificando version de Python...

python --version 2>nul
if errorlevel 1 (
    echo Error: Python no esta instalado
    pause
    exit /b 1
)

python -c "import sys; assert sys.version_info >= (3,12), 'Python 3.12 o superior es requerido'" 2>nul
if errorlevel 1 (
    echo Error: Se requiere Python 3.12 o superior
    echo Version actual:
    python --version
    pause
    exit /b 1
)

echo Instalando librerias para algoritmos de optimizacion...

:: Actualizar pip
echo Actualizando pip...
python -m pip install --upgrade pip

:: Instalar requisitos
echo Instalando requisitos...
pip install -r requirements.txt

:: Verificar instalación
echo Verificando instalacion...
python -c "import numpy; import scipy; import pymoo; import matplotlib; import plotly; print('Instalacion exitosa!')"

if errorlevel 1 (
    echo Error: La verificacion fallo.
    echo Por favor, revisa los mensajes de error anteriores.
    pause
    exit /b 1
)

echo.
echo Instalacion completada exitosamente!
echo.
pause