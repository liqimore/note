---
layout: post
title: "解决Nginx反代80端口出现502错误"
description: "nginx reverse proxy occours 502."
date: 2018-08-28
tags: [jenkins, kele, 环境准备]
categories: [java, kale]
comments: true
---

## 问题描述
在上一篇博文中提到,我准备用`Nginx反代`来实现Jenkins的80端口访问,但是在我设置好反代后,访问80端口,却出现了502错误.`Nginx`安装方式使用`yum install nginx`的方式安装, 我的反代配置文件如下:  
```
server {

    listen       80;
    server_name  jenkins.local;
    #access_log /var/log/jenkins_access_log main;
    #error_log  /var/log/jenkins_error_log  debug_http;
    client_max_body_size 60M;
    client_body_buffer_size 512k;
    location / {
        proxy_pass      http://localhost:8080;
        proxy_redirect  off;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
```
可以看到应该是没有任何问题的,`reload`Nginx也没有报错,经过查看Nginx日志文件`/var/log/nginx/error.log`,发现Nginx爆出如下权限问题:  
```
2018/08/28 22:52:49 [error] 13213#0: *8 no live upstreams while connecting to upstream, client: 10.0.0.1, server: jenkins.local, request: "GET / HTTP/1.1", upstream: "http://localhost/", host: "jenkins.local"
```
经过搜索,发现有个博主给出了关闭`SELinux`的解决方案,尝试后问题成功解决.使用命令` getsebool -a |grep httpd_can_network_connect  `查看返回结果`httpd_can_network_connect --> off`发现httpd无网络权限,
`setsebool -P httpd_can_network_connect 1 `开启权限.  
有关`SELinux`请自行谷歌百度,它是个Linux的安全子系统.  

## 参考
http://blog.codingplayboy.com/2017/05/22/nginx-502-bad-gateway/