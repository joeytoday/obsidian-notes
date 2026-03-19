#
# Qwen Code Universal Installer for Windows
# Usage: irm https://raw.githubusercontent.com/joeytoday/obsidian-notes/main/qwencode-installer/install.ps1 | iex
#

$ErrorActionPreference = "Stop"
$ProgressPreference = "SilentlyContinue"

$BASE_URL = "https://qwen-code-assets.oss-cn-hangzhou.aliyuncs.com/installation"

Write-Host "ℹ️  Downloading Windows installer..." -ForegroundColor Blue

try {
    # Download and execute the batch installer
    $installerUrl = "${BASE_URL}/install-qwen.bat"
    $tempFile = "$env:TEMP\install-qwen.bat"
    
    # Download using Invoke-WebRequest
    Invoke-WebRequest -Uri $installerUrl -OutFile $tempFile -UseBasicParsing
    
    Write-Host "✅ Downloaded installer: $tempFile" -ForegroundColor Green
    Write-Host ""
    Write-Host "ℹ️  Running installer..." -ForegroundColor Blue
    Write-Host ""
    
    # Execute the batch file
    & $tempFile
    
} catch {
    Write-Host "❌ Installation failed: $_" -ForegroundColor Red
    exit 1
}
