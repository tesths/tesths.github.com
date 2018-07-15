---
layout: post
title:  Cocoa 封装 ffmpeg
date:   2018-6-12
categories: ffmpeg
---


上次写完推文之后发现压制还是很麻烦，转念一想，要么自己做一个 GUI 的吧，于是有了将近三星期零零散散的开发。

下面把我开发的过程记录下。

## 如何使用 ffmpeg

在 iOS 开发中，ffmpeg 是使用编译过的文件进行开发。而在 Mac 中，我查阅了一部分资料，（可能是我花的时间太少），最后查询的结果是直接使用可执行文件。

这里就很简单了，直接把 ffmpeg 拖进工程，然后使用 nstask 来调用就可以了。

## drag and drop

drag and drop 是这种程序标配的了。好在 drag and drop 有很多学习资料。文章最后会放上我查阅的一些资料。

## 小细节

有很多小坑是我整个过程中踩的，比如 NSButton 的文字居中。比如 nstask 的暂停。我使用了别人的代码，但是发现变量初始化有问题。排查了半天。

## 开源

根据我的预期，这个项目是会开源的...但不是在现在。大概我测试写完会开源出去。所以多的就不写了。反正这个代码写的也不咋样，但是效果还凑合！

就这。

### 参考资料

1. [Drag and Drop Tutorial for macOS](https://www.raywenderlich.com/136272/drag-and-drop-tutorial-for-macos)

2. [NSTask Tutorial for OS X](https://www.raywenderlich.com/125071/nstask-tutorial-os-x)

3. [Implementing a drag-and-drop zone in Swift](https://stackoverflow.com/questions/29233247/implementing-a-drag-and-drop-zone-in-swift)

4. [YoutubeDownloader](https://github.com/onmyway133/YoutubeDownloader)


