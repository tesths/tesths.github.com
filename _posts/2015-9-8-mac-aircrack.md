---
layout: post
title:  Mac安装Aircrack-ng
date:   2015-09-08 20:06:00
categories: free
---

9.4号中午去外面吃完冒菜回来都快三点了，这个点尴尬的不行。于是就去工作室倒腾点东西。也不想写代码，就开始各种在mac下装软件。项目基本上暂时没有什么要特别忙的，我也不能总写，都写了慎哥就没得写了。今晚上就把之前做的东西来个小记。

想到的是破译wifi，当然最终因为各种因素没破译成功。不过中间过程还是很享受的。下面开始。

百度了一下。有一篇[MACOS苹果系统下破解无线网WPA,WPA2密码](http://www.yyker.com/20131109457.html])。用到的主要工具是Aircrack。于是就开始倒腾了。

## 安装macport
---

首先第一步要安装[macport](https://www.macports.org/)。macport据我理解，相当于homebrew，ubuntu下相当于apt-get install。根据官网来说，安装macport最简单的方法就是下载pkg文件直接安装，但是我在下载pkg安装过程中，会出现卡死的问题。google了半天没找到解决方法。于是就下载了源代码安装，这在官网上都有说明。前面什么安装xcode的command line tools那是装机必备我就不多说了。

下载之后在官网上有说明，解压之后进入目录，进行`./configure && make && sudo make install`
之后需要添加环境变量，我没看懂官网的说明，自行google了一下。看到很多人的博客都写过这个问题，我在此就摘录一下。

需要将/opt/local/bin和/opt/local/sbin添加到$PATH搜索路径中。然后编辑/etc/profile，这里需要超级用户。如果用vim的话需要wq！在profile里加入下面两句

`export PATH=/opt/local/bin:$PATH`

`export PATH=/opt/local/sbin:$PATH`

然后就可以了，如果要立即生效，那么需要利用source命令`source /etc/profile`

这样就可以用了，执行`sudo port -v selfupdate`更新。到这步会发现好像仿佛是被墙了。。。

## 安装proxychains
---

然后我又陷入了难题，好不容易手动编译安装成功了。结果更新好像被墙了咋办。查查查，命令行下使用代理的方法。找到一个东西，叫做[proxychains](https://github.com/rofl0r/proxychains-ng)。搜这个用了好久，因为我用的是ss，ss支持的时socks5，而iterm支持http，这就麻烦了。后来在v2ex上发现hzlzh问了这个问题。我就安装这个了。

安装proxychains4非常简单，直接用homebrew就可以了。`brew install proxychains-ng`
安装完毕要设置代理

修改`/usr/local/etc/proxychains.conf` 最下面 
`[ProxyList]
socks5  127.0.0.1 1080`
测试proxychain能不能用，`proxychains4 curl twitter.com`会显示ok。我就不截图了。

proxychain可以让它后面的命令行直接走代理的路线，而不用直接进行网络请求。
我刚刚用这个加上home cask装了macdown。还是很不错的。因为很多命令行是需要进行网络请求的。

之后就可以`proxychains4 sudo port -v selfupdate`了。可能有点慢，不过我这次可以正常了。

## 安装aircrack-ng
---
最后的最后，我们可以用`sudo port install aircrack-ng`就可以安装aircrack了。

好了，剩下的就是按照那个博客说的来破解了...到这的时候我试了一下，但是班长突然打电话然我去取自行车，我就去了~后面的就没有后面了。

## 后面的安排
最近项目差不多算是完成了，后面的计划可能要调整一下状态，把RAC再看看，想看看动画，然后，继续开发下一个项目了~