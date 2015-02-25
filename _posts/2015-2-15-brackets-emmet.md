---
layout: post
title:  关于前端文本编辑器的废话和Emmet部分文档说明
date:   2015-02-25 ‏‎23:10:08
categories: 前端
---


### 第一部分：关于前端文本编辑器的废话（可直接略过）
因为寒假看了一点点前端的东西。一开始在挑文本编辑器。首先想到的是linux下的vim。后来硬是把vim下安装插件的vundle都研究了一遍，没有找到的好的js自动补全功能的配置和插件。在我纠结了三四天之后，我决定放弃vim。(好像有人用emacs这种编辑器之神写前端，我实在是不想尝试了…有机会会研究一下emacs的)。

其次的选择就是sublime了。CM基本上清一色sublime。从Python到前端，还有angularjs。Sublime基本完成了大一统。但是我在写js的时候发现它对js自动补全的支持没有那么好。（可能是我插件没怎么安装，懒得倒腾了）主要我xcode用多了。依依不舍别过sublime。

接着就是搜索了一下前端的编辑器。Github的Atom，那玩意写markdown倒是不错。自动补全功能，感觉就好像没有自动补全功能。插件功能未实验。

Jetbrains系列，有个webstorm。Jetbrains系列都要钱，虽然学生免费。放弃。但是jetbrain系列确实好用啊，良心，毕竟收费。

Notepad++，放弃。Notepad++适合看代码。

Lighttable，lighttable其实还不错，和sublime已经很相似了。但是对js的一些方法的补全没有那么好。Lighttable是ClojureScript写的的，很厉害。

最后挑来挑去挑到adobe的brackets。在写js函数的时候终于有自动补全了啊我好开心。
然后就是装了一些插件，后文会附上我用的插件列表。装插件的时候发现了第二部分的主题。Emmet。

![brackets-emmet-1](/images/brackets-emmet/brackets-emmet-1.jpg)
 
### 第二部分：Emmet部分文档说明
第二部分的文章，将基于上图来阐述。我将会介绍在brackets下，我截图的emmet菜单里所有功能的用途和使用。
这些emmet的功能看上去复杂，其实很简单，我会一一说明，如果你是sublime的用户，你也可以参考我的文章，也可以参考emmet在github上的主页，sublime的emmet插件在github上有连接对应到emmet官方的文档。Emmet官方的文档是带有效果图的，可以方便理解它的功能。（sublime用户的emmet顺序可能和brackets不同，但是具备的功能大多相似）
我这里再次进行阐述的意义，一在于方便我个人以后查阅，二是我在此过程中再次熟悉一下里面的各项功能。
一下所有内容基于brackets。

**开始**。

首先介绍一下简单emmet使用，举个简单的例子，我在brackets下输入![brackets-emmet-2](/images/brackets-emmet/brackets-emmet-2.png) 
之后按下tab键，会出现![brackets-emmet-3](/images/brackets-emmet/brackets-emmet-3.png)极大减轻了代码量。
具体使用方法[参见](http://docs.emmet.io/cheat-sheet/)


[官方文档地址](http://docs.emmet.io/)  里面有很少的地方不能完全对应官方的文档，差别很小。

**然后是介绍brackets里的功能。**

**Previous editor point && next edit point 对应文档 Go to Edit Point [连接](http://docs.emmet.io/actions/go-to-edit-point/)**

到达之前的编辑点，到达下一个编辑点。

举个例子，现在输入![brackets-emmet-4](/images/brackets-emmet/brackets-emmet-4.png)按下tab![brackets-emmet-5](/images/brackets-emmet/brackets-emmet-5.png)
如果此时光标在![brackets-emmet-6](/images/brackets-emmet/brackets-emmet-6.png)那么按下next edit point会到达![brackets-emmet-7](/images/brackets-emmet/brackets-emmet-7.png)
再按下next edit point会到达下一个class里。同理，如果此时按下Previous editor point，会到达第一个class里。

**Evaluate math expression 对应文档 Evaluate Math Expression [连接](http://docs.emmet.io/actions/evaluate-math/)**

计算数学表达式。

这个主要是计算css。举个例子 ，输入![brackets-emmet-8](/images/brackets-emmet/brackets-emmet-8.png)然后按下快捷键，会得到![brackets-emmet-9](/images/brackets-emmet/brackets-emmet-9.png)。
可以进行多重的加减乘除。

**Expand abbreviation 对应文档 Expand Abbreviation [连接](http://docs.emmet.io/actions/expand-abbreviation/)**

这个就是对应我们的tab键，最主要的emmet功能。

**Balance(inward)&& Balance(outward) 对应文档 Match Tag Pair [连接](http://docs.emmet.io/actions/match-pair/)**

当我的光标处在![brackets-emmet-10](/images/brackets-emmet/brackets-emmet-10.png)时，按下Balance(outward)，此时会选中所有的![brackets-emmet-11](/images/brackets-emmet/brackets-emmet-11.png)，再按下Balance(outward)，会选中![brackets-emmet-38](/images/brackets-emmet/brackets-emmet-38.png)整个<li\>标签，再按下Balance(outward)，会选中![brackets-emmet-12](/images/brackets-emmet/brackets-emmet-12.png)，再按下Balance(outward)，会选中全部的内容。Balance(inward)正好是反过来选择，我就不详细叙述了。

**Go to matvhing tag pair 对应文档Go to Matching Pair [连接](http://docs.emmet.io/actions/go-to-pair/)**

到达对应的标签。

当我的光标在![brackets-emmet-13](/images/brackets-emmet/brackets-emmet-13.png)时，按下Go to matvhing tag pair，光标会到达![brackets-emmet-14](/images/brackets-emmet/brackets-emmet-14.png)， 对应标签的最前面。

**Merge line 对应文档 Merge Lines [连接](http://docs.emmet.io/actions/merge-lines/)**

合并行。 

![brackets-emmet-15](/images/brackets-emmet/brackets-emmet-15.png)光标如红线。 按下快捷键，会![brackets-emmet-16](/images/brackets-emmet/brackets-emmet-16.png)。

**Reflect value 对应文档 Reflect CSS Value [连接](http://docs.emmet.io/actions/reflect-css-value/)**

统一调整css数值。
借用官方的例子。


![brackets-emmet-17](/images/brackets-emmet/brackets-emmet-17.png)现在![brackets-emmet-18](/images/brackets-emmet/brackets-emmet-18.png)光标在红线，按下快捷键，![brackets-emmet-19](/images/brackets-emmet/brackets-emmet-19.png)全部调整为50。

**Remove tag 对应文档 Remove Tag [连接](http://docs.emmet.io/actions/remove-tag/)**

删除标签。

将光标移植要删除的标签内，![brackets-emmet-20](/images/brackets-emmet/brackets-emmet-20.png)，按下快捷键，![brackets-emmet-21](/images/brackets-emmet/brackets-emmet-21.png)。


**Select next itm&&select previous item 对应文档 Select Item [连接](http://docs.emmet.io/actions/select-item/)**

![brackets-emmet-22](/images/brackets-emmet/brackets-emmet-22.png)光标如红点，按下Select next itm，会选中整个html标签![brackets-emmet-23](/images/brackets-emmet/brackets-emmet-23.png)，再按下，选中整个div标签![brackets-emmet-24](/images/brackets-emmet/brackets-emmet-24.png)，再按下，到p标签。select previous item相反。

**Split/join tag declaration 对应文档 Split/Join Tag [连接](http://docs.emmet.io/actions/split-join-tag/)**

分开/合并标签

![brackets-emmet-25](/images/brackets-emmet/brackets-emmet-25.png)光标在标签内，按下快捷键，![brackets-emmet-26](/images/brackets-emmet/brackets-emmet-26.png)，再按一次![brackets-emmet-27](/images/brackets-emmet/brackets-emmet-27.png)


**Toggle comment 对应文档 Toggle Comment [连接](http://docs.emmet.io/actions/toggle-comment/)**

注释

![brackets-emmet-28](/images/brackets-emmet/brackets-emmet-28.png)光标位置，按下快捷键，![brackets-emmet-29](/images/brackets-emmet/brackets-emmet-29.png)。
![brackets-emmet-30](/images/brackets-emmet/brackets-emmet-30.png)光标位置，按下快捷键，![brackets-emmet-31](/images/brackets-emmet/brackets-emmet-31.png) 。
就是两个tag之间的。另，在brackets里，按下ctrl+/是光标所在单行注释。

**Wrap with abbreviation 对应文档 Wrap with Abbreviation [连接](http://docs.emmet.io/actions/wrap-with-abbreviation/)**

添加新的emmet。

![brackets-emmet-32](/images/brackets-emmet/brackets-emmet-32.png)按下快捷键（我的快捷键和qq冲突了…我用的点击）![brackets-emmet-33](/images/brackets-emmet/brackets-emmet-33.png)
出现一个这个。输入html![brackets-emmet-34](/images/brackets-emmet/brackets-emmet-34.png)。添加了一段新的html标签。

**Update tag 对应文档 未找到**

更新标签

![brackets-emmet-35](/images/brackets-emmet/brackets-emmet-35.png)按下快捷键输入![brackets-emmet-36](/images/brackets-emmet/brackets-emmet-36.png),![brackets-emmet-37](/images/brackets-emmet/brackets-emmet-37.png) 。


下面的连续六个和数值有关的是在css里面遇到数值的时候，可以调节数值大小，我就不具体阐述了。对应文档 Increment/Decrement Number 对应[连接](http://docs.emmet.io/actions/inc-dec-number/)

Brackets最后一个expand abbreviation (interactive)是出现输入框，添加emmet缩写的。

这是回学校前最后一篇技术博客。

后期的计划可能会明天发出，就这样。

希望你能留个言捧个场~
