#!/bin/bash
#version: v3.2.3
#author: zxbetter
#license: MIT
#contact: zhangxinbetter@gmail.com
#site: https://zxbetter.github.io
#time: 2020-08-19 21:06:00
# -----------------------------------------------------------------------------
# 脚本执行逻辑：
#     1. 根据入参创建新分支(基于当前分支创建)；
#     2. 推送新分支到远程仓库；
#     3. 关联新建的本地分支和远程分支，使本地分支追踪远程分支的更新。
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
TRACK_BRANCH=$(git_current_branch)
NEW_BRANCH=""

# 定义函数
# 帮助函数
function helpu {
cat << EOF

usage: $0 <option>

新建并关联远程同名分支。

OPTIONS:
  [-b] branchName 指定分支名 
  [--help | -H]   帮助
EOF

exit
}

# 解析参数
while [ True ]; do
if [ "$1" = "--help" -o "$1" = "-H" ]; then
    helpu
elif [ "$1" = "-b" ]; then
    NEW_BRANCH="${2}"
    shift 2
else
    break
fi
done

if [ "X${NEW_BRANCH}" = "X" ]; then
    helpu
fi

# 执行逻辑

notice_msg "1)[创建] 基于 ${TRACK_BRANCH} 分支创建新分支 ${NEW_BRANCH}"
git checkout -b "${NEW_BRANCH}"

notice_msg "2)[推送] 推送 ${NEW_BRANCH} 分支到远程"
git push origin "${NEW_BRANCH}"

notice_msg "3)[关联] 设置本地 ${NEW_BRANCH} 分支追踪 origin/${NEW_BRANCH}"
git branch "--set-upstream-to=origin/${NEW_BRANCH}" "${NEW_BRANCH}"

notice_msg "完成!"
