---
author: liqimore
comments: true
date: 2017-02-05 17:33:20+00:00
excerpt: "ss是使用文本文档来保存代理规则的,GFWlist也是如此,但是总有一些我们需要的网站不在list中,每次开启全局代理非常麻烦,这里就需要我们自定义规则了,很幸运的是ss客户端支持自定义规则,即:user-rule.txt文件.\n\
  \n        首先,打开你的ss根目录,或者邮件ss客户端的小飞机,PAC->编辑GFWList用户规则,之后打开默认选中的那个TXT文档."
layout: post
link: http://blog.codefog.com/custom-user-rule.html
slug: custom-user-rule
title: SS代理用户自定义规则(user-rule)的方法和格式
wordpress_id: 322
categories:
- 分享
---

ss是使用文本文档来保存代理规则的,GFWlist也是如此,但是总有一些我们需要的网站不在list中,每次开启全局代理非常麻烦,这里就需要我们自定义规则了,很幸运的是ss客户端支持自定义规则,即:user-rule.txt文件.

首先,打开你的ss根目录,或者邮件ss客户端的小飞机,**PAC->编辑GFWList用户规则**,之后打开默认选中的那个TXT文档.

![1](https://static.timelovelife.com/old/2017/02/1.jpg)

之后在文件中新添加一行,在你需要代理的域名前加 "||"两个竖线,如图:

![2](https://static.timelovelife.com/old/2017/02/2.jpg)

这样就简单的添加了一个新的自定义规则,除了这种超级简单的格式之外,还有更多定制的格式,可以实现更加详细的代理划分,比如:



 	
  1. 通配符支持。比如 `*.example.com/*` 实际书写时可省略 `*` ， 如`.example.com/` ， 和 `*.example.com/*` 效果一样

 	
  2. 正则表达式支持。以 `\` 开始和结束， 如 `\[\w]+:\/\/example.com\`

 	
  3. 例外规则 `@@` ，如 `@@*.example.com/*` 满足 `@@` 后规则的地址不使用代理

 	
  4. 匹配地址开始和结尾 `|` ，如 `|http://example.com` 、 `example.com|` 分别表示以 `http://example.com` 开始和以 `example.com` 结束的地址

 	
  5. `||` 标记，如 `||example.com` 则 `http://example.com` 、`https://example.com` 、 `ftp://example.com` 等地址均满足条件

 	
  6. 注释 `!` 。 如 `!我是注释`




更多规则可以参考ADBLOCK广告屏蔽规则写法,链接:https://adblockplus.org/en/filter-cheatsheet
