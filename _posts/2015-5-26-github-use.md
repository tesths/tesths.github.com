---
layout: post
title:  从0开始学习 GitHub 系列之「寻找代码」
date:   2016-5-26
categories: iOS
---

张哥在写Github系列，看到了想帮张哥分担一下。正好工作室的学弟学妹们也需要会这个，就正好写个博客了。

因为我是iOS开发出生..所以我就从iOS的角度来写怎么用，不过放心，Android没有什么大的差别，我们后台的学弟都是这么干的！

看完张哥的文章，大概已经明白了Github是怎么使用的。但我想大部分人是想用Github里面的三方库，想去看看别人的开源项目的源代码，想去看看最近有没有什么新的牛逼的代码。但是怎么去找到这些东西呢。我想介绍的就是这方面的东西。

## 看Explore和Trending

大部分人的Github顶部栏可能是这样的...

![github-1](/images/github/github-1.png)

但我的是这样的...

![github-2](/images/github/github-2.png)

看到差别了吗？右上角我的比你们多了一个Explore...记得我大二的时候Github改版，把Explore去掉了，当时好像骂声一片。有人开发了一款插件。[Github Menu Back](https://chrome.google.com/webstore/detail/github-menu-back/mcobennfgmfddjmiikfamhhhiibcjbik?utm_source=chrome-ntp-icon)说白了这玩意就是在你的Github顶部栏加上Explore，然后把你的头像放左边。足以见到Explore的重要性（不过这玩意得网站加载差不多才能出来..）。当然了要是不愿意用这个，可以点击头像，里面也有。如下图

![github-3](/images/github/github-3.png)

我们点击一个看看。

![github-4](/images/github/github-4.png)

进去之后左上角有四个选项。

![github-5](/images/github/github-5.png)


一个一个介绍哈。

### 第一个  Showcases

![github-6](/images/github/github-6.png)

第一个其实就是这个界面，点过去没啥区别。

就是按照某个方面，比如Package managers（其实就是三方库的管理器）。点进去里面都是某门语言的包管理器，比如iOS的cocoapods，前端的npm，vim的vundle。类比到Android里面应该就是Gradle了。不过这里应该没有Gradle..

比如还有web application frameworks，其实就是后台框架，肯定有rails的。

具体我就不介绍了。可以点进去看。在最下面有More showcases。

### 第二个  Integrations

![github-7](/images/github/github-7.png)

Powerful integrations that help you and your team build software better, together.

其实就是一些工具的整合，可以更好的开发。

点进去里面有很多工具，比如Travis ci，这个现在用的很多，还有Github自家的编辑器Atom等等。

这个得自己发掘了..不多介绍。

### 第四个  Stars。

为啥跳第三个？因为第三个是重点...重要的放最后。

点Stars就会进入你Star过的项目里啦。具体的查找方法我后面会介绍的。就不截图了。

### 第三个  Trending。

![github-8](/images/github/github-8.png)

好像有人曾经在知乎问过，程序员无聊的时候干什么。结果下面有人说，我逛Github能逛一上午...自从我发现Trending之后，我发现我也可以！

Trending说白了，就是某个时间段里Github上被star数量最多的项目和仓库被star数量最多的开发者！

我要一点一点仔细的介绍这个！

![github-9](/images/github/github-9.png)

首先是左上角的。

这两个，是切换仓库和开发者的。

![github-10](/images/github/github-10.png)

这里是切换时间的，可以选择天，周，和月。也就是每天每周每月被star次数最多的仓库。我以前上过一次Trending..完全不知道它这个算法咋写的，莫名其妙就上了，当然我上的是天..

最牛逼的，是右边，右边！！

你以为这就结束了？作为一个职业的开发者，你当然要找到自己的方面。我最为一个iOS开发者，当然是Objective-C和Swift了，偶尔我也会看一看ruby的。当然了，安卓一定要看java了~什么？没有java？选择other language即可~

![github-11](/images/github/github-11.png)

当日期选择天的时候，一般会是一些开发者在微博@一些大v，然后引起一时轰动的项目，当然也有大项目。这些项目一般来说我觉得吧，质量参差不齐，有的很好有的也就一般..

当日期选择月的时候，那基本上就是一些很牛逼的库了，这些库一般来说真的是，开发项目必备了。这个质量，那绝对是，刚刚的。

现在语言选java，选today看下。

![github-12](/images/github/github-12.png)

我写博客的时候语言选择java的时候这样的..这时候就能发现完整的开源项目代码了，第五个！还有一些开源库。这个时候，一般我来说，看到我觉得不错的，果断下载下来阅读一下代码。觉得代码牛逼，立马star..多不带停顿的，有的库，我就直接star了..因为太牛逼看不懂。

Trending基本上我隔个几天就会看一次，有的时候闲了，每天都会看，真的一看一上午，因为有时候顺手就下载下来看看里面的代码，看看差距了..

我们再选个month看看。

![github-13](/images/github/github-13.png)

第一个，我都知道谷歌出的flexbox-layout..一般来说月排行都能考前的，那基本上就是非常非常值得开发者去用和学习的库了。

Trending会了，基本上能发现不少牛逼的开源库和开源的项目。这样就有的学习了。

你以为到这大招就放完了吗？怎么可能。

## awesome系列

上Github，怎么能不知道[awesome](https://github.com/sindresorhus/awesome)系列，这可是Github上总star数排名第十二的仓库。到我写文章的时候，35714star。

![github-14](/images/github/github-14.png)

当然衍生的有各种awesome...比如[awesome-ios](https://github.com/vsouza/awesome-ios)，[awesome-android](https://github.com/JStumpp/awesome-android)，[awesome-java](https://github.com/akullpp/awesome-java)，[awesome-android](https://github.com/JStumpp/awesome-android)

![github-15](/images/github/github-15.png)

[awesome](https://github.com/sindresorhus/awesome)。这玩意干啥的？简单的说，就是对某一个方面Github上的资源的汇总大贴！

不想上Trending查，上awesome，帮你解决一切问题。比如[awesome-android](https://github.com/JStumpp/awesome-android)上有网络请求库，json解析库等等一系列功能的汇总，当然了，还有完整项目的汇总，我就不找了..毕竟iOS出生，安卓不熟悉。

你以为到这大招就放完了吗？怎么可能。

## [free-programming-books](https://github.com/vhf/free-programming-books)

这可是Github上总star数排名第三的仓库。到我写文章的时候，55328star。

![github-16](/images/github/github-16.png)

免费的电子书！最重要的是，有中文的，有中文的，有中文的..重要的事情说三遍。虽然我推荐还是看中文，因为某些翻译简直爆炸。[free-programming-books-zh](https://github.com/vhf/free-programming-books/blob/master/free-programming-books-zh.md)地址放这了~

你以为到这大招就放完了吗？怎么可能。

## 搜索！

为啥加感叹号？因为这个功能，太牛逼了。

这个得举例说明...对了插一句，Github有时候访问超级慢。我都是走代理走的..

现在我们进到搜索界面，尝试搜索一下alert。

![github-17](/images/github/github-17.png)

什么，哇好多但是我现在要搜索Swift的资源怎么办？左边有语言选择！点完就能进去。

![github-18](/images/github/github-18.png)

什么，我要的语言没有，我想查一下ruby的alertview。那么，在搜索框输入，language:c就可以啦~

![github-19](/images/github/github-19.png)

什么，这些星星星数好少啊。左边有选择哦，可以选择星星数量排序。

![github-20](/images/github/github-20.png)

什么，我要1000star以上的项目！输入框加上stars:>=500!当然可以和language组合了~

![github-21](/images/github/github-21.png)

什么，我要查找fork过的仓库，很多人会fork一份自己加很多东西，加上 fork:true就可以啦。

什么，我怎么知道这么多？看选择语言的下面！

![github-22](/images/github/github-22.png)

在Cheat sheet里面有的！

![github-23](/images/github/github-23.png)

什么，我懒得记那么多啊？在Advanced search里面可以输入的！

![github-24](/images/github/github-24.png)

> 当然了，有时候我会觉得Github自身的搜索不行..我就会上谷歌..直接Github + 关键字..

不过大部分时间还是可以的。

这样的话，如果我在搜索框输入个star数量，（不能什么都不输入！因为有限制！），就可以看到Github上仓库的star排名了~

## Github API

Github作为全世界最大同性交友网站，当然会开放接口了。可以自己做很多基于Github的客户端，也是一个练手的好方法。

在网站的最下面找API，点进去就可以啦。里面有很多开放接口，基本都是json格式的接口，用来做一个移动应用真是再好不过啦。

网址 [Overview](https://developer.github.com/v3/)

我就不详细介绍了。

## 最后

以上，是我用Github那么久以来的一点感受。我一直觉得，学习写代码，最好的地方，就是Github，大量的看别人的源码，别人的开源库，能和世界上最顶尖的开发者一起学习，多么开心的一件事情~

对了，插一句。在iOS开发界有一个人，他是优酷的开发者，因为发布了几个很牛逼的库，收到了facebook和uber的offer！他说他的学习方式，就是上Github看源码，然后自己琢磨写。

所以，我们都加油吧~
