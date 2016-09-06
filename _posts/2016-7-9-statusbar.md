---
layout: post
title:  Mac状态栏Hack
date:   2016-07-09
categories: Mac
---

> 依旧是一篇探究 Mac 软件原理的文章

前几天在用小历的时候，发现了这么一个功能。

![2016-07-09_status1.png](http://o9791noio.bkt.clouddn.com/2016-07-09_status1.png)

选择之后，小历会从这样变到这样。

![2016-07-09_status2.png](http://o9791noio.bkt.clouddn.com/2016-07-09_status2.png)

![2016-07-09_status3.png](http://o9791noio.bkt.clouddn.com/2016-07-09_status3.png)

然后我就开始想这个是怎么实现的，这里我们必须要对比一个软件，卖了105.88人民币的著名 Mac 状态栏管理软件 [Bartender 2](https://www.macbartender.com/)。

在 Bartender 中有一个功能，你可以按住 ⌘ 之后点击图标来拖动来改变它在 Mac 状态栏的位置，就像这样（看网易云音乐）。

![2016-07-09_status4.png](http://o9791noio.bkt.clouddn.com/2016-07-09_status4.png)

如果 Bartender 可以的，那为什么小历不能这么做，这样的话用户体验不是更好吗？于是开始了一轮疯狂的 Google 和 Stackoverflow 。

结果结论是，在老版本的 Mac 操作系统中，是默认支持 ⌘+ 图标改变位置的，但是在 10.11 中，这个功能被取消了，只有使用 Bartender 来改变位置。而在 Apple 给出的 API 中，没有可以改变状态栏图标位置的方法。那么 Bartender 是怎么实现的，小历又为什么不能实现。之后就是接着查。

经过不断的改变关键字..在某一个 Stackoverflow 中发现了一个叫做 **NSMenuExtra** 的类，这是私有的 API ，在这个方法中，可以实现 Bartender 中的那个改变位置的效果，但是如果使用了苹果私有的  API ，应用是不能上线到 App Store 的，小历上线到了 App Store ，说明没有用到私有 API，之后我就一片混乱了...

无耐之下，我在微博上给小历的作者发了一个私信，没想到很快小历的作者就给我回复了！他给了我一个 Github 的地址，[NSStatusBar-MISSINGOrder](https://github.com/shergin/NSStatusBar-MISSINGOrder)

![2016-07-09_status5.png](http://o9791noio.bkt.clouddn.com/2016-07-09_status5.png)

之后我看了一下，正如作者所说，是构造了一个 **Selector**，但实际上是用 Hack 的方法调用了两个方法

`- (void)_insertStatusItem:(id)arg1 withPriority:(long long)arg2;`

`- (id)_statusItemWithLength:(double)arg1 withPriority:(long long)arg2;`

我们来看这两个方法。**Priority** 实际上是确定位置的，优先级越高，位置越靠左。但是问题在于，这两个方法不在 **NSMenuExtra** 中，那么这两个方法又是哪来的呢？

其实这两个方法是 Apple 留下的后门，这两个方法是 **NSStatusBar** 中没有公开的 API。

于是，我决定开始使用 class-dump 来查看未公开的 API。

`./class-dump -H -o ~/Desktop /System/Library/Frameworks/AppKit.framework`

这个命令会把 **AppKit.framework** 中的所有方法都导出一个一个的.h文件。

在里面找到 **NSStatusBar.h**，就可以看到这两个方法了。

![2016-07-09_status7.png](http://o9791noio.bkt.clouddn.com/2016-07-09_status7.png)

所以在小历当中，怎么说呢..其实是调用了私有的 API，但是不明显，而且调用的很少。所以上线到 App Store 是没有太大问题的。

下面我们来猜测一下 Bartender 可以把所有图标放到状态栏下面那行的大概原理。

`./class-dump -H -o ~/Desktop/private /System/Library/PrivateFrameworks/SystemUIPlugin.framework/Versions/A/SystemUIPlugin`

这个命令会把 **NSMenuExtra** 相关的.h头文件导出。还有其他的一系列头文件。

![2016-07-09_status6.png](http://o9791noio.bkt.clouddn.com/2016-07-09_status6.png)

**NSMenuExtra** 中有 drawRect 方法，应该就是先画 view，然后把图标放进去就可以啦。

至于按⌘拖动那个嘛..我估计，应该是提供了某个方法，可能是在 **NSMenuExtraView** 中的 **mouseDown** 方法，但是没文档啥的，我不确定..就得试和看命名了，我就不继续深究了。因为本来也就是一次探究大概原理的文章，主要是我 Bartender 都买了..也就没有什么继续研究的动力了哈哈。

小小总结一下。

如果是做 Mac 开发的，class-dump 是个好东西，因为在 Mac 上，你可以不上线 App Store 来分发你的应用，那么我们就可以调用私有  API 来 Hack 很多好玩的功能，这样其实是很好的。比如 Bartender，100多块钱而且基本用 Mac 都会买，还是可以赚上一笔的。

其次，class-dump 导出的头文件是没有文档的，这个就真的纯靠试和看命名了。需要开发者的耐心和不怕死的心。

参考链接：

1. [Building NSMenuExtra - A Small Tutorial](http://cocoadevcentral.com/articles/000078.php)
2. [NSMenuExtra – working with undocumented APIs](https://duhanebel.wordpress.com/2010/04/02/nsmenuextra-how-to-work-with-undocumented-apis/)
3. [NSStatusBar-MISSINGOrder](https://github.com/shergin/NSStatusBar-MISSINGOrder)
4. [MAC系统状态栏通过插件添加图标MenuExtra Plugin](http://www.tanhao.me/code/1672.html/)
5. [Cocoa菜单栏右侧图标的实现](http://linfan.info/blog/2012/02/28/cocoa-icon-on-right-side-of-menu-bar/)