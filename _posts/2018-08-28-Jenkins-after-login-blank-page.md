---
layout: post
title: "解决Jenkins安装完成登陆后显示空白页面"
description: "Jenkins after login show blank page."
date: 2018-08-28
tags: [jenkins, kale, 环境准备]
categories: [java, kale]
comments: true
---

## 问题描述
随着上次解决Jenkins服务状态为`Active: active (exited)`的问题后,又遇到新的问题.  
再把Jenkins端口修改到80后,Jenkins的登录页面可以正常打开,但是一旦登录你的账号,就会显示空白页面,页面标题是`Jenkins wizard`,除非访问`http://jenkins.local/restart`或者其他URL带有后缀的页面才能显示东西,且功能正常.  

## 问题解决
在网上寻找一番后,有人说是权限问题,但是我在Jenkins的`config.xml`中把权限禁用掉也无用,也有人说是插件冲突,同样,我直接禁用所有插件,一样没有效果. 最后有人提到是因为端口如果低于1000的话是会出现问题的,因为1000以内是系统服务或者其他软件的保留端口. 这一点我明白,可是我使用的就是web服务,80端口,道理上讲应该没问题. 最后我尝试把端口修改回`8080`后,Jenkins恢复正常,随即解决了问题,如果想使用80端口,可以用`Nginx反代`.  

## 参考
https://www.youtube.com/watch?v=7DE_f3zX1RM