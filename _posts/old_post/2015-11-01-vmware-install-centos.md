---
author: liqimore
comments: true
date: 2015-11-01 22:50:43+00:00
layout: post
link: http://blog.codefog.com/vmware-install-centos.html
slug: vmware-install-centos
title: VMware虚拟机安装CentOS做本地测试的方法
wordpress_id: 14
categories:
- 编程
---

首先需要做的准备：

1.关闭WIN的防火墙。在控制面板中搜索防火墙，然后在左侧找到“打开或关闭Windows防火墙”，两个选项全部关闭。

2.安装VMware虚拟机，下载地址请自行百度。VM为收费软件，需要XX你懂的。

3.CentOS 6.5 请从官网的老版本下载页面下载DVD1就可以，DVD2.3暂且不需要。 不使用CentOS7的原因是更新太大，配置会有变化，没有亲自配置，有兴趣的朋友可以自己尝试。

[![1](http://blog.codefog.com/usr/uploads/2015/11/1.png)](http://blog.codefog.com/usr/uploads/2015/11/1.png)

配置步骤：

一到十五步请看韫瑜洞天（http://hanqilong2006.blog.163.com/）的文档，下载地址

<!-- more -->


<blockquote>http://wenku.baidu.com/link?url=KornMzLj-AiWFWz24dMDLFqalSW8raGiublJzHF05fEVbpdoWH0E53ReuQ5hQ4RuJsKTyTQ78BGFb4umUycNUqN_qf7Wqv6fIf_Rq5vGpn_</blockquote>


从第十期不开始请不要按他的操作。


<blockquote>4.在linux下输入ifconfig，此时查看不到IP。接下来执行vi /etc/sysconfig/network-scripts/ifcfg-eth0，打开文件后，发现文件是空的，这是因为前面的步骤把这个文件删除了。在这个文件中输入以下信息：

DEVICE=eth0
ONBOOT=yes
BOOTPROTO=static
IPADDR=192.168.1.8
NETMASK=255.255.255.0
GATEWAY=192.168.1.1

其中IPADDR是根据自己需要设置的。我在前面设置虚拟机专用网络的ip为54网段的，在这里，我的IPADDR设置的就是192.168.54.100,GATEWAY设置的就是192.168.54.1

设置完成后，保存退出。

此时再次输入ifconfig，就可以查看到IP地址了。输入setup，也可以在“EDIT  DEVICES”中看到刚才设置的信息。本机IP设置成功

5.关闭linux防火墙

service iptables stop

chkconfig iptables off

6.启动ssh服务

service sshd start

7.在windows，打开命令行，出现如下信息

C:\Users\Administrator>ping 192.168.54.100
正在 Ping 192.168.54.100 具有 32 字节的数据:
来自 192.168.54.100 的回复: 字节=32 时间<1ms TTL=64
来自 192.168.54.100 的回复: 字节=32 时间<1ms TTL=64
来自 192.168.54.100 的回复: 字节=32 时间=1ms TTL=64
来自 192.168.54.100 的回复: 字节=32 时间<1ms TTL=64

192.168.54.100 的 Ping 统计信息:
数据包: 已发送 = 4，已接收 = 4，丢失 = 0 (0% 丢失)，
往返行程的估计时间(以毫秒为单位):
最短 = 0ms，最长 = 1ms，平均 = 0ms

说明连接成功

8.此时通过xshell再次连接本地linux，就可以成功。</blockquote>




引用的文字摘自Leo_wlCnBlogs（http://www.cnblogs.com/Leo_wl/p/4385381.html）。

之后在LINUX中PING WIN7系统的IP看是否能ping通，同时在WIN下PING Linux 看是否能ping通。都成功，恭喜你，你可以通过Xshell连接了。

[![QQ截图20151101224449](http://blog.codefog.com/usr/uploads/2015/11/QQ截图20151101224449-1024x491.png)](http://blog.codefog.com/usr/uploads/2015/11/QQ截图20151101224449.png)

写本文的原因是网上的文章大多有些小问题，没有很详细的高速新手具体怎么操作，我研究了2天才明白怎么回事，期间看了好多教程，都无法实现登录。

总结：

1.注意关闭WIN和LINUX各自的防火墙

2.需要自行修改LINUX下网络的配置文件

3.CentOS不知道7之后的版本操作是否相同




