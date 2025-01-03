---
layout: post
title: VScode 使用Remote SSH 连接服务器并配置密钥
author: wichai
date: 2024-11-21 00:35 +0000
categories: [Study, Master]
tags: [Remote SSH, VScode, HPC]
mermaid: true
math: true
pin: false
---





#  VScode 使用Remote SSH 连接服务器并配置密钥

## 1. VScode连接服务器

1. 下载插件

![image-20241121003145024](https://wichaiblog-1316355194.cos.ap-hongkong.myqcloud.com/image-20241121003145024.png)

在VScode插件中搜索remote，有两个插件可以选择

​	a. Remote Development 有四个remote 包含SSH

​	b. Remote - SSH

下载任意一个即可



2. 使用remote-SSH登录远程机器

在侧边栏站到插件，点击SSH➕号进行`ssh username@remote_host`登录

会出现一个选择配置文件，按需配置即可

随后点击连接时输入密码即可





## 2. 配置密钥



我的方案是

- 本地环境 - MacOS
- 远程 - Linux 服务器(Ruby)
- 看网上的教程 好想是哪边生成密钥都是可行的，我试的是本地生成密钥

### 2.1 本地ssh生成密钥

在本地

```shell
ssh-keygen
```

得到输出 (注意保存路径)

![image-20241121000414938](https://wichaiblog-1316355194.cos.ap-hongkong.myqcloud.com/image-20241121000414938.png)

在`Enter passphrase`处直接`ENTER`或者输入密码(我是直接`ENTER`了)

`Enter same passphrase again: ` 同理，随后就生成密钥了



### 2.2 部署共钥

还是在本地

1. 查看密钥

```shell
cd ~/.ssh
ls
```

在输出中应该能看到上面生成的 `id_*.pub`的文件，这个里面存储的就是密钥



2. 复制/传输密钥

有多种方法 cat/vim/nano/vscode 任选

例如，我的是

```shell
cat id_ed25519.pub
```

终端输出密钥，**复制**我的输出



3. 远程部署共钥

注意⚠️ 此时是**远程环境**

a. 进入`.ssh`

如果没有，则 `mkdir ~/.ssh`

```shell
cd ~/.ssh
```

b. 在`authorized_keys` 中 保存共钥

```shell
echo "您的公钥内容" >> ~/.ssh/authorized_keys
```

c. 设置权限

```shell
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
```



4. 测试 —— 回到本地机器，尝试无密码登录

```shell
ssh username@remote_host
```

- 如果能够成功登录且未提示输入密码，说明配置成功。
- Vscode中也应该可以直接登录无需输入密码



参考文章 https://blog.songjiahao.com/archives/262
