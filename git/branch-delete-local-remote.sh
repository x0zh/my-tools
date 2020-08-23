#!/bin/bash
#version: v1.0.1
#author: zxbetter
#license: MIT
#contact: zhangxinbetter@gmail.com
#site: https://zxbetter.github.io
#time: 2020-08-19 21:06:00
# -----------------------------------------------------------------------------
# 脚本执行逻辑：
#     1. 删除指定的本地分支；
#     2. 删除对应的远程分支。
# ------------------------------------------------------------------------------

set -eo pipefail

if [ "X$0" = "X" ]; then
    shift
fi

SCRIPTPATH=$(cd $(dirname "$0"); pwd)

# 根路径
export APP_HOME="${SCRIPTPATH%/my-tools/*}/my-tools"
# 引入git通用模块
. "${APP_HOME}/utils/git.sh"

# 定义变量
DELETE_BRANCH=""

# 定义函数
# 帮助函数
function helpu {
cat << EOF

usage: $0 <option>

删除指定的本地分支和对应的远程分支。

OPTIONS:
  [-b] [branchName ...] 指定分支名，多个用空格隔开 
  [--help | -H]         帮助
EOF

exit
}

# 解析参数
while [ True ]; do
if [ "$1" = "--help" -o "$1" = "-H" ]; then
    helpu
elif [ "$1" = "-b" ]; then
    shift 1
    DELETE_BRANCH="${*}"
else
    break
fi
done

if [ "X${DELETE_BRANCH}" = "X" ]; then
    helpu
fi

# 执行逻辑

notice_msg "1)删除本地分支 ${DELETE_BRANCH}"
git branch -D "${DELETE_BRANCH}"

notice_msg "2)删除远程分支 ${DELETE_BRANCH}"
git push origin --delete "${DELETE_BRANCH}"

notice_msg "完成!"
