#!/bin/bash
#version: v3.2.3
#author: zxbetter
#license: MIT
#contact: zhangxinbetter@gmail.com
#site: https://zxbetter.github.io
#time: 2020-08-20 20:42:53
# -----------------------------------------------------------------------------
# 在安装前执行，用于预处理
# -----------------------------------------------------------------------------

# 定义函数
function add_x {
    if [ -f "${1}" ]; then
        if [ ! -x "${1}" ]; then
            chmod a+x "${1}"
        fi
    fi
}

# git tools ====================================================================

echo "Git-Tools:"

# git/branch-new-and-track.sh
CURRENT_TOOL="${APP_HOME}/git/branch-new-and-track.sh"
echo "    ${CURRENT_TOOL}"
add_x "${CURRENT_TOOL}"

# git/commit-push.sh
CURRENT_TOOL="${APP_HOME}/git/commit-push.sh"
echo "    ${CURRENT_TOOL}"
add_x "${CURRENT_TOOL}"

# git/branch-delete-local-remote.sh
CURRENT_TOOL="${APP_HOME}/git/branch-delete-local-remote.sh"
echo "    ${CURRENT_TOOL}"
add_x "${CURRENT_TOOL}"

# file tools ===================================================================

echo "File-Tools:"

# file/new-file-with-template.sh
CURRENT_TOOL="${APP_HOME}/file/new-file-with-template.sh"
echo "    ${CURRENT_TOOL}"
add_x "${CURRENT_TOOL}"

# maven tools ==================================================================

echo "Maven-Tools:"

# maven/mvn-skip-test-doc.sh
CURRENT_TOOL="${APP_HOME}/maven/mvn-skip-test-doc.sh"
echo "    ${CURRENT_TOOL}"
add_x "${CURRENT_TOOL}"

echo " "
