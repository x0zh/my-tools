#!/bin/bash
#version: v0.3.0
#author: zxbetter
#license: MIT
#contact: zhangxinbetter@gmail.com
#site: https://zxbetter.github.io
#time: 2020-08-19 21:31:00
# -----------------------------------------------------------------------------
# git通用模块，需要使用git的脚本可以引入这个通用模块
#
# 环境变量:
#     APP_HOME: My-Tools根路径，需要引用该脚本的环境提供
# ------------------------------------------------------------------------------

. "${APP_HOME}/utils/common.sh"

# 当前git分支
function git_current_branch {
    echo $(git symbolic-ref --short -q HEAD)
}