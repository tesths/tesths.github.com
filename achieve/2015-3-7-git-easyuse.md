---
layout: post
title:  命令行git简单使用
date:   2015-03-07 ‏‎21:44
categories: git
---


**早就说写一篇关于git使用的博客一直没写。今天下午休息，打了篮球和羽毛球。看了电影。现在要开始做点正事了。**

**这篇文章可能关于git命令行的语句不多，但是我觉得都是我在搭建jekyll的过程中遇到的。我会尽可能的说明这些命令行的作用。**

**因为git的操作比较多，还有什么分支合并新建分支什么的，还没有很好的去研究。这篇文章主要对简单的命令行进行叙述，一般上传代码合并代码是没有问题的。**

####以下文章都是基于我个人的使用和理解，不喜勿喷。####


## 开始正文
---

> ### Git简介

这篇文章不介绍github，介绍git命令行，但是有必要对git和github是什么进行一个说明。你可能听说过github，据说github是世界上最大的同性社交网站。当然是开玩笑的。简单的说，github是一个开放源代码保存的地方，github也是合作项目开发的首选地。

那么git呢，git是一个仓库，一个你用来保存代码的地方。

所以，当我在github上注册了帐号之后，我可以将我的代码上传到git上进行保存，也可以大家合用一个仓库来合作开发。

当然，git本身是开放的，别人可以看到你的源代码，如果是想变成不开放的，那么你就需要像github付费了。你可以去coding看一看，coding提供了免费的git仓库。我们项目的开发都是用的coding。

> ### Git命令行

Github官网上提供了[图形界面](http://git-scm.com/downloads/guis)。

图形界面的使用比较简单，具体使用迪哥曾经写过一篇关于mac下sourcetree的使用。[sourceTree git管理协同使用方法，mac下的git管理工具](http://bbs.uestc.edu.cn/forum.php?mod=viewthread&tid=1468187)。可以对照看一下。在这里不对图形化界面进行详细介绍。

因为很多时候还是需要git的命令行，下面将进行简单的git命令行使用。
我的环境是ubuntu14.04。

---

#### 首先我介绍我们在使用sourcetree时的上传代码流程。命令行是相同的。

>上传代码到合并代码到拉代码的主要过程是这样的。

> **add->commit->fetch->pull->push**
> 
> 换成中文
> 
> **添加代码->提交代码->抓取代码->拉取代码->推送代码**
 
**添加代码对应git add**

**提交代码对应git commit**

**抓取代码对应git fetch**

**拉取代码对应git pull**

**推送代码对应git push**

下面将逐步介绍这些命令。



>### 安装git

Ubuntu下安装git的命令行是sudo apt-get install git，不多做解释。

>### git clone

git clone是将github上的git仓库下载到本地。
每一个github都要相应的git地址。如图

![git-easyuse-1](/images/git-easyuse/git-easyuse-1.png)
 
命令很简单，在终端下到你想要的目录，然后git clone +url +目录就可以了。git clone后面是可以加参数的，但是我在使用过程中没有用过。

![git-easyuse-2](/images/git-easyuse/git-easyuse-2.png)
 
我寒假clone vundle时用的命令，后面那一串是git clone的位置。
如果已经cd到你要clone的位置，直接git clone不用后面目录的参数就行了。

>### Git帮助

命令 git help

![git-easyuse-3](/images/git-easyuse/git-easyuse-3.png)

![git-easyuse-4](/images/git-easyuse/git-easyuse-4.png)
 
可以看到所有的git命令。git help也是可以加参数的。具体查阅帮助或者文档了。

>### git上传代码

![git-easyuse-5](/images/git-easyuse/git-easyuse-5.png)
 
就是主要这三条命令。我会详细说明这三条命令行的作用。

>### 首先第一条，git add。

git add后面可以直接加上目录，或者文件名。“.”在这里的意思就是当前目录下所有文件。

举个例子。

![git-easyuse-6](/images/git-easyuse/git-easyuse-6.png)
 
Git就会把我judi0713.github.com里所有文件全部添加了。

>### 第二个，commit，提交

首先说明参数的意思。

![git-easyuse-7](/images/git-easyuse/git-easyuse-7.png)
 
-a的意思就是提交所有改变的文件。

![git-easyuse-8](/images/git-easyuse/git-easyuse-8.png)
 
-m后面还需要加参数，就是提交信息。

在commit时候必须要commit的信息。所以-m的参数是必须的。

下面我开始具体说明。

如果直接调用git commit。会进入

![git-easyuse-9](/images/git-easyuse/git-easyuse-9.png)
 
如果你不小心进入这里，先输入一段信息即-m（你提交的内容）然后按F3（其实就是ctrl+o writeout）意思就是确认文件，如果不事先填写后面会无法commit。

![git-easyuse-10](/images/git-easyuse/git-easyuse-10.png)
 
按下F3。

![git-easyuse-11](/images/git-easyuse/git-easyuse-11.png)
 
然后回车。回到之前的提交界面。Ctrl+x exit就可以了。
然后你修改的文件会出现

![git-easyuse-12](/images/git-easyuse/git-easyuse-12.png)
 
大功告成。

一开始的时候我只用了git commit –m +msg

但是有时候会出现文件没有全部提交的问题。具体我还不知道为什么，有可能是我一开add出现问题了。

我选择的是git commit –a –m +msg。即一次性提交所有代码。这样就不用进入那个全是英文的界面了。

可以看一下效果图。

![git-easyuse-13](/images/git-easyuse/git-easyuse-13.png)

>### 第三个git push –u origin master

![git-easyuse-14](/images/git-easyuse/git-easyuse-14.png)

不清楚-u含义，查了很多都加上了-u，具体我就不说明了。

origin是远程主机。master是git的主分支。

这样就可以将本地修改的代码全部上传到远程主机了。

上传的时候需要输入你的github用户名和密码。

![git-easyuse-15](/images/git-easyuse/git-easyuse-15.png)
 

到此为止是最主要的git命令行使用了。

因为我使用的是jekyll是独立项目所以我没有拉代码这个步骤。

>**fetch和pull的区别**在于fetch是看有没有别人远程推送的代码，并不进行合并。
pull的话直接就合并了，当然也可以省去fetch的步骤，不建议省去。
在pull代码到本地的时候会有本地的代码冲突。Git很人性化的会将代码进行比对。你需要看别人是不是修改了你的代码，然后进行对别人代码的删除或者自己代码的删除。然后重新commit。
其实这是很值得写的一个东西，具体等我进行命令行的git开发的时候再详细说明。

fetch的命令就是git fetch
pull的命令就是git pull
因为我个人只用过图形化界面的git没有尝试过命令行没法现身说法。如果以后我使用命令行的话会具体再说明的。

下面再介绍一个很有意思的git命令行。

>### git status

查看git现在的状态。
比我现在已经add过了。我调用git status。

![git-easyuse-16](/images/git-easyuse/git-easyuse-16.png)

我在commit一下查看git status。

![git-easyuse-17](/images/git-easyuse/git-easyuse-17.png)

可以查看此时我的git状态。感觉还是很不错的。

---
**其实我主要介绍的还是简单的git命令行使用，是我在搭建jekyll的时候所用到的。
还有很多我都没有介绍，比如revert，回滚。可以回到之前代码的状态。需要添加状态的id。**

**还有分支，这个功能我真的没有很好的研究，有时间还是要把git研究一下。**

**还有就是git rm删除文件等等。**

**我会在使用之后再写一篇博客对我没介绍的git命令进行说明。**

**实在是觉得git很好用，免费空间。而且作为技术人，学会上github真的很重要。特别感谢迪哥给我带进github的坑，这个同性恋交友网站让我收获很多东西。**

**以前上网没事了看看河畔，现在没事了上github explore。**

**就这样，欢迎各位提意见！最好不要喷我。感谢你的支持！！**

---

今天是大学特有的女生节。祝各位女孩们永远年轻漂亮。

最主要的。

**祝信安一班的七个女孩节日快乐。红包什么的都已经象征性的发了。礼物什么的如果班长买了你们就收，没买就算了。咱都那么熟了。**

**希望你们七个没找到下家的赶紧找下家。找到下家的幸福生活。生活也许很残酷，但是要以一个积极乐观的心态去面对。**

**祝你们幸福啦~~**

也祝所有女孩们，幸福，快乐。
