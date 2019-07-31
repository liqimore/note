---
layout: post
title: "nginx反向代理https配置方法与实现请求的负载均衡详解"
description: "nginx reverse proxy and details on how to config nginx sla."
date: 2019-07-31
tags: [nginx, 负载均衡]
categories: [nginx, Linux]
comments: true
---

## Nginx反向代理的设置方法
nginx反向代理有很多的不同方面的用处, 这里主要讲如何设置docker的反向代理, 把本地的docker环境映射到域名上去.  
### 系统环境
docker + nginx + 公网IP + 域名  
### 操作方法
1. 首先在启动docker时, 把docker内部端口使用`-p 外部端口:内部端口`映射到服务器的网络环境中, 不用给当前的docker容器创建docker网络环境.  
2. 然后编写nginx配置文件, 我是用oneinstack可以直接创建nginx的conf配置并且自动生成免费的SSL证书, 操作简单.
3. 删掉oninstack在nginx配置文件中生成的对图片和其他资源文件处理的location配置, 加入如下的反向代理语句:   
```
location / {
        proxy_set_header  Host  $http_host;
        proxy_set_header  X-Real-IP  $remote_addr;
        proxy_set_header  X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_pass  http://127.0.0.1:6001; #自行修改为你需要的配置
    }
```
上面的配置可以把6001端口的服务代理到其他端口,我在使用过程中是代理到了80端口, 之后使用域名进行解析.  

## 负载均衡的配置方法
在nginx中负载均衡配置方式类似于反向代理, 但是负载均衡主要通过`upstream`模块来完成,简单配置方法如下,此时
采用的是轮询算法:
```
upstream test {
    server 192.168.0.1;
    server 192.168.0.2;
}
```
nginx可以配置不同的算法,比如[ip hash机制](https://blog.csdn.net/weixin_42075590/article/details/80631439),
也可以配置轮询的权重,如下:
```
upstream tomcat_pool 
    {
       #server tomcat地址:端口号 weight表示权值，权值越大，被分配的几率越大;
　　　　server 192.168.0.223:8080 weight=4 max_fails=2 fail_timeout=30s;
    　 server 192.168.0.224:8080 weight=4 max_fails=2 fail_timeout=30s;
    }
    #默认请求设置
    location / {
        proxy_pass http://tomcat_pool;    #转向tomcat处理
    }
```
上述例子是对TOMCAT做负载均衡,其他服务类似.对nginx负载均衡或者upstream模块更详细的讲解请参考[Nginx开发从入门到精通:upstream模块](http://tengine.taobao.org/book/chapter_05.html#upstream).  

## 参考
http://wiki.jikexueyuan.com/project/nginx/load-balancing-module.html  
http://tengine.taobao.org/book/chapter_05.html#upstream  
https://www.cnblogs.com/youzhibing/p/7327342.html  
