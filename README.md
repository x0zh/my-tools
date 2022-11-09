## My-Tools

个人工具集：方便使用，提高效率。

整理了自己编写的或者收集的小工具。

## 安装和使用

> 1. Mac自带的命令行工具是基于BSD的，可能和Linux的命令行表现不一致，可以安装GNU的命令行工具代替Mac自带的命令行工具。

```shell
brew install coreutils
brew install gnu-sed

# 配置环境变量
PATH=/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/gnu-sed/libexec/gnubin:/usr/local/bin:$PATH
MANPATH=/usr/local/opt/coreutils/libexec/gnuman:/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH
```

> 2. Windows请使用GitBash安装。

### 安装

```shell
git clone https://github.com/zxbetter/my-tools

cd my-tools

chmod a+x my-tools

./my-tools --install
```

## 工具列表

### Git

| 命令名称              | 描述                                          |
| :------------------- | :--------------------------------------------- |
| git-new-branch       | 基于当前分支创建新分支，并与对应的远程分支绑定 |
| git-auto             | 提交当前分支的变更，并推送到远程               |
| git-delete-branch    | 删除指定的本地分支和对应的远程分支             |
| gitlab-merge-request | 提交Gitlab合并请求                             |

### File

| 命令名称                 | 描述            |
| :--------------------- | :-------------- |
| file-new-with-template | 根据模板生成新文件 |

### Maven

| 命令名称       | 描述                                     |
|:-----------| :-------------------------------------- |
| mvn-simple | 执行Maven命令时，跳过单元测试和Java文档      |

### Net

| 命令名称   | 描述                      |
|:-------|:------------------------|
| my-ssh | ssh工具，支持跳板机以及登录后执行简单的命令 |

## 自定义工具

My-Tools不仅使用起来很方便，同时也可以很方便地修改或者增加自定义的工具。

### 修改工具

如果现有的工具不能满足你的使用场景，可以对其进行修改，然后执行 `./my-tools -i` 重新安装即可。

### 增加工具

在根目录或者子目录下创建shell脚本文件，编写完脚本后执行 `./my-tools -i` 重新安装即可。

> TIP: shell脚本文件中需要在注释中指定命令的别名才能正常安装，格式如下

```shell
# alias: xxx
````

## License

[MIT License](https://opensource.org/licenses/MIT)
