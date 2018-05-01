---
author: liqimore
comments: true
date: 2016-08-04 00:31:44+00:00
layout: post
link: http://blog.codefog.com/dns-qcloud.html
slug: dns-qcloud
title: 腾讯云服务器CentOS6.5无法更新源解决办法,提示:Couldn't resolve host 'mirrors.tencentyun.com
wordpress_id: 44
categories:
- 编程
---

众所周知，腾讯云服务器内网yum源的域名 mirrors.tencentyun.com 需要有**内网的DNS**才能访问，但是实际情况下，我们会根据需要修改DNS，为了使用腾讯云内网快速稳定的内网源，我们需要把**DNS恢复为内网DNS**，下面为各地区服务器DNS地址。




北京服务器：




nameserver 10.53.216.182  

nameserver 10.53.216.198




广州服务器：




nameserver 10.182.24.12  

nameserver 10.182.20.26




上海服务器：




nameserver 10.237.148.54  

nameserver 10.237.148.60




香港服务器：




nameserver 10.145.0.57  

nameserver 10.145.0.58




北美服务器：




nameserver 10.116.19.185  

nameserver 10.116.19.188




修改DNS方法 CentOS6.5:




通过修改`/etc/resolv.conf`文件，往里边添加内容  

nameserver XXX  

nameserver XXX  

nameserver 8.8.8.8  

nameserver 8.8.4.4



