---
layout: post
title:  用安卓和iPhone操作你的linux（需要校园wifi环境）
date:   2015-03-15 18:39:22
categories: linux
---
## 写在2015.3.15   由于3G网络不能访问推迟发布

首先，很对不起。我博客都已经写好了，但是发现手机数据请求没法ssh。所以推迟了发布。

具体为什么手机数据网络无法ssh我明天上课会问一下计算机网络的老师。

## 写在2015.3.17   3G网络不能访问的原因分析
计算机网络的老师没有回邮件，但是不想推迟发布了博客了。

博客原文中很多地方写到可以用3G网络ssh，事实证明现在在寝室这样做是是不可能访问的的。3G网络是肯定可以ssh的，我后期会想其他办法来实现用3G网络远程访问。

### 3G网络无法访问的原因

昨天在写邮件的时候发哥给我分析了一下数据网络不能请求的原因。我觉得是这个问题，所以我就先写出来了。

**首先先感谢发哥。**

简单的说，寝室路由器和手机3G不在一个大的网络下。

我们的寝室路由器上面还有很多个路由器，我们只是那个路由器的一个分支，没有最终接入外网，在校园网访问应该是没有问题的。在那个最终介入整个外网的路由器上绑定我的端口号才可以。而我们的3G网络最终是接入整个大的互联网的。

所以，需要搞定最上层的路由器找学校给我开一个端口，这样在教学楼用3G就可以访问了。但是这是不现实的。

信安一班的同志们很抱歉，说好周日发博客教大家用的但是因为出了问题现在才发布。

今天早上大概又想了一个可以远程访问的办法，我实现之后会发博客的。

下面是14号的正文。当时写的，我将题目修改了，原文题目加了一个教学楼，其他内容我就不做修改了。因为除了不能在教室3G网络访问其他都是对的可以实现的。

**如果你还有什么疑问，欢迎留言，每条都会看。**

## 写在2015.3.14   博客正文

## 起因：


因为学校开了unix操作系统的课。所以最近很多同学选了unix课或者去蹭unix课，使得unix突然变的十分火热。到处都在装虚拟机vmware。本来说写一篇文章简述怎么安装虚拟机的，但是觉得实在没有什么可写的，百度一下就差不多了。

因为最近看到到处在装虚拟机觉得得玩点其他的，之后就想起来原来熊大大和bingo他们教我远程ssh访问ubuntu，于是就想倒腾了一下ssh。百度了一下发现安卓手机上也有可以进行ssh访问的软件，那么我现在只要把我的电脑绑定路由器端口，手机连上网，就可以在教室用手机访问我在寝室的ubuntu了~

如果你想学习unix操作系统，安装虚拟机之后，这样也是一种很好的学习方式哦~

整个过程很简单，没有什么很复杂的东西，如果你能看完会觉得这件事情非常实用。

## 最终的样子：
简单的说我实现了一个这样的功能，我截屏来说明，本人没有ipad所以就截一个安卓的和电脑的屏了。

这是安卓手机上。

![remotecontrol-linux-1](\images\remotecontrol-linux\remotecontrol-linux-1.png)

这是电脑上。

![remotecontrol-linux-2](\images\remotecontrol-linux\remotecontrol-linux-2.png)

可以看到，我在安卓手机上用命令行访问到了一台linux设备。这样即使上课没有电脑，我也可以用手机来操作我的电脑学习linux下的很多命令了，这样没有图形界面可以更好的强迫自己学习命令。而且可以进行代码的编写，感觉还是很不错的。

## 下面我开始介绍我用到的工具和方法

**工具**
> 安卓系统设备一台，或者iphone，ipad，一台电脑，需要接入互联网。

**用到的软件：**

>安卓：connectbot，或者juicessh（我下载了但是没搞明白怎么用）

>iPhone或者ipad：试过iterminal ssh tool，App store搜索ssh就可以了。

>电脑：vmware，安装好ubuntu或者其他linux操作系。putty或者xshell进行ssh连接。

**下面开始。**

首先还是要介绍一下ssh，我不用百度的话，依旧用我的理解来阐述ssh的含义。

Ssh，security shell。安全的命令行。简单的说，只要给我主机的ip地址和端口号，给我访问主机的账户，我就可以远程用命令行来访问主机。之前看过毅哥在本地用putty连接阿里云进行服务器的调试，还是感觉挺帅气的。

## 正式开始步骤说明
在你的虚拟机目录下，点击编辑虚拟机设置。

![remotecontrol-linux-3](\images\remotecontrol-linux\remotecontrol-linux-3.png)

然后选择网络适配器，桥接模式。如图所示（此过程需要将虚拟机关机，我这里设置好了就没有关机）。

![remotecontrol-linux-4](\images\remotecontrol-linux\remotecontrol-linux-4.png)

打开ubuntu，安装ssh。

![remotecontrol-linux-5](\images\remotecontrol-linux\remotecontrol-linux-5.png)

网上很多说要输入命令查看是否有sshd，有的话说明ssh已经打开了。截图如下。

![remotecontrol-linux-6](\images\remotecontrol-linux\remotecontrol-linux-6.png)

反正我是直接再开启一次了。

![remotecontrol-linux-7](\images\remotecontrol-linux\remotecontrol-linux-7.png)

下面就是查看本机的ip地址。如图所示。

![remotecontrol-linux-8](\images\remotecontrol-linux\remotecontrol-linux-8.png)

ssh默认的端口号是22。
这时候如果你的手机和电脑在一个局域网里，打开putty或者xshel或者是你手机上的connectbot已经可以访问了，在一个网络就行，**室友都可以访问到。**

![remotecontrol-linux-9](\images\remotecontrol-linux\remotecontrol-linux-9.png)

这里需要你的linux帐号和密码。我不多阐述。

现在我们需要设置外网可以访问。

为了安全我们先修改端口号。

![remotecontrol-linux-10](\images\remotecontrol-linux\remotecontrol-linux-10.png)

打开之后添加我们要的端口号。默认的里面有22，先不慌删，后面确认其他端口可以访问再删。

![remotecontrol-linux-11](\images\remotecontrol-linux\remotecontrol-linux-11.png)

在这里我遇到了很多问题，网上很多说这里restart一下ssh就行了，但是我试不行，修改端口号之后重启电脑才能生效。

现在，我们基本完成了所有的准备工作，下一步就是绑定寝室路由器的端口了。

我们寝室是TP-link。

192.168.1.1 进入路由器界面。
选择转发规则虚拟服务器。然后添加新条目。（你的这里应该什么都没有）

![remotecontrol-linux-12](\images\remotecontrol-linux\remotecontrol-linux-12.png)

进入添加新条目。

![remotecontrol-linux-13](\images\remotecontrol-linux\remotecontrol-linux-13.png)

输入ubuntu下你打开的端口，我刚刚打开的是3389，还有利用ifconfig获得的ip地址。
点击保存即可，不需要重新启动路由器。
之后进入路由器主界面。安全起见我划去了我们寝室的路由ip。

![remotecontrol-linux-14](\images\remotecontrol-linux\remotecontrol-linux-14.png)

IP地址就你路由器拨号上网之后的ip地址。
到这里基本就完成了所有的准备工作。

下面我要用安卓手机来远程访问我的linux电脑了。Iphone用户类似操作，因为没有设备就不详细截图说明了。

![remotecontrol-linux-15](\images\remotecontrol-linux\remotecontrol-linux-15.png)

按照用户名（你的linux下的用户名）和外网ip地址即路由器ip加上端口号。
然后按下虚拟键盘的回车。
选择yes。

![remotecontrol-linux-16](\images\remotecontrol-linux\remotecontrol-linux-16.png)

输入密码之后就可以访问了！

>另外，connectbot下点击屏幕在键盘的左上角会出现ctrl键，ctrl+i是tab键。

>然后音量键是放大字体。

>至于在电脑上用putty和xshell访问我就不多叙述了。最后不要忘记删除你22的那个端口哦。

总之以后早上上课前可以把电脑打开，端口转发设置好，然后在教室访问就行了~~

>存在两个问题我还有必要说明一下，一是我不知道手机流量访问的流量消耗情况，明天我会去试一下，还有就是ubuntu固定ip地址的问题。

>这些问题解决之后我会在空间和朋友圈进行详细的说明，或者是发博客来说明。

**如果在整个过程中你遇到什么问题，可以给我留言，我会尽力帮你解决的。**

**能看到这真的很谢谢你的支持，希望你能有收获。**

**如果你觉得写得好，帮我把文章分享出去是对我最好的鼓励！**

