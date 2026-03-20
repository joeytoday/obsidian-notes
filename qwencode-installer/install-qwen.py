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
    script_url = 'https://qwen-code-assets.oss-cn-hangzhou.aliyuncs.com/installation/install-qwen.sh'
    print("正在为 Linux/macOS 执行安装...")
    # 先下载脚本，再通过管道传给 bash 执行
    curl_process = subprocess.Popen(
        ['curl', '-fsSL', script_url],
        stdout=subprocess.PIPE
    )
    bash_process = subprocess.Popen(
        ['bash'],
        stdin=curl_process.stdout
    )
    curl_process.stdout.close()
    bash_process.wait()
    curl_process.wait()
    return bash_process


def install_on_windows():
    """Windows 安装命令"""
    import os
    temp_dir = os.environ.get('TEMP', os.environ.get('TMP', '.'))
    bat_path = os.path.join(temp_dir, 'install-qwen.bat')
    script_url = 'https://qwen-code-assets.oss-cn-hangzhou.aliyuncs.com/installation/install-qwen.bat'

    print("正在为 Windows 执行安装...")
    # 下载 bat 脚本
    curl_result = subprocess.run(
        ['curl', '-fsSL', '-o', bat_path, script_url]
    )
    if curl_result.returncode != 0:
        print("下载安装脚本失败")
        return curl_result

    # 执行 bat 脚本
    result = subprocess.run(['cmd', '/c', bat_path])

    # 删除临时脚本文件
    try:
        os.remove(bat_path)
        print(f"已清理临时文件: {bat_path}")
    except Exception:
        pass  # 忽略删除失败

    return result


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

    # 安装脚本执行完成，退出码 0 或 1（qwen 启动无输入时返回 1）都视为成功
    print("\n安装完成！建议重启终端以确保环境变量生效。")


if __name__ == '__main__':
    main()