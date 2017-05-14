---
layout: post
title:  Heroku 安装 Huginn
date:   2017-5-14
categories: huginn
---


## 需要的东西

1. git （用来拉仓库）
2. Heroku Toolbelt （用来部署）
3. ruby 环境 （用来配置）

## 准备工作

注册一个 Heroku 的账号，登陆上去。

配置好你的 Heroku Toolbelt（参考 Heroku 官方的说明）。

以及把 gem 的原换了。

由于 Huginn 是一个 ruby 写的应用，所以需要用 gem 把它需要的三方库安装起来，但是 gem 本身是很卡的。所以要把国外的源换到中国，参考 Ruby China 的 [RubyGems 镜像](https://gems.ruby-china.org/)。从 `gem sources` 开始做。

## 部署步骤

1.登陆 Huginn Github 主页的 [Deployment 部分](https://github.com/huginn/huginn#deployment)，找到 Heroku 的按钮。然后点击，就会跳转到你的 Heroku 了。

![](http://walkginkgo.com/images/huginn/heroku-1.png)

2.点完按钮之后会跳转到你的 Heroku 界面。去起个名字。

![](http://walkginkgo.com/images/huginn/heroku-2.png)

3.起晚名字什么都不点，直接拉到最后点 Deploy 的按钮。

![](http://walkginkgo.com/images/huginn/heroku-3.png)

之后它就会开始 build 了。等会就行。

![](http://walkginkgo.com/images/huginn/heroku-4.png)

这里 View 就直接到建立好的网站了，Manage App 会跳转到 Heroku 管理界面。我们点击 View。

![](http://walkginkgo.com/images/huginn/heroku-5.png)

4.这样就进入到网页了。这里 Huginn 很人性化的把步骤贴出来了。由于我们用的是自动安装，所以没有创建管理员用户，也有一些东西需要配置。（可以看到已经可以访问域名了）

![](http://walkginkgo.com/images/huginn/heroku-6.png)

这里首先需要在命令行登陆你的 heroku（对不用第一步看文档了，直接做），就是在命令行输入 `heroku login`。

剩下的就对着白色的复制粘贴命令做可以了。到最后一步 `bin/setup_heroku` 的时候会让你输入一些 Yes or no，或者是邮箱什么的，我就不详细说了。实在搞不定就在群里问。一个一个写得截图太麻烦了，容我偷个懒。

里面有一步会设置或者直接给你一个邀请码，还有设置管理员用户。还有登陆的管理员账号和密码。记得保存好这些。

## 几点说明

1. Heroku 部署很简单，如果有问题，那基本是 gem 的问题，看看报错信息，搞不定就上群里来交流一下。
2. Heroku 有时间限制，有时候网站会挂，官方推荐可以使用 uptimerobot 来持续网站运行。参考官方文档。


