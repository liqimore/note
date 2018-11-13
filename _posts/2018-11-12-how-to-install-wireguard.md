---
layout: post
title: "如何在Ubuntu/Centos上安装Wireguard工具 | how to install Wireguard on Ubuntu/CentOS"
description: "how to install Wireguard on Ubuntu/CentOS ?"
date: 2018-11-12
tags: [VPN, wireguard]
categories: [毕业设计, 科学上网教程]
comments: true
---

## 需求介绍
在做毕业设计的过程中,需要一台高性能的服务器,如果在阿里云等云服务购买的话成本太高,于是把一台老的MSI笔记本安装了`Ubuntu Server 16.04.5`. 在开发的过程中,我`可能不会和上述服务器在同一个局域网内`,所以就需要组建一个VPN网络.  
经过查找,现成的符合要求的只有如下选择:  
1. 花生壳以及他们公司的一套产品(收费,不推荐)
2. FRP
3. OpenVPN%Softether
4. Wireguard

## Wireguard的优势
1. 配置简单,仅需要公钥秘钥加密解密即可
2. 速度性能好,在最新的Linux内核上,可以跑满宽带(100M+CN2双向线路)
3. 服务器资源占用少(内存少,在跑满100M之后,占用CPU30% E5-26XX, 单核心)

## 安装,配置方法
Ubuntu
```shell
$ sudo add-apt-repository ppa:wireguard/wireguard
$ sudo apt-get update
$ sudo apt-get install wireguard
```
Centos
```shell
$ sudo curl -Lo /etc/yum.repos.d/wireguard.repo https://copr.fedorainfracloud.org/coprs/jdoss/wireguard/repo/epel-7/jdoss-wireguard-epel-7.repo
$ sudo yum install epel-release
$ sudo yum install wireguard-dkms wireguard-tools
```

直接执行上述命令,即可成功安装,无需其他操作.wireguard不区分服务器和客户机,只需要开启一个虚拟网卡,就实现了互通.  
```
# ip link add dev wg0 type wireguard
# ip address add dev wg0 192.168.2.1/24
# wg setconf wg0 myconfig.conf
```
如上为核心命令,公钥和私钥可以通过`wg genkey`来产生私钥,`wg pubkey < privateKey`产生公钥.  
配置文件如下:  
```shell
[Interface]
PrivateKey = XXXXX
Address = 10.0.0.1/24 
PostUp   = iptables -A FORWARD -i wg0 -j ACCEPT; iptables -A FORWARD -o wg0 -j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
PostDown = iptables -D FORWARD -i wg0 -j ACCEPT; iptables -D FORWARD -o wg0 -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE
ListenPort = xxx
DNS = 8.8.8.8
MTU = 1420

[Peer]
PublicKey = XXXXX
AllowedIPs = 10.0.0.2/32 
```
之后使用`wg-quick up/down XXX`启动服务,服务器客户端一样.XXX为XXX.conf的前缀.具体文档请看官网https://www.wireguard.com/quickstart/.  

## 存在问题
暂时没有简单易用的GUI客户端.  