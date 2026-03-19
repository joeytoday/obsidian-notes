# Qwen Code 安装脚本

一个脚本，全平台通用：macOS、Linux、Windows。

## 🚀 统一安装命令

**所有系统使用同一个命令：**

```powershell
powershell -Command "irm https://raw.githubusercontent.com/joeytoday/obsidian-notes/main/qwencode-installer/run.ps1 | iex"
```

### 各平台快捷命令

| 系统 | 命令 |
|------|------|
| **macOS** | `irm https://raw.githubusercontent.com/joeytoday/obsidian-notes/main/qwencode-installer/run.ps1 \| iex` |
| **Linux** | `irm https://raw.githubusercontent.com/joeytoday/obsidian-notes/main/qwencode-installer/run.ps1 \| iex` |
| **Windows (PowerShell)** | `irm https://raw.githubusercontent.com/joeytoday/obsidian-notes/main/qwencode-installer/run.ps1 \| iex` |
| **Windows (CMD)** | `powershell -Command "irm .../run.ps1 \| iex"` |

## 📋 工作原理

```
运行 PowerShell 脚本
    ↓
自动检测平台
    ↓
├── Windows → 下载并执行 install-qwen.bat
├── macOS   → 下载并执行 install-qwen.sh
└── Linux   → 下载并执行 install-qwen.sh
```

## 🔧 环境变量

| 变量名 | 说明 | 默认值 |
|--------|------|--------|
| `QWEN_INSTALL_DIR` | 自定义安装目录 | `~/.qwen` |
| `QWEN_NODE_VERSION` | Node.js 版本 | `20.18.1` |
| `QWEN_NPM_REGISTRY` | npm 镜像源 | `https://registry.npmmirror.com` |

### 使用示例

**macOS / Linux**：
```bash
$env:QWEN_INSTALL_DIR="$HOME/.local"; irm https://raw.githubusercontent.com/joeytoday/obsidian-notes/main/qwencode-installer/run.ps1 | iex
```

**Windows PowerShell**：
```powershell
$env:QWEN_INSTALL_DIR="$HOME\.qwen"; irm https://raw.githubusercontent.com/joeytoday/obsidian-notes/main/qwencode-installer/run.ps1 | iex
```

## 📦 文件说明

| 文件 | 说明 |
|------|------|
| `run.ps1` | ✨ 跨平台 PowerShell 脚本（推荐） |
| `install.ps1` | Windows PowerShell 脚本 |
| `install` | bash 入口脚本（Git Bash/WSL） |

## 🔗 相关链接

- [Qwen Code GitHub](https://github.com/QwenLM/qwen-code)
- [npm 包](https://www.npmjs.com/package/@qwen-code/qwen-code)
- [本仓库](https://github.com/joeytoday/obsidian-notes)
