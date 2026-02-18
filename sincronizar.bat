@echo off
chcp 65001 >nul
cls

echo.
echo ═══════════════════════════════════════════════════════════════════════════════
echo   🚀 SINCRONIZAR PROJETO COM GOOGLE DRIVE
echo ═══════════════════════════════════════════════════════════════════════════════
echo.

REM Verificar se Python está instalado
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Python não foi encontrado!
    echo.
    echo ✅ SOLUÇÃO:
    echo    1. Baixe Python em: https://www.python.org/downloads/
    echo    2. Instale (marque "Add Python to PATH")
    echo    3. Execute este script novamente
    echo.
    pause
    exit /b 1
)

REM Executar script Python
python "%~dp0sincronizar.py"

if errorlevel 1 (
    echo.
    echo ❌ Erro durante sincronização
    pause
    exit /b 1
)

echo.
pause
