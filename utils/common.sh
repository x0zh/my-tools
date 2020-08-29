#!/bin/bash
#version: v1.2.0
#author: zxbetter
#license: MIT
#contact: zhangxinbetter@gmail.com
#site: https://zxbetter.github.io
#time: 2020-08-19 21:30:00
# -----------------------------------------------------------------------------
# 通用模块，提供通用的功能
# -----------------------------------------------------------------------------

# 定义变量
# Colors
# 参考: https://gist.github.com/jonsuh/3c89c004888dfc7352be
NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHTGRAY='\033[0;37m'
DARKGRAY='\033[1;30m'
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHTBLUE='\033[1;34m'
LIGHTPURPLE='\033[1;35m'
LIGHTCYAN='\033[1;36m'
WHITE='\033[1;37m'

# 定义函数
# 输出提示信息
notice_msg() {
    echo " "
    echo -e "${GREEN}${*}${NOCOLOR}"
    echo " "
}

# 输出错误信息
error_msg() {
    echo " "
    echo -e "${RED}${*}${NOCOLOR}"
    echo " "
    exit
}

# 询问是否继续的函数
confirm_go_on() {
    while true; do
        read -p "${1-"是否继续"}?(y/n)" yn
        case ${yn} in
            [Yy]* ) break;;
            [Nn]* ) exit;;
            * )     echo "请输入y/n";;
        esac
    done
}

# 获取系统名称
# 参考: https://stackoverflow.com/a/27776822/6003235
get_os_name() {
    case "$(uname -s)" in
        Darwin )                        echo 'Mac';;
        Linux )                         echo 'Linux';;
        CYGWIN*|MINGW32*|MSYS*|MINGW* ) echo 'Windows';;
        * )                             echo 'Other';;
    esac
}

# 在浏览器打开url
# 参考：https://stackoverflow.com/a/38147878/6003235
open_url() {
    if [ ${#} -eq 0 ]; then
        error_msg "open_url函数需要指定url作为参数"
    fi

    case "$(get_os_name)" in
        Mac )     open "$@";;
        Linux )
            if command -v xdg-open > /dev/null; then
                xdg-open "$@"
            else
                echo "xdg-open命令不存在, 请手动在浏览器打开："
                echo "$@"
            fi
        ;;
        Windows ) start "$@";;
        Other )
            echo "未能识别的系统, 请手动在浏览器打开："
            echo "$@"
        ;;
    esac
}
