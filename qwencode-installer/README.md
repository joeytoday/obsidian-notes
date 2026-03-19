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
curl -fsSL https://raw.githubusercontent.com/joeytoday/obsidian-notes/main/qwencode-installer/install.cmd | cmd
```

## 📋 命令对比

| 系统 | 环境 | 命令 |
|------|------|------|
| **macOS** | Terminal | `curl -fsSL .../install \| bash` |
| **Linux** | Terminal | `curl -fsSL .../install \| bash` |
| **Windows** | PowerShell | `irm .../install.ps1 \| iex` |
| **Windows** | CMD | `curl -fsSL .../install.cmd \| cmd` |

## 🔧 环境变量

| 变量名 | 说明 | 默认值 |
|--------|------|--------|
| `QWEN_INSTALL_DIR` | 自定义安装目录 | `~/.qwen` |
| `QWEN_NODE_VERSION` | Node.js 版本 | `20.18.1` |
| `QWEN_NPM_REGISTRY` | npm 镜像源 | `https://registry.npmmirror.com` |

## 🔗 相关链接

- [Qwen Code GitHub](https://github.com/QwenLM/qwen-code)
- [npm 包](https://www.npmjs.com/package/@qwen-code/qwen-code)
- [本仓库](https://github.com/joeytoday/obsidian-notes)
