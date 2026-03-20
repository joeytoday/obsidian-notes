# Qwen Code 安装脚本

## 🚀 安装命令

### 跨平台安装（推荐）

使用 Python 脚本，自动识别操作系统并执行对应安装：

**macOS / Linux**：
```bash
curl -fsSL https://raw.githubusercontent.com/joeytoday/obsidian-notes/main/qwencode-installer/install-qwen.py | python3
```

**Windows**：
```cmd
curl -fsSL https://raw.githubusercontent.com/joeytoday/obsidian-notes/main/qwencode-installer/install-qwen.py | python
```

> 💡 如果系统已安装 Python，上述命令会自动检测操作系统并执行对应的安装流程。

---

### 分平台安装

**macOS / Linux**：
```bash
curl -fsSL https://qwen-code-assets.oss-cn-hangzhou.aliyuncs.com/installation/install-qwen.sh | bash
```

**Windows PowerShell**：
```powershell
irm https://qwen-code-assets.oss-cn-hangzhou.aliyuncs.com/installation/install-qwen.bat | iex
```

**Windows CMD**：
```cmd
curl -fsSL -o %TEMP%\install-qwen.bat https://qwen-code-assets.oss-cn-hangzhou.aliyuncs.com/installation/install-qwen.bat && %TEMP%\install-qwen.bat
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
QWEN_INSTALL_DIR=~/.local bash -c "$(curl -fsSL https://qwen-code-assets.oss-cn-hangzhou.aliyuncs.com/installation/install-qwen.sh)"
```

**Windows PowerShell**：
```powershell
$env:QWEN_INSTALL_DIR="$HOME\.qwen"; irm https://qwen-code-assets.oss-cn-hangzhou.aliyuncs.com/installation/install-qwen.bat | iex
```

## 🔗 相关链接

- [Qwen Code GitHub](https://github.com/QwenLM/qwen-code)
- [npm 包](https://www.npmjs.com/package/@qwen-code/qwen-code)
