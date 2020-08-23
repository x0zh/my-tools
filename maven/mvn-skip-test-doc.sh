#!/bin/bash
#version: v1.0.0
#author: zxbetter
#license: MIT
#contact: zhangxinbetter@gmail.com
#site: https://zxbetter.github.io
#time: 2020-08-22 16:51:12
# -----------------------------------------------------------------------------
# 执行maven命令时，跳过单元测试，跳过生成JavaDoc文档。
# ------------------------------------------------------------------------------

set -eo pipefail

if [ "X$0" = "X" ]; then
    shift
fi

SCRIPTPATH=$(cd $(dirname "$0"); pwd)

# 根路径
export APP_HOME="${SCRIPTPATH%/my-tools/*}/my-tools"
# 引入通用模块
. "${APP_HOME}/utils/common.sh"

# 定义变量
# 要执行的maven命令
MVN_COMMAND=""

# 定义函数
# 帮助函数
function helpu {
cat << EOF

usage: $0 [maven command]

执行maven命令时，跳过单元测试，跳过生成JavaDoc文档。

OPTIONS:
  [--help     | -H]    帮助
EOF

exit
}

# 解析参数

MVN_COMMAND="${*}"

if [ "X${MVN_COMMAND}" = "X" ]; then
    helpu
fi

# 执行逻辑

notice_msg "开始执行Maven命令: ${MVN_COMMAND}"

mvn ${MVN_COMMAND} -DskipTests=true -Dmaven.javadoc.skip=true

notice_msg "完成!"
