#
# Qwen Code Universal Installer
# One command for all platforms: macOS, Linux, Windows
#
# Usage:
#   powershell -Command "irm https://raw.githubusercontent.com/joeytoday/obsidian-notes/main/qwencode-installer/run.ps1 | iex"
#
# On macOS/Linux with PowerShell Core:
#   irm https://raw.githubusercontent.com/joeytoday/obsidian-notes/main/qwencode-installer/run.ps1 | iex
#

$ErrorActionPreference = "Stop"
$ProgressPreference = "SilentlyContinue"

$BASE_URL = "https://qwen-code-assets.oss-cn-hangzhou.aliyuncs.com/installation"

# Detect platform
$os = $null
if ($PSVersionTable.PSVersion.Major -ge 6) {
    $os = $PSVersionTable.OS
}

Write-Host ""
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "   Qwen Code Installer" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""

# Detect platform
if ($os -like "*Windows*") {
    $platform = "windows"
    Write-Host "ℹ️  Windows detected" -ForegroundColor Blue
} elseif ($os -like "*Darwin*") {
    $platform = "mac"
    Write-Host "ℹ️  macOS detected" -ForegroundColor Blue
} elseif ($os -like "*Linux*") {
    $platform = "linux"
    Write-Host "ℹ️  Linux detected" -ForegroundColor Blue
} else {
    # Fallback detection
    if ($env:OS -eq "Windows_NT") {
        $platform = "windows"
        Write-Host "ℹ️  Windows detected (fallback)" -ForegroundColor Blue
    } else {
        $platform = "unknown"
        Write-Host "❌ Unknown platform" -ForegroundColor Red
        exit 1
    }
}

Write-Host ""

# Execute platform-specific installer
if ($platform -eq "windows") {
    Write-Host "ℹ️  Running Windows installer..." -ForegroundColor Blue
    Write-Host ""
    
    try {
        $tempFile = "$env:TEMP\install-qwen.bat"
        Invoke-WebRequest -Uri "${BASE_URL}/install-qwen.bat" -OutFile $tempFile -UseBasicParsing
        Write-Host "✅ Downloaded installer" -ForegroundColor Green
        Write-Host ""
        & $tempFile
    } catch {
        Write-Host "❌ Installation failed: $_" -ForegroundColor Red
        exit 1
    }
}
elseif ($platform -eq "mac" -or $platform -eq "linux") {
    Write-Host "ℹ️  Running bash installer..." -ForegroundColor Blue
    Write-Host ""
    
    try {
        $tempFile = "/tmp/install-qwen.sh"
        Invoke-WebRequest -Uri "${BASE_URL}/install-qwen.sh" -OutFile $tempFile -UseBasicParsing
        Write-Host "✅ Downloaded installer" -ForegroundColor Green
        Write-Host ""
        
        # Make executable and run
        chmod +x $tempFile
        & bash $tempFile
    } catch {
        Write-Host "❌ Installation failed: $_" -ForegroundColor Red
        exit 1
    }
}

Write-Host ""
Write-Host "==========================================" -ForegroundColor Green
Write-Host "   Installation Complete!" -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor Green
Write-Host ""
