# Qwen Code 安装脚本

一行命令，全平台支持：macOS、Linux、Windows。

## 🚀 一行命令安装

**无论什么系统，都使用同一个命令：**

```bash
curl -fsSL https://qwen-code-assets.oss-cn-hangzhou.aliyuncs.com/installation/install | bash
```

脚本会：
- ✅ 自动检测操作系统
- ✅ macOS/Linux：直接运行 bash 安装
- ✅ Windows：自动调用 PowerShell 执行安装

### Windows 用户

如果你在 **Git Bash**、**WSL** 或 **Cygwin** 中，上面的命令同样适用。

如果直接在 **PowerShell** 中，使用：
```powershell
irm https://qwen-code-assets.oss-cn-hangzhou.aliyuncs.com/installation/install.ps1 | iex
```

## 📋 命令行选项

```bash
# 显示帮助
curl -fsSL https://qwen-code-assets.oss-cn-hangzhou.aliyuncs.com/installation/install | bash -s -- --help

# 指定平台（跳过自动检测）
curl -fsSL https://qwen-code-assets.oss-cn-hangzhou.aliyuncs.com/installation/install | bash -s -- --platform mac
curl -fsSL https://qwen-code-assets.oss-cn-hangzhou.aliyuncs.com/installation/install | bash -s -- --platform windows
curl -fsSL https://qwen-code-assets.oss-cn-hangzhou.aliyuncs.com/installation/install | bash -s -- --platform linux

# 跳过 Node.js 安装（使用系统已安装的 Node.js）
curl -fsSL https://qwen-code-assets.oss-cn-hangzhou.aliyuncs.com/installation/install | bash -s -- --skip-node
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
QWEN_INSTALL_DIR=~/.local bash -c "$(curl -fsSL https://qwen-code-assets.oss-cn-hangzhou.aliyuncs.com/installation/install)"

# 指定 Node.js 版本
QWEN_NODE_VERSION=22 bash -c "$(curl -fsSL https://qwen-code-assets.oss-cn-hangzhou.aliyuncs.com/installation/install)"
```

## 📦 项目结构

```
qwencode-installer/
├── scripts/
│   ├── install                # ✨ 统一安装脚本（推荐）
│   ├── install-unified.ps1    # Windows PowerShell 脚本
│   ├── setup                  # 交互式安装脚本
│   ├── install-qwen.sh        # 原始 Linux/macOS 脚本
│   └── install-qwen.bat       # 原始 Windows 脚本
├── configs/
│   ├── release.yml
│   └── esbuild.config.js
├── .github/
│   └── workflows/
│       └── test-installer.yml
├── ANALYSIS.md
├── DEPLOY.md
└── README.md
```

## 🧪 本地测试

```bash
# 测试帮助
bash scripts/install --help

# 测试指定平台
bash scripts/install --platform mac --skip-node

# 测试 PowerShell 脚本
pwsh scripts/install-unified.ps1 -Help
```

## 📝 对比 opencode

opencode 的安装方式：
```bash
curl -fsSL https://opencode.ai/install | bash
```

我们的实现完全相同：
```bash
curl -fsSL https://qwen-code-assets.oss-cn-hangzhou.aliyuncs.com/installation/install | bash
```

## 🔗 相关链接

- [Qwen Code GitHub](https://github.com/QwenLM/qwen-code)
- [npm 包](https://www.npmjs.com/package/@qwen-code/qwen-code)
- [部署文档](DEPLOY.md)
