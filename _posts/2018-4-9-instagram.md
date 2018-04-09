---
layout: post
title:  浅谈解决 Instagram 推送失效的问题
date:   2018-4-9
categories: linux
---

最近由于某些需要。需要关注 Instagram 的博主，ins 本身是提供了推送服务的，但是由于各种原因，经常收不到推送，这就需要自己采取爬虫的形式。

## 推送服务

推送服务有很多选择，除了国内的平台都可以。我在这里采取了比较灵活的 telegram bot。tg 是一款很伟大的产品，很简单的方式就可以对接机器人自动发布消息。

我采用了 [telegram-bot-ruby](https://github.com/atipugin/telegram-bot-ruby) 这个 gem，来将 ruby 脚本和 tg 联系起来。

虽然我更推荐你们使用 python 或者 php，在 GitHub 上有很多和 ins 相关的 python 的库，甚至可以调用到 ins 私有的 api 接口。由于我最近的技术栈都是 ruby 所以就采用了 ruby。

## 爬虫获取

ins 自身的网络请求是 api 分离的，这意味着如果爬虫爬取到了 json 接口之后可以直接获取 json 的数据。只需要在所有的 url 后面加上 ?__a=1 即可获得 json 格式的数据。

## 爬虫方案

我采取的方案是每 5s 请求一次。对比前一次和这一次的区别。这里就不详细叙述了。

## 网络请求优化及异常处理

由于我的程序一开始写的不够规范，导致重复请求过多。而 instagram 对于请求频率过于高的 ip 会返回 429 错误。429 是请求次数过多。

而在请求错误过多的情况下，会导致异常处理。这里我采取 try catch 的方案。

在逐步优化后我的爬虫现在平均每分钟运行 12 次。已经处于不会被封的范围内了。

## 小彩蛋

graphql 已经被 Instagram 采用。突然有一天的接口全部是 graphql 了。导致的就是需要重新修改 json 的解析。现在的解析还是有点复杂的。

## 开源

我已经将代码开源在 https://gist.github.com/tesths/24b211eeae5acd5097e3efd647057acb。由于之前写的还有很多 try catch 的异常没有完全写进去，但是因为已经基本满足我的使用需要所以就没有继续完善。

