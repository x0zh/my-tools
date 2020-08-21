## My-Tools

个人工具集：方便使用，提高效率。

整理了自己编写的或者收集的小工具。

## 安装和使用

> mac自带的命令行工具是基于BSD的，可能和Linux的命令行表现不一致，可以安装GNU的命令行工具代替Mac自带的命令行工具。

```shell
brew install coreutils
brew install gnu-sed

# 配置环境变量
PATH=/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/gnu-sed/libexec/gnubin:/usr/local/bin:$PATH
MANPATH=/usr/local/opt/coreutils/libexec/gnuman:/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH
```

### 安装

```shell
git clone https://github.com/zxbetter/my-tools

cd my-tools

chmod a+x my-tools.sh

./my-tools.sh --install
```

## 工具列表

### git

| 命令名称           | 描述                                     |
| :------           | :---                                     |
| git-new-branch    | 基于当前分支创建新分支，并与对应的远程分支绑定 ｜
| git-commit-push   | 提交当前分支的变更，并推送到远程             ｜
| git-delete-branch | 删除指定的本地分支和对应的远程分支            ｜

## License

MIT

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
