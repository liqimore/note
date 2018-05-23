---
author: liqimore
comments: true
date: 2016-04-23 23:27:00+00:00
layout: post
link: http://blog.codefog.com/http-to-https.html
slug: http-to-https
title: Nginx从http跳转到https的方法
wordpress_id: 32
categories:
- 编程
tags:
- nginx从http跳转到https的方法
---

前些天把整个网站都安装了SSL证书，但是http依旧是默认进行访问的，感觉装了证书很没用，决定开启强制HTTPS访问。既：把http请求跳转到https上面。




我未成功的方法：






  1. 添加rewrite命令 ： rewrite ^/(.*)$ http://domain.com/$1 permanent;


  2. 通过meta标签 ``




我使用的方法： （http://www.v2ex.com/t/158013 作者：Keyes 感谢)




<blockquote>

> 
> 用error 497來做跳轉  

首先  

listen 80;  

listen 443;  

然後配置497頁面  

error_page 497 https://$host$request_uri;  

最後使http來路的請求轉換到https（加入到主機定義行的最後位置）:  

if ($server_port = 80) {  

return 497;  

}
> 
> 
</blockquote>




我使用1.2方法浏览器提示我多重301定向了，貌似那两种判断方式只是判断域名，不对域名前面的协议进行判断，所以造成了http://qwe.com和https://qwe.com被认为成同一个域名，使得跳转循环了，报310错误




另外：  

刚开始使用typecho，你妹的他的编辑器直接可以执行HTML代码，立即执行！！我在打上面那个meta跳转的时候直接给我跳转过去了。。之后每次点开这个草稿都自动跳过去。。。还好我手速快在它跳转之前删了个meta的括号。。。长记性了



