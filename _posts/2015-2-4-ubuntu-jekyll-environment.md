---
layout: post
title:  关于在ubuntu下搭建github的Jekyll环境
date:   2015-02-04 ‏‎10:58:29
categories: jekyll
---
之前早就想有一个自己的博客，但是想自己定制不想用别人的，所以没有选择csdn。用WordPress的话需要服务器又不想花钱。我的师傅(下文和以后的文章和现实当中我都会称呼他迪哥)。迪哥将他的博客移到了github上。虽然github是静态页面，但是对我来说偶尔写写心得也是够用了。
没有仔细研读迪哥的几篇有关jekyll 的博客自己对着文档就上了。
因为后面几天可能还需要windows环境，所以暂时是在windows下跑的ubuntu14.04 32位的虚拟机。
废话结束，开工。

假设你现在刚刚安装了ubuntu的操作系统。
刚装完ubuntu的同学不要忘记利用sudo apt-get update一下，更新源，不然不能用sudo apt-get安装软件。因为太长时间不用ubuntu所以我忘记了….后来百度才想起来新装的机子需要更新源。

假设你已经更新源了，那么我们开始下一个步骤。
因为jekyll是需要ruby环境的。
在Mac下自带了ruby环境所以不需要安装ruby，在这我们需要安装ruby。
命令是sudu apt-get install ruby。
声明一下没有截图，但是所有需要的命令我会特别标注的。后面我遇到的问题会截图的。

在jekyll的官方网站上我们需要用gem来安装jekyll，包括Stack Overflow上的很多网站都说需要sudo apt-get install rubygems。但是如下图，rubygems的包现在已经包含在ruby包里了，这就意味着我们不需要安装gem了，在安装ruby的同时gem已经安装好了。

![ubuntu-jekyll-environment-1](/images/ubuntu-jekyll-environment/ubuntu-jekyll-environment-1.png)

虽然我磕磕绊绊的到了这一步但是我想一般情况下前面update和安装ruby应该是不会出现什么意外情况的。
之后就是利用gem来安装了。
安装官方文档上写的，此时我们应该进行的操作是gem install jekyll，但是我在输入命令之后出现这个了这个问题。

![ubuntu-jekyll-environment-2](/images/ubuntu-jekyll-environment/ubuntu-jekyll-environment-2.png)

这是因为gem安装时需要获取最高权限，所以我们使用sudo gem install jekyll

![ubuntu-jekyll-environment-3](/images/ubuntu-jekyll-environment/ubuntu-jekyll-environment-3.png)

又报错了！！看error部分。出现了 “failed to build gem native extension”
上stackoverflow…完了才知道要安装一个ruby-dev
不太清楚ruby-dev是啥有ruby大神知道的务必教我。但是程序安装都需要dev，我记得好像以前在ubuntu下配置GoAgent的时候装过一个什么dev，在python的时候也装过一个什么什么dev。总之就安装一下呗。

![ubuntu-jekyll-environment-4](/images/ubuntu-jekyll-environment/ubuntu-jekyll-environment-4.png)

安装ruby-dev的速度很快很快很快。
之后就是激动人心的安装jekyll了！！

![ubuntu-jekyll-environment-5](/images/ubuntu-jekyll-environment/ubuntu-jekyll-environment-5.png)


再次执行sudo gem install jekyll已经不报错了，它显示building native extension.
可以很惊喜的发现已经开始安装了啦啦啦啦！！

![ubuntu-jekyll-environment-6](/images/ubuntu-jekyll-environment/ubuntu-jekyll-environment-6.png)

安装速度很快，完毕之后我激动的要开始创建的时候，它又报错了….

![ubuntu-jekyll-environment-7](/images/ubuntu-jekyll-environment/ubuntu-jekyll-environment-7.png)

注意第三行，could not find a javascrit runtime.
继续stackoverflow….
需要nodejs环境，我是前端小白不要问我什么是nodejs，但是我知道在jekyll的官方文档里jekyll是需要nodejs环境的。
接着装吧，希望就在眼前了！！

![ubuntu-jekyll-environment-8](/images/ubuntu-jekyll-environment/ubuntu-jekyll-environment-8.png)

具体安装过程我就不截图了！
至此，整个环境已经全部配好了。

让我们new一个！！

![ubuntu-jekyll-environment-9](/images/ubuntu-jekyll-environment/ubuntu-jekyll-environment-9.png)

Jekyll已经成功创建了！历时一个晚上加不到一个早上终于才完成了环境的搭建。相比较去年暑假配置环境的速度这次已经很快了…我现在已经会利用google和stackoverflow搜索这方面的东西了说明这一学期还是学了很多东西的。

这是整个jekyll环境的配置，第一篇文章，后续我会继续我的github blog搭建之旅。
