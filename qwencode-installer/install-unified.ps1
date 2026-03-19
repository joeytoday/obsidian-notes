#
# Qwen Code Installer for Windows
# PowerShell script for Windows 10/11
#
# Usage:
#   irm https://qwen.ai/install.ps1 | iex
#   irm https://qwen.ai/install.ps1 | iex; qwen
#
# Environment variables:
#   $env:QWEN_INSTALL_DIR    - Custom installation directory (default: ~\.qwen)
#   $env:QWEN_NODE_VERSION   - Node.js version (default: 20.18.1)
#   $env:QWEN_NPM_REGISTRY   - npm registry (default: https://registry.npmmirror.com)
#

$ErrorActionPreference = "Stop"
$ProgressPreference = "SilentlyContinue"

# Configuration
$DefaultNodeVersion = "20.18.1"
$DefaultNpmRegistry = "https://registry.npmmirror.com"
$InstallerVersion = "1.0.0"

# Logging functions
function Write-Info($msg) { Write-Host "ℹ️  $msg" -ForegroundColor Blue }
function Write-Success($msg) { Write-Host "✅ $msg" -ForegroundColor Green }
function Write-Warn($msg) { Write-Host "⚠️  $msg" -ForegroundColor Yellow }
function Write-Err($msg) { Write-Host "❌ $msg" -ForegroundColor Red; exit 1 }

# Detect architecture
function Get-Architecture {
    $arch = [System.Runtime.InteropServices.RuntimeInformation]::OSArchitecture
    switch ($arch) {
        "Arm64" { return "arm64" }
        "X64"   { return "x64" }
        "X86"   { return "x86" }
        default { return "x64" }
    }
}

# Check if Node.js 20+ is installed
function Test-NodeJS {
    try {
        $version = (node -v 2>$null) -replace 'v', ''
        $major = [int]($version -split '\.')[0]
        if ($major -ge 20) {
            return $version
        }
    } catch {}
    return $null
}

# Install Node.js
function Install-NodeJS {
    $arch = Get-Architecture
    $version = if ($env:QWEN_NODE_VERSION) { $env:QWEN_NODE_VERSION } else { $DefaultNodeVersion }
    $installDir = if ($env:QWEN_INSTALL_DIR) { $env:QWEN_INSTALL_DIR } else { "$env:USERPROFILE\.qwen" }
    $nodeDir = Join-Path $installDir "node"
    
    Write-Info "Installing Node.js v$version for Windows/$arch..."
    
    # Download URL
    $url = "https://nodejs.org/dist/v${version}/node-v${version}-win-${arch}.zip"
    $zipFile = Join-Path $env:TEMP "node.zip"
    $extractDir = Join-Path $env:TEMP "node-extract"
    
    # Download
    Write-Info "Downloading from $url..."
    try {
        Invoke-WebRequest -Uri $url -OutFile $zipFile -UseBasicParsing
    } catch {
        Write-Err "Failed to download Node.js: $_"
    }
    
    # Extract
    Write-Info "Extracting..."
    try {
        New-Item -ItemType Directory -Force -Path $extractDir | Out-Null
        Expand-Archive -Path $zipFile -DestinationPath $extractDir -Force
        
        # Move to install directory
        New-Item -ItemType Directory -Force -Path $nodeDir | Out-Null
        $extractedFolder = Join-Path $extractDir "node-v${version}-win-${arch}"
        Get-ChildItem -Path $extractedFolder | ForEach-Object {
            Move-Item -Path $_.FullName -Destination $nodeDir -Force
        }
    } catch {
        Write-Err "Failed to extract Node.js: $_"
    }
    
    # Cleanup
    Remove-Item $zipFile -Force -ErrorAction SilentlyContinue
    Remove-Item $extractDir -Recurse -Force -ErrorAction SilentlyContinue
    
    # Add to PATH
    $env:Path = "$nodeDir;$env:Path"
    
    # Verify
    $nodeExe = Join-Path $nodeDir "node.exe"
    if (Test-Path $nodeExe) {
        $installedVersion = & $nodeExe -v
        Write-Success "Node.js $installedVersion installed to $nodeDir"
    } else {
        Write-Err "Node.js installation failed"
    }
    
    # Add to user PATH permanently
    Add-ToPath $nodeDir
    
    return $nodeDir
}

# Add directory to user PATH
function Add-ToPath($dir) {
    $userPath = [Environment]::GetEnvironmentVariable("Path", "User")
    if ($userPath -notlike "*$dir*") {
        [Environment]::SetEnvironmentVariable("Path", "$dir;$userPath", "User")
        Write-Info "Added $dir to user PATH"
    }
}

# Install Qwen Code
function Install-QwenCode {
    $registry = if ($env:QWEN_NPM_REGISTRY) { $env:QWEN_NPM_REGISTRY } else { $DefaultNpmRegistry }
    $installDir = if ($env:QWEN_INSTALL_DIR) { $env:QWEN_INSTALL_DIR } else { "$env:USERPROFILE\.qwen" }
    
    Write-Info "Installing Qwen Code..."
    
    # Find npm
    $npm = Get-Command npm -ErrorAction SilentlyContinue
    if (-not $npm) {
        $nodeDir = Join-Path $installDir "node"
        $npmCmd = Join-Path $nodeDir "npm.cmd"
        if (Test-Path $npmCmd) {
            $npm = $npmCmd
        } else {
            Write-Err "npm not found. Node.js installation may have failed."
        }
    }
    
    # Set npm prefix if needed
    $npmPrefix = npm config get prefix 2>$null
    if (-not $npmPrefix -or $npmPrefix -match "error" -or $npmPrefix -eq "C:\Program Files\nodejs") {
        $userPrefix = Join-Path $installDir "npm-global"
        New-Item -ItemType Directory -Force -Path $userPrefix | Out-Null
        npm config set prefix $userPrefix
        $env:Path = "$userPrefix;$env:Path"
        Add-ToPath $userPrefix
        Write-Info "npm global packages will be installed to $userPrefix"
    }
    
    # Install
    try {
        & npm install -g "@qwen-code/qwen-code@latest" --registry $registry
        Write-Success "Qwen Code installed successfully!"
    } catch {
        Write-Err "Failed to install Qwen Code: $_"
    }
    
    # Verify
    $qwen = Get-Command qwen -ErrorAction SilentlyContinue
    if ($qwen) {
        $version = & qwen --version 2>$null
        Write-Success "Qwen Code version: $version"
    } else {
        Write-Warn "qwen command not found in PATH. You may need to restart your terminal."
    }
}

# Show help
function Show-Help {
    Write-Host @"
Qwen Code Installer for Windows v$InstallerVersion

Usage:
  irm https://qwen.ai/install.ps1 | iex

Options:
  -SkipNode       Skip Node.js installation
  -Help           Show this help message
  -Version        Print installer version

Environment Variables:
  `$env:QWEN_INSTALL_DIR    Custom installation directory (default: ~\.qwen)
  `$env:QWEN_NODE_VERSION   Node.js version (default: $DefaultNodeVersion)
  `$env:QWEN_NPM_REGISTRY   npm registry (default: $DefaultNpmRegistry)

Examples:
  # Standard installation
  irm https://qwen.ai/install.ps1 | iex

  # Skip Node.js installation
  irm https://qwen.ai/install.ps1 | iex; qwen

Supported Platforms:
  - Windows 10/11 (x64, arm64)

For more information, visit: https://github.com/QwenLM/qwen-code
"@
}

# Main
function Main {
    param(
        [switch]$SkipNode,
        [switch]$Help,
        [switch]$Version
    )
    
    if ($Help) { Show-Help; exit 0 }
    if ($Version) { Write-Host "Qwen Code Installer v$InstallerVersion"; exit 0 }
    
    # Header
    Write-Host ""
    Write-Host "=========================================="
    Write-Host "   Qwen Code Installer for Windows"
    Write-Host "=========================================="
    Write-Host ""
    
    # Platform info
    $arch = Get-Architecture
    Write-Info "Platform: windows/$arch"
    Write-Info "PowerShell: $($PSVersionTable.PSVersion)"
    
    # Check/install Node.js
    if ($SkipNode) {
        Write-Info "Skipping Node.js installation (-SkipNode)"
    } else {
        $nodeVersion = Test-NodeJS
        if ($nodeVersion) {
            Write-Success "Node.js v$nodeVersion found"
        } else {
            Write-Warn "Node.js 20+ not found"
            Install-NodeJS
        }
    }
    
    # Install Qwen Code
    Write-Host ""
    Install-QwenCode
    
    # Done
    Write-Host ""
    Write-Host "=========================================="
    Write-Success "Installation complete!"
    Write-Host "=========================================="
    Write-Host ""
    Write-Host "To start using Qwen Code:"
    Write-Host ""
    Write-Host "  qwen"
    Write-Host ""
    Write-Host "If the 'qwen' command is not found, restart your terminal."
    Write-Host ""
}

# Run
Main @args