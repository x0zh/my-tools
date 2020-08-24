#!/bin/bash
#version: v3.2.7
#author: zxbetter
#license: MIT
#contact: zhangxinbetter@gmail.com
#site: https://zxbetter.github.io
#time: 2020-08-20 20:30:00
# -----------------------------------------------------------------------------
# My-Tools管理脚本，用于安装、卸载、重装等操作。
# -----------------------------------------------------------------------------

set -eo pipefail

if [ "X$0" = "X" ]; then
    shift
fi

# 应用的目录
export APP_HOME=$(cd $(dirname "$0"); pwd)
. "${APP_HOME}/utils/common.sh"

# 定义变量
# 安装使用的预处理脚本的路径
PRE_INSTALL_SHELL="${APP_HOME}/preinstall.sh"
# 安装文件的模板
INSTALL_TEMPLATE="${APP_HOME}/install-template.sh"

# 安装目录
APP_DIST="${APP_HOME}/dist"
# 安装文件
INSTALL_FILE="${APP_DIST}/my-tools.sh"

# shell的配置文件
SHELL_RC_FILE=("${HOME}/.zshrc" "${HOME}/.bashrc")

# 定义函数
# 帮助函数
function helpu {
cat << EOF

usage: $0 <option>

提供便利的命令行工具

OPTIONS:
  [--install   | -I] 安装
  [--uninstall | -U] 卸载
  [--reinstall | -R] 重装
  [--version   | -V] 版本
  [--help      | -H] 帮助
EOF
}

# 提示函数
function after_complete {
    echo " "
    echo "为了正常使用，请重启shell或者执行如下命令(取决于当前使用的shell环境): "
    echo " "
    for rc_file in ${SHELL_RC_FILE[*]}; do
        if [ -f "${rc_file}" ]; then
            echo "    source ${rc_file}"
        fi
    done
    echo " "
}

# 安装函数
function install_my_tools {

    notice_msg "准备安装 ${APP_HOME} ..."

    echo "预处理 ..."
    echo " "
    
    # 预处理
    . "${PRE_INSTALL_SHELL}"

    if [ ! -d "${APP_DIST}" ]; then
        mkdir "${APP_DIST}"
        echo "[完成创建] ${APP_DIST}"
    fi

    echo " "
    echo "开始安装 ..."
    touch "${INSTALL_FILE}"
    sed "s \${APP_HOME} ${APP_HOME} g" "${INSTALL_TEMPLATE}" > "${INSTALL_FILE}"
    echo "[完成安装] ${INSTALL_FILE}"

    for rc_file in ${SHELL_RC_FILE[*]}; do
        if [ -f "${rc_file}" ]; then
            echo "[建立关联] ${rc_file}"
            echo ". ${INSTALL_FILE} #MY-TOOLS-PATH DO NOT REMOVE THIS COMMENT" >> ${rc_file}
        fi
    done

    notice_msg "安装完成!"
}

# 卸载函数
function uninstall_my_tools {

    notice_msg "准备卸载 ${APP_HOME} ..."

    for rc_file in ${SHELL_RC_FILE[*]}; do
        if [ -f "${rc_file}" ]; then
            echo "[解除关联] ${rc_file}"
            sed -i.bak "/#MY-TOOLS-PATH DO NOT REMOVE THIS COMMENT/d" ${rc_file}
        fi
    done

    if [ -d "${APP_DIST}" ]; then
        echo "[完成删除] ${APP_DIST}"
        rm -rf "${APP_DIST}"
    fi

    notice_msg "卸载完成!"
}

# 版本号函数
function my_tools_version {
    echo && echo "v3.2.7"
}

if [ "$1" = "--help" -o "$1" = "-H" ]; then
    helpu
elif [ "$1" = "--install" -o "$1" = "-I" ]; then
    install_my_tools
    after_complete
elif [ "$1" = "--uninstall" -o "$1" = "-U" ]; then
    uninstall_my_tools
    after_complete
elif [ "$1" = "--reinstall" -o "$1" = "-R" ]; then
    uninstall_my_tools
    install_my_tools
    after_complete
elif [ "$1" = "--version" -o "$1" = "-V" ]; then
    my_tools_version
else
   helpu
fi