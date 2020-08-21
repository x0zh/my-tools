#!/bin/bash
#version: v0.3.0
#author: zxbetter
#license: MIT
#contact: zhangxinbetter@gmail.com
#site: https://zxbetter.github.io
#time: 2020-08-21 16:00:00
# -----------------------------------------------------------------------------
# git status ==> git add . ==> git commit ==> git push
# ------------------------------------------------------------------------------

set -eo pipefail

if [ "X$0" = "X" ]; then
    shift
fi

SCRIPTPATH=$(cd $(dirname "$0"); pwd)

# 根路径
export APP_HOME="${SCRIPTPATH%/my-tools/*}/my-tools/"
# 引入git通用模块
. "${APP_HOME}/utils/git.sh"

# 定义变量
# 当前分支
CURRENT_BRANCH=$(git_current_branch)
# commit信息
COMMIT_MSG="Update changes $(date '+%Y-%m-%d %H:%M:%S')"

# 定义函数
# 帮助函数
function helpu {
cat << EOF

usage: $0 <option>

提交当前分支的变更，并推送到远程

OPTIONS:
  [-m] commitMessage 指定提交信息
  [--help | -H]      帮助
EOF

exit
}

# 解析参数
while [ True ]; do
if [ "$1" = "--help" -o "$1" = "-H" ]; then
    helpu
elif [ "$1" = "-m" ]; then
    COMMIT_MSG="${2}"
    shift 2
else
    break
fi
done

# 执行逻辑

notice_msg "Current branch: ${CURRENT_BRANCH}"

notice_msg "[1]Status:"
git status

# Add changes to git
notice_msg "[2]Add ..."
git add .

# Commit changes
notice_msg "[3]Commit ..."
git commit -m "${COMMIT_MSG}"

# Push changes to remote
notice_msg "[4]Push ..."
git push origin ${CURRENT_BRANCH}

notice_msg "Completed!"
