#!/bin/bash
#version: v0.3.0
#author: zxbetter
#license: MIT
#contact: zhangxinbetter@gmail.com
#site: https://zxbetter.github.io
#time: 2020-08-19 21:30:00
# -----------------------------------------------------------------------------
# 通用模块，提供通用的功能
# ------------------------------------------------------------------------------

# 输出信息
function notice_msg {
    echo " "
    echo -e "\033[0;32m${*}\033[0m"
    echo " "
}
