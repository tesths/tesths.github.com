---
layout: post
title:  Huginn 安装备注（持续更新）
date:   2016-08-10
categories: life
---

## 安装准备工作

### 1. 需要在开始的时候设置主机语言

如果不设置主机语言的话，会在后面有很神奇的错误。设置主机语言的命令是

export LC_ALL=en_US.UTF-8 （需要设置中文自行 google，可能这样设置还不够..最好查一下怎么设置语言）

### 2. 需要设置时区

不设置时区抓取的时候时间会有问题，不过这一步问题不大。命令如下。

sudo dpkg-reconfigure tzdata

在Huginn官方的安装wiki中，其实有很多安装问题没有具体列出，我在上一篇博客中做了一些总结。在这篇博客中，我会做成一个安装问题的集合。以方便各位的安装。

## 官方 wiki 部分修正以及注释

### 1. 官方最开始有一步 Import node.js repository…

curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -

这一步官方用了脚本执行，可以不复制那个 curl 开头的，新版本的 nodejs 安装只需要用 apt-get install nodejs 就可以了。

因为官方在后面 Install the required packages 中有 nodejs 的安装，所以 Import node.js repository 这一步其实可以不去做。

### 2. Install Init Script

在这一步中是 或 的关系，一定要搞明白。

我选择的是在这步把

	# web: bundle exec unicorn -c config/unicorn.rb
	# jobs: bundle exec rails runner bin/threaded.rb
这两行的 # 去掉了的。

### 3. 配置 nginx

YOUR_SERVER_FQDN 这个改成你的主机ip就可以了。我没有域名不知道域名的怎么弄。

备注：我没有使用 https ，所以如果有需要 https 自己踩下吧。
作者很耐心，提 issue 的话很快就能回复，而且问题定位比较准确。提的时候先查看有没有重复的，然后记得用英文就好。

## 错误解决方法

### 1. 全部安装完毕web打开 css 不显示

Rails 静态资源需要编译，不然 css 不显示。我已经提了 issue ，遇到这个问题可以参看这个 issue。

[css and image is not load](https://github.com/cantino/huginn/issues/1581)

### 2. 在 bundle install 的时候显示 “Cannot allocate memory” 等一系列和memory相关的报错

简单的说，swap 不够了。具体方法见 [How To Add Swap on Ubuntu 14.04](https://www.digitalocean.com/community/tutorials/how-to-add-swap-on-ubuntu-14-04)

