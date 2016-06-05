---
layout: post
title:  记一次Mac软件的踩坑过程
date:   2016-6-5
categories: Mac
---

11个月前，有一款mac软件，叫做[Foldery](https://itunes.apple.com/us/app/foldery/id815333099?mt=12)。pinapps推荐了。简单的说，可以把mac下蓝色的文件夹换成其他颜色。

那时候限免不知道为啥没买。最近在想它怎么实现的。因为现在要花12块钱才能买来使用，我印象中是替换颜色，所以我一直以为是把系统所有文件夹的颜色都替换了。于是就按照这个思路往下想。首先想到的是Applescript修改finder属性，但是经过一番查询，这条路失败了。这应该是上上周干的了..然后就想有没有接口可以，有，apple提供了[Finder Sync extension](https://developer.apple.com/library/ios/documentation/General/Conceptual/ExtensibilityPG/Finder.html)的接口，可以增加finder的角标还有sidebar icon。不过下载了一下demo看了一眼api，只能对finder进行一些简单的操作。附一句，dropbox就这么干的。不过，这条路就这么死了。

然后就开始思考[xtrafinder](https://www.trankynam.com/xtrafinder/)怎么干的，上星期的时候看到了inject code in finder，有两个github的项目[mach_override](https://github.com/rentzsch/mach_override)，[mach_inject](https://github.com/rentzsch/mach_inject)，xtrafinder应该就是这么干的。但是想了想，人家上架了appstore。应该不会那么复杂吧，而且权限应该还不够。这条路，也死了。

之后想，是不是applescript有接口。结果我把一本[Basics of AppleScript](https://www.gitbook.com/book/nayanseth/basics-of-applescript/details)翻完了都想不到原理。

最后就到了昨天。昨天的查着查着看到系统图标的位置。其实finder什么的都是mac app，mac下可以看到resource，修改系统图标就都修改了。经过一番尝试，图标格式icns好像，神奇的格式。就是苹果专业图标格式。后来才发现可以直接用preview改...找到系统的图标处准备修改，发现没有权限，不过想了想应该就是这么干的了。

现在要解决权限问题，mac升级之后，对系统进行了保护，要关保护。见我的[Mac升级10.11 EI Captain 填坑](http://walkginkgo.com/mac/2015/11/19/mac-eicaptain.html)那篇文章。然后应该就可以解决权限问题了。不过这么着干和xtrafiner差不多了。想想肯定不能上架。万念俱灰。准备查查网上有没有这方面的文章，结果尼玛，我查到了[Foldery](https://github.com/BettyLab/Foldery)的源码，在github上。本来不想看了，后来想想差不多也完成整个思路的整理了。进去一看，直接NSWorkspace获取当前文件夹的图标位置然后覆盖一层拉倒。想想不对啊，不是全部替换嘛，后来仔细一看才发现，是单独替换。

就这样，历时快两周，完成了一次伟大的踩坑。
