---
author: liqimore
comments: true
date: 2016-08-06 19:04:24+00:00
layout: post
link: http://blog.codefog.com/php-server.html
slug: php-server
title: $_SERVER['SCRIPT_NAME']、$_SERVER['SCRIPT_FILENAME']及__FILE__ 的不同
wordpress_id: 46
categories:
- 编程
---

在PHP中，有时需要知道脚本所处的位置，这时会用到$_SERVER['SCRIPT_NAME']、$_SERVER['SCRIPT_FILENAME']及**FILE**。那么他们之间有什么不同呢？




1、$_SERVER['SCRIPT_NAME']  

先说 $_SERVER['SCRIPT_NAME'] ，它是包含当前运行脚本的路径，这是从客户端来看的路径。假如你访问的URL地址为 http://www.yourdomain.com/test/test.php，那么在脚本中 $_SERVER['SCRIPT_NAME'] 将会是 /test/test.php 。如果你想引用脚本自身，例如把一个表单提交给自己处理时，这可以用这个。




那 么在b.php中，$_SERVER['SCRIPT_FILENAME']可能会是 /home/a88888888/public_html /test/a.php。虽然$_SERVER['SCRIPT_FILENAME']是在b.php内，但b.php是在a.php内运行的，因此得到 的是a.php的路径。而在b.php中，**FILE**可能会是 /home/a88888888/public_html/test/b.php， 这是**FILE**所处的真正位置。




另外还有一个$_SERVER['PHP_SELF']，看上去似乎和$_SERVER['SCRIPT_NAME']一样，不过如果你访问的URL地址为 http://www.yourdomain.com/test/test.php/foo.bar，那么 $_SERVER['PHP_SELF'] 将会是 /test/test.php/foo.bar。服务器获取当前文件名时会用到！



