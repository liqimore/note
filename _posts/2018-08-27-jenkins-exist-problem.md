---
layout: post
title: "Centos7启动Jenkins服务状态Active: active (exited)的问题解决"
description: "Jenkins服务Active: active (exited)"
date: 2018-08-27
tags: [jenkins, kele, 环境准备]
categories: [java, kale]
comments: true
---

## 问题描述
因为需要准备Kale项目, 所以在本地的VMware中部署了一套测试环境和持续构建. 其中CI选定的是Jenkins. 我使用的是`Centos1804`版本,是博文发表时候的最新版本,安装Jenkins直接使用`yum`来安装,JDK版本为`OpenJDK1.8`.  
安装完成后,添加到服务并且设置开机启动,我在本地设置了host,所以不需要使用`8080`端口访问Jenkins,所以我在`/etc/sysconfig/jenkins`中修改端口号为`80`, 之后使用`systemctl restart jenkins`重启Jenkins,发现重启命令不报错,但是服务运行状态为`Active: active (exited)`.  
```
[root@jenkins ~]# systemctl status jenkins
● jenkins.service - LSB: Jenkins Automation Server
   Loaded: loaded (/etc/rc.d/init.d/jenkins; bad; vendor preset: disabled)
   Active: active (exited) since Sun 2018-08-26 23:03:42 CST; 2h 14min ago
     Docs: man:systemd-sysv-generator(8)
  Process: 986 ExecStart=/etc/rc.d/init.d/jenkins start (code=exited, status=0/SUCCESS)
   CGroup: /system.slice/jenkins.service
           └─1387 /etc/alternatives/java -Dcom.sun.akuma.Daemon=daemonized -Djava.awt.headless=true ...

Aug 26 23:03:41 jenkins.local systemd[1]: Starting LSB: Jenkins Automation Server...
Aug 26 23:03:41 jenkins.local runuser[1007]: pam_unix(runuser:session): session opened for user r...=0)
Aug 26 23:03:42 jenkins.local jenkins[986]: Starting Jenkins [  OK  ]
Aug 26 23:03:42 jenkins.local systemd[1]: Started LSB: Jenkins Automation Server.
Hint: Some lines were ellipsized, use -l to show in full.

```

## 问题解决
随后在google上寻找一番无果,终于在配置文件中看到如下:  
```
# Unix user account that runs the Jenkins daemon
# Be careful <mark>when you change this, as you need to update
# permissions of $JENKINS_HOME and /var/log/jenkins.</mark>
#
JENKINS_USER="jenkins"
```
**在修改过配置文件后,需要重新设定相应的权限Jenkins才可以正常运行**,于是修改`JENKINS_USER="jenkins"`为`root`后,问题得到解决.  