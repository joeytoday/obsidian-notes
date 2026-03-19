# Qwen Code 安装脚本

一行命令，全平台支持：macOS、Linux、Windows。

## 🚀 安装命令

### macOS / Linux

在终端中运行：

```bash
curl -fsSL https://raw.githubusercontent.com/joeytoday/obsidian-notes/main/qwencode-installer/install | bash
```

### Windows

**PowerShell（推荐）**：
```powershell
irm https://qwen-code-assets.oss-cn-hangzhou.aliyuncs.com/installation/install-qwen.bat | iex
```

**CMD**：
```cmd
curl -fsSL -o %TEMP%\install-qwen.bat https://qwen-code-assets.oss-cn-hangzhou.aliyuncs.com/installation/install-qwen.bat && %TEMP%\install-qwen.bat
```

**Git Bash / WSL**：
```bash
curl -fsSL https://raw.githubusercontent.com/joeytoday/obsidian-notes/main/qwencode-installer/install | bash
```

## 📋 命令说明

| 系统 | 环境 | 命令 |
|------|------|------|
| macOS / Linux | Terminal | `curl -fsSL .../install | bash` |
| Windows | PowerShell | `irm .../install-qwen.bat \| iex` |
| Windows | CMD | `curl -fsSL -o %TEMP%\...bat && %TEMP%\...bat` |
| Windows | Git Bash/WSL | `curl -fsSL .../install | bash` |

## 🔧 环境变量

| 变量名 | 说明 | 默认值 |
|--------|------|--------|
| `QWEN_INSTALL_DIR` | 自定义安装目录 | `~/.qwen` |
| `QWEN_NODE_VERSION` | Node.js 版本 | `20.18.1` |
| `QWEN_NPM_REGISTRY` | npm 镜像源 | `https://registry.npmmirror.com` |

### 使用示例

```bash
# 自定义安装目录 (macOS/Linux)
QWEN_INSTALL_DIR=~/.local bash -c "$(curl -fsSL https://raw.githubusercontent.com/joeytoday/obsidian-notes/main/qwencode-installer/install)"
```

## 🔗 相关链接

- [Qwen Code GitHub](https://github.com/QwenLM/qwen-code)
- [npm 包](https://www.npmjs.com/package/@qwen-code/qwen-code)
- [本仓库](https://github.com/joeytoday/obsidian-notes)
