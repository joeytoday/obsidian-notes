#!/usr/bin/env python3
"""
Qwen Code 安装入口脚本
根据操作系统自动选择并执行对应的安装命令
"""

import platform
import subprocess
import sys


def install_on_unix():
    """Linux/macOS 安装命令"""
    cmd = 'bash -c "$(curl -fsSL https://qwen-code-assets.oss-cn-hangzhou.aliyuncs.com/installation/install-qwen.sh)"'
    print("正在为 Linux/macOS 执行安装...")
    return subprocess.run(cmd, shell=True)


def install_on_windows():
    """Windows 安装命令"""
    import os
    temp_dir = os.environ.get('TEMP', os.environ.get('TMP', '.'))
    bat_path = os.path.join(temp_dir, 'install-qwen.bat')
    
    # 下载并执行 bat 脚本
    cmd = f'curl -fsSL -o {bat_path} https://qwen-code-assets.oss-cn-hangzhou.aliyuncs.com/installation/install-qwen.bat && {bat_path}'
    print("正在为 Windows 执行安装...")
    return subprocess.run(cmd, shell=True)


def main():
    system = platform.system()
    print(f"检测到操作系统: {system}")
    
    if system in ('Linux', 'Darwin'):  # Darwin 是 macOS
        result = install_on_unix()
    elif system == 'Windows':
        result = install_on_windows()
    else:
        print(f"不支持的操作系统: {system}")
        sys.exit(1)
    
    if result.returncode == 0:
        print("\n安装完成！建议重启终端以确保环境变量生效。")
    else:
        print(f"\n安装失败，退出码: {result.returncode}")
        sys.exit(result.returncode)


if __name__ == '__main__':
    main()