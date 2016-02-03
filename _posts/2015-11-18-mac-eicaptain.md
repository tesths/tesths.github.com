---
layout: post
title:  Mac升级10.11 EI Captain 填坑
date:   2015-11-18 19:54:59
categories: mac
---

上周日更新了新版的Mac OS 10.11 EI Captain，上午在工作室升级Xcode7还有keynote等等，下午安装操作系统和各种倒腾。最后发现时间都浪费在下午软件不能正常安装上了。特此写篇博客记录一下整个填更新的填坑过程。

其实我是很反对更新的，一更新就得踩坑，但是强迫症患者没法看到有更新不去更。

下面开始正文。

## 1. homebrew不能使用

homebrew本身是需要Xcode的command line的，而新版的Xcode7，应该是会把之前的command line删除了..所以即使你用`sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer`但是你还是没有办法使用homebrew，你在使用homebrew的时候，不论什么命令，都是`Failure while executing: /usr/bin/otool -L /usr/bin/install_name_tool`

当然，有`sudo xcodebuild -license`的原因，就是你没有同意xcodebuild的license。当然这些我都试了。还是不行，后来查查发现是command line没有选中的原因。

解决方法：首先`xcode-select -p`一般默认是`sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer`
但是Xcode7你需要切换到/Library/Developer/CommandLineTools，这时候就好了。

很多人的homebrew不能用是因为权限问题，在使用homebrew doctor的时候会提醒你。这点就不说了。

## 2. Xtrafinder不能使用

Xtrafinder更新完之后会提醒你怎么做，这就是苹果的rootless机制导致的，开开就OK了。

我想说的就是Xtrafinder会挡住finder一部分，前天好像已经出了更新，但是源没有换，所以还是0.25.6版本。V2ex上有人问了，大家都一样，不是电脑的问题所以不要着急。

## 3. gem更新

gem安装的东西，反正我的是都没了...因为苹果把/usr (except /usr/local)里的东西都再见了。需要把gem的默认安装路径重新设置一下。
所以我的rails还有博客的jekyll，当然，还有我的cocoapods都挂了。需要重新安装。

网上好多方法，说自定义GEM_HOME等等。我觉得都不太好，在stackoverflow上看到一个方法很好，分享一下。

打开terminal修改~/.gemrc

增加`gem: -n/usr/local/bin`这样就把gem的默认安装环境换到了/usr/local/bin下，这样更新gem就没问题了。

## 4.Xcode的Alcatraz不在window下显示

也就自己的Mac作大死解决这个问题。

网上有很多在github提issue，我看了很多，对着做了很多。里面说的都很详细，在此不贴，最后面有链接。

基本上原因就是，你的Alcatraz没有加入Xcode的UUID。

这里说明一下，每个Xcode版本的UUID不一样，所以最好的方法是先获取Xcode的UUID。

命令是`defaults read /Applications/Xcode.app/Contents/Info DVTPlugInCompatibilityUUID`

最后加到一个plist文件然后重启Xcode就可以了，大部分都是这样解决了。

当然，我用这个方法没有解决。万念俱灰下，重新用了百度..想看看国内人怎么解决的，记不得在cocoachina还是csdn看到一个人说，那些方法我都没有，我把Alcatraz下载下来运行了一下就ok了...

于是乎，我上github上下载了Alcatraz，运行了一下。。我也ok了。。

基本上遇到的大坑就这几个，踩完也没啥了。

但是我app store更新完新版本的Xcode7之后再安装Xcode6，app store就会更新我的Xcode6..而且我的homebrew也是只能识别我的Xcode6了...我一直无法解决。还有我的XQuartz一直显示过期也没法解决。简直，强迫症。


>最后唠两句。

>最近为啥没更新博客，我会说我同时写了几份代码么...完全没有时间。。
最近的心凉的很透彻。晚上看着微信洗脸。唉，说好了四星期之后做点其他事情，这都五星期了，还在写代码。在意的东西太多，不放弃一些永远只能这样。

>还有，暂时是决定考研了。

>有些事情，唉，就这了，没戏的事情总在想也没啥意义..还是忙一忙充实充实就不想了。

## 参考链接

1.[关于 OSX 升级到 EI Captain 的解决方案](http://guojianxiang.com/posts/2015-10-06-Update_OSX_EI_Captain_Problems.html)

2.[Failure while executing: /usr/bin/otool -L /usr/bin/install_name_tool](https://github.com/Homebrew/homebrew/issues/44071)

3.[xcode-select active developer directory error on OSX Mavericks](http://stackoverflow.com/questions/17980759/xcode-select-active-developer-directory-error-on-osx-mavericks)

4.[Can't install gems on MacOS X “El Capitan”](http://stackoverflow.com/questions/31972968/cant-install-gems-on-macos-x-el-capitan)