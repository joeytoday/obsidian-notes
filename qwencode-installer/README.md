# Qwen Code 安装脚本

一行命令，全平台支持：macOS、Linux、Windows。

## 🚀 一行命令安装

**无论什么系统，都使用同一个命令：**

```bash
curl -fsSL https://raw.githubusercontent.com/joeytoday/obsidian-notes/main/qwencode-installer/install | bash
```

脚本会自动检测你的操作系统，并运行对应的安装程序：
- ✅ **macOS / Linux**：运行 bash 安装脚本
- ✅ **Windows**：运行批处理安装脚本

## 💻 Windows 专用命令

如果直接在 **PowerShell** 中运行：

```powershell
irm https://qwen-code-assets.oss-cn-hangzhou.aliyuncs.com/installation/install-qwen.bat | iex
```

如果直接在 **CMD** 中运行：

```cmd
curl -fsSL -o %TEMP%\install-qwen.bat https://qwen-code-assets.oss-cn-hangzhou.aliyuncs.com/installation/install-qwen.bat && %TEMP%\install-qwen.bat
```

## 📋 工作原理

```
curl ... | bash
    ↓
自动检测平台
    ↓
├── macOS/Linux → 执行 install-qwen.sh
└── Windows     → 执行 install-qwen.bat
```

## 🔧 环境变量

| 变量名 | 说明 | 默认值 |
|--------|------|--------|
| `QWEN_INSTALL_DIR` | 自定义安装目录 | `~/.qwen` |
| `QWEN_NODE_VERSION` | Node.js 版本 | `20.18.1` |
| `QWEN_NPM_REGISTRY` | npm 镜像源 | `https://registry.npmmirror.com` |

### 使用示例

```bash
# 自定义安装目录
QWEN_INSTALL_DIR=~/.local bash -c "$(curl -fsSL https://raw.githubusercontent.com/joeytoday/obsidian-notes/main/qwencode-installer/install)"

# 指定 Node.js 版本
QWEN_NODE_VERSION=22 bash -c "$(curl -fsSL https://raw.githubusercontent.com/joeytoday/obsidian-notes/main/qwencode-installer/install)"
```

## 📦 文件说明

| 文件 | 说明 |
|------|------|
| `install` | 统一入口脚本，自动检测平台并调用对应的安装脚本 |
| `install-unified.ps1` | Windows PowerShell 安装脚本 |

## 🧪 本地测试

```bash
# 本地运行
bash qwencode-installer/install

# 查看脚本内容
cat qwencode-installer/install
```

## 🔗 相关链接

- [Qwen Code GitHub](https://github.com/QwenLM/qwen-code)
- [npm 包](https://www.npmjs.com/package/@qwen-code/qwen-code)
- [本仓库](https://github.com/joeytoday/obsidian-notes)
