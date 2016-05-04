---
layout: post
title:  开发者头条插件小记
date:   2016-5-4
categories: iOS
---

> ### [Github地址](https://github.com/judi0713/TouTiao)

> ### [下载地址](https://github.com/judi0713/TouTiao/releases)

先要感谢
---

这不是软文，是真的感谢。

开发者头条是我安利过很多人的网站。因为说实话，做的真的很好。如果我觉得不好我就会换个网站开发插件了..在这里很多人会投稿一些些的好的文章。可以看到各个方面的知识。而且大部分的文章质量都很高（我已经从csdn迁移到开发者头条了）。慎哥也因为自己的投稿让自己的博客收获了很多的访问量，这对于开发者坚持写博客是一个很好的鼓励。所以，很感谢这么一个网站让我学到了很多东西。也让我扩充对整个计算机行业方面的认识不仅限于appweb还有后台了。

无论如何要感谢开发者头条的创始人戚祥，当我在微信联系他和他说的时候，他觉得想法很好，然后让他们公司的工程师蒋春成联系了我。感到非常巧合而又幸运的是，他是我11级的学长。遇到了校友真的很亲切，和学长聊了好久啊，而且都是计算机人。蒋春成给了我很多帮助。不仅给了我很多意见，还给了我很多开发需要的素材。

当然，还要感谢工作室的小伙伴，两台Mac电脑总是被我强行装上测试...特别感谢的还有慎哥，慎哥头一回那么支持工作，不仅装上了，还提了很多意见，大写的感谢。dkk同学甚至提了issue...也是厉害。

最后，当然是感谢iOS开发大社区，摸着良心说，我写不出来Alamofire和Fuzi这种库。我只能凑合凑合尽我最大努力看源码和用去学习。没有这些为社区做贡献的大神们，也就没有很多个应用。

起因
---

有开发Mac端插件的想法有两个原因，一是因为为了带小学弟，学起了Swift。二是因为看到了[Tailor](https://github.com/kimar/Tailor)这个Mac端的插件。当我看到Tailor的时候我第一个想法是，卧槽，swift改变世界，第二个想法是，看上去Mac端开发也不难，估计api都差不多...尝试一下吧...

然后那几天就在想图拉鼎大神的Mac软件怎么做的。。正好那几天看OpenWrt需要php，php可以调shell和系统接口。想了想，啊，Mac软件开发嘛，就是调applescript和写iOS嘛，来试试吧～

然后我就入坑了..在这大概分享一下整个的完成过程。

总结一句话，看源码。这学期虽然没有看什么大项目的..倒是完整的工程看了不少。我一次列在下面好了。

1. [Tailor](https://github.com/kimar/Tailor)
2. [OS X Tutorial: Menus and Popovers in Menu Bar Apps](https://www.raywenderlich.com/98178/os-x-tutorial-menus-popovers-menu-bar-apps)
3. [Getting Started With OS X and Swift Tutorial: Part 1/3](https://www.raywenderlich.com/87002/getting-started-with-os-x-and-swift-tutorial-part-1)
4. [producthunt-osx](https://github.com/producthunt/producthunt-osx)
5. [Fuzi](https://github.com/cezheng/Fuzi)

第一个就是有这个想法的来源。第二个第三个是ray上的教材，我没仔细看，直接把demo下下来的。第四个是那几天正好看到producthunt做了一个类似的，直接就下载了。Fuzi是用来解析xml的。大改就是这些东西。

遇到的坑
---

遇到的第一个坑，是tableview不识别identifier...后来不知道咋的自己就好了。。这个坑后来想了想，可能是改名字之后需要重新设置一下...想不到其他的了。感觉就是把所有的重新设置一下自己就好了。

第二个坑就是xml解析了。我依次尝试了[Fuzi](https://github.com/cezheng/Fuzi)（Tailor里使用的），[Kanna](https://github.com/tid-kijyun/Kanna)（这个是[Yep](https://github.com/CatchChat/Yep)里用到的），[AEXML](https://github.com/tadija/AEXML)（这个是[swiftgg](http://swift.gg/)在一片文章提到的），最近有看到雅虎的一个[SwiftyXMLParser](https://github.com/yahoojapan/SwiftyXMLParser)（这个也是swiftgg提到的），还没试验..但是看上去挺好的。

我的思路在一开始错了，几乎所有的解析xml都是可以用[xpath](http://www.w3schools.com/xsl/xpath_intro.asp)来解析的，但是吧，我这个人偷懒，不想去学xpath，这就导致了我一路想用css来解析，后来发现坑了。于是开始转换思路写xpath，对着Tailor的解析写，很快也就搞定了。xpath是一个很好的东西，真的值得去了解和学习一下。

第三个坑，其实也不算坑，但是确实是个问题，就是Mac和iOS的迁移问题。正好，就那么巧...虾神前几天发了一篇UXKit的公众号文章，非常值得看下。对于我这种小项目，我觉得完全可以采用UXKit的方式。虾神在里面说的比我好太多了..毕竟不是一个水平。

不过说实话，我没想到Mac和iOS的api会差那么多。后面还是值得学习一下的。

最后就是，我在整个项目当中，是没有用到applescript的，但是这是Mac开发很重要的东西，后面也会想办法去尝试一下applescript。这是我很遗憾的一点。

彩蛋。

在看Tailor的代码的时候看到了函数式编程的东西..这也算是swift语言很重要的一点，我在上一篇的博客的时候介绍了部分haskell的东西。最近有在继续haskell的学习，所以顺便提一下。

在网络层，Tailor作者用了map函数，还用了flatmap，很好的对数据进行了分组解析再合并。这一块的代码我实在是觉得太nice了，就抄了。当然整个开发过程中很多代码都是抄的...

最后
---

我总和工作室的人说。要回馈这个社区，要懂得感恩。这一次我好像做了那么一点努力。这大概就是之前工作室死了的那个项目小初的初衷不忘初心吧。

之前因为做外包，也不会很认真的去看一些很牛逼的库，就是一味的实现功能。不会去像现在这样去做点自己觉得好玩的东西，去尝试一些没尝试过的东西。至少这次做了一个东西，自己会去用。之前的外包项目，我手机里都没安装。

而且就像蒋春成和我说的那样，这次，真的很有成就感。虽然这个代码的难度不高，实现的功能不复杂，但是做的很开心啊，也愿意去做。

即使没有外包没有钱，一种纯“情怀”的状态。

所谓穷开心，大概就是这么一种状态。

祝开发者头条越来越好，我这个重度投稿者也会继续投稿我觉得质量上乘的文章的~