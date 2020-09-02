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

# 可以修改install-template.sh文件，自定义要安装的工具
./my-tools.sh --install
```

## 工具列表

### Git

| 命令名称              | 描述                                     |
| :------------------- | :--------------------------------------- |
| git-new-branch       | 基于当前分支创建新分支，并与对应的远程分支绑定   |
| git-commit-push      | 提交当前分支的变更，并推送到远程               |
| git-delete-branch    | 删除指定的本地分支和对应的远程分支             |
| gitlab-merge-request | 提交Gitlab合并请求                         |

### File

| 命令名称   | 描述            |
| :------- | :-------------- |
| file-new | 根据模板生成新文件 |

### Maven

| 命令名称           | 描述                                     |
| :------           | :--------------------------------------- |
| mvn-skip-test-doc | 执行Maven命令时，跳过单元测试和Java文档      |

## 自定义工具

My-Tools不仅使用起来很方便，同时也可以很方便地修改或者增加自定义的工具。

### 修改工具

如果现有的工具不能满足你的使用场景，可以对其进行修改，然后执行 `./my-tools.sh -R` 重新安装即可。

### 增加工具

以 `file/new-file-with-template.sh` 工具为例，演示如何增加工具。

1. 创建并编写 `file/new-file-with-template.sh` 脚本；
2. 在 `preinstall.sh` 脚本中添加安装My-Tools时，处理 `file/new-file-with-template.sh` 的逻辑；
3. 在 `install-template.sh` 模板中添加 `file/new-file-with-template.sh` 工具的别名；
4. 执行 `./my-tools.sh -R`。

## License

MIT

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
