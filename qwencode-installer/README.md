# Qwen Code 安装脚本

一行命令，全平台支持：macOS、Linux、Windows。

## 🚀 安装命令

### macOS / Linux

```bash
curl -fsSL https://raw.githubusercontent.com/joeytoday/obsidian-notes/main/qwencode-installer/install | bash
```

### Windows

**PowerShell**：
```powershell
irm https://raw.githubusercontent.com/joeytoday/obsidian-notes/main/qwencode-installer/install.ps1 | iex
```

**CMD**：
```cmd
curl -fsSL -o %TEMP%\install-qwen.bat https://qwen-code-assets.oss-cn-hangzhou.aliyuncs.com/installation/install-qwen.bat && %TEMP%\install-qwen.bat
```

## 📋 命令对比

| 系统 | 命令 |
|------|------|
| **macOS / Linux** | `curl -fsSL .../install \| bash` |
| **Windows (PowerShell)** | `irm .../install.ps1 \| iex` |
| **Windows (CMD)** | `curl -fsSL -o %TEMP%\...bat && %TEMP%\...bat` |

## 🔧 环境变量

| 变量名 | 说明 | 默认值 |
|--------|------|--------|
| `QWEN_INSTALL_DIR` | 自定义安装目录 | `~/.qwen` |
| `QWEN_NODE_VERSION` | Node.js 版本 | `20.18.1` |
| `QWEN_NPM_REGISTRY` | npm 镜像源 | `https://registry.npmmirror.com` |

### 使用示例

**macOS / Linux**：
```bash
QWEN_INSTALL_DIR=~/.local bash -c "$(curl -fsSL https://raw.githubusercontent.com/joeytoday/obsidian-notes/main/qwencode-installer/install)"
```

**Windows PowerShell**：
```powershell
$env:QWEN_INSTALL_DIR="$HOME\.qwen"; irm https://raw.githubusercontent.com/joeytoday/obsidian-notes/main/qwencode-installer/install.ps1 | iex
```

## 🔗 相关链接

- [Qwen Code GitHub](https://github.com/QwenLM/qwen-code)
- [npm 包](https://www.npmjs.com/package/@qwen-code/qwen-code)
- [本仓库](https://github.com/joeytoday/obsidian-notes)
