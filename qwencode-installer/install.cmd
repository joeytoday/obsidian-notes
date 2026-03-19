@echo off
REM Qwen Code Universal Installer for Windows CMD
REM Usage: curl -fsSL https://raw.githubusercontent.com/joeytoday/obsidian-notes/main/qwencode-installer/install.cmd | cmd
REM Or directly: irm https://raw.githubusercontent.com/joeytoday/obsidian-notes/main/qwencode-installer/install.cmd | iex

setlocal enabledelayedexpansion

set "BASE_URL=https://qwen-code-assets.oss-cn-hangzhou.aliyuncs.com/installation"

echo.
echo ==========================================
echo    Qwen Code Installer for Windows
echo ==========================================
echo.
echo ℹ️  Downloading installer...

REM Download batch file to temp
curl -fsSL -o "%TEMP%\install-qwen.bat" "%BASE_URL%/install-qwen.bat"

if exist "%TEMP%\install-qwen.bat" (
    echo ✅ Downloaded: %TEMP%\install-qwen.bat
    echo.
    echo ℹ️  Running installer...
    echo.
    call "%TEMP%\install-qwen.bat"
) else (
    echo ❌ Failed to download installer
    echo.
    echo Please try manually:
    echo   curl -fsSL -o %%TEMP%%\install-qwen.bat %BASE_URL%/install-qwen.bat ^&^& %%TEMP%%\install-qwen.bat
    exit /b 1
)
