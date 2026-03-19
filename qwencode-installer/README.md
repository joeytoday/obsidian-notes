# Qwen Code 安装脚本

一行命令，全平台支持：macOS、Linux、Windows。

## 🚀 统一安装命令

**所有系统使用同一个命令：**

```bash
curl -fsSL https://raw.githubusercontent.com/joeytoday/obsidian-notes/main/qwencode-installer/install | bash
```

脚本会自动检测系统并执行对应的安装程序：
- **macOS / Linux**: 执行 `install-qwen.sh`
- **Windows**: 执行 `install-qwen.bat`

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
```

## 🔗 相关链接

- [Qwen Code GitHub](https://github.com/QwenLM/qwen-code)
- [npm 包](https://www.npmjs.com/package/@qwen-code/qwen-code)
- [本仓库](https://github.com/joeytoday/obsidian-notes)
