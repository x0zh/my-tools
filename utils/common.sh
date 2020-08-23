#!/bin/bash
#version: v1.1.0
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
# Reference: https://gist.github.com/jonsuh/3c89c004888dfc7352be
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
function notice_msg {
    echo " "
    echo -e "${GREEN}${*}${NOCOLOR}"
    echo " "
}

# 输出错误信息
function error_msg {
    echo " "
    echo -e "${RED}${*}${NOCOLOR}"
    echo " "
    exit
}
