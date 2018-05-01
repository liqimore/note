---
author: liqimore
comments: true
date: 2016-08-19 10:04:00+00:00
layout: post
link: http://blog.codefog.com/how-what-raid-works-is-2.html
slug: how-what-raid-works-is-2
title: 什么是Raid技术以及其实现方法 - part 2
wordpress_id: 52
categories:
- 编程
---

## 一、磁盘阵列实现方式




磁盘阵列有两种方式可以实现，那就是“软件阵列”与“硬件阵列”。  

软件阵列是指通过网络操作系统自身提供的磁盘管理功能将连接的普通SCSI卡上的多块硬盘配置成逻辑盘，组成阵列。如微软的Windows NT/2000 Server/Server 2003和NetVoll的NetWare两种操作系统都可以提供软件阵列功能，其中Windows NT/2000 Server/Server 2003可以提供RAID 0、RAID 1、RAID 5；NetWare操作系统可以实现RAID 1功能。软件阵列可以提供数据冗余功能，但是磁盘子系统的性能会有所降低，有的降代还比较大，达30%左右。  

硬件阵列是使用专门的磁盘阵列卡来实现的，这就是本文要介绍的对象。现在的非入门级服务器几乎都提供磁盘阵列卡，不管是集成在主板上或非集成的都能轻松实现阵列功能。硬件阵列能够提供在线扩容、动态修改阵列级别、自动数据恢复、驱动器漫游、超高速缓冲等功能。它能提供性能、数据保护、可靠性、可用性和可管理性的解决方案。磁盘阵列卡拥有一个专门的处理器，如Intel的I960芯片，HPT370A/372 、Silicon Image SIL3112A等，还拥有专门的存贮器，用于高速缓冲数据。这样一来，服务器对磁盘的操作就直接通过磁盘阵列卡来进行处理，因此不需要大量的CPU及系统内存资源，不会降低磁盘子系统的性能。阵列卡专用的处理单元来进行操作，它的性能要远远高于常规非阵列硬盘，并且更安全更稳定。




## 二、磁盘阵列配置实例




磁阵有8个网口用来连接服务器，4个光纤模块口。这里我只用了2个网口，所以物理连接就是两台服务器centos分别通过两个网口连接磁阵。




1.设置磁阵的两个网口的ip， 分别为10.0.10.1、10.0.20.1  掩码：255.255.0.0




2.设置两台服务器与磁阵相连的网口的网卡ip分别为，10.0.10.3、10.0.20.4 掩码：255.255.0.0 （这样服务器就可以ping通磁阵了）




3.控制服务器登录磁阵，service iscsid start启动iscsid服务，然后这是开机启动chkconfig iscsid on，没有的话yum安装




4.以其中一台服务器为例，iscsiadm -m discovery -t st -p 10.0.10.1，然后运行iscsiadm -m discovery




[root@localhost ~]# iscsiadm -m discovery  

10.0.20.1:3260 via sendtargets  

10.0.10.1:3260 via sendtargets  

5.登录磁阵iscsiadm -m node -p 10.0.10.1:3260 -l，这样fdisk -l就可以发现3块磁盘组了，不过这三块磁盘组都超过了2T，需要用parted分区，然后格式化成xfs格式的文件系统。最后就可以mount上去了




/dev/sdd1              17T   33M   17T   1% /mount2  

/dev/sdc1             8.2T   33M  8.2T   1% /mount1  

6.建议将这个mount操作写在开机启动脚本中，因为写在/etc/fstab，如果配置开机挂载的话，如果因为服务器和磁阵网络问题中可能导致无法找到磁盘组，就无法开机了，需要到机房code了。




最后enjoy it




附录：




Linux下fdisk工具不支持GPT，得使用另一个GNU发布的强大分区工具parted




parted /dev/sdd  

mklabel gpt  

mkpart primary 0KB 17000GB  

quit




iScsi




一个供硬件设备使用的可以在IP协议的上层运行的SCSI指令集，这种指令集合可以实现在IP网络上运行SCSI协议。iSCSI技术是一种新储存技术，该技术是将现有SCSI接口与以太网络(Ethernet)技术结合，使服务器可与使用IP网络的储存装置互相交换资料。SCSI可以兼容SATA。




HBA卡




光纤存储卡，用于服务器与光纤阵列规的连接。买服务器的时候，如果有和磁阵相连的需求时，可以配上HBA卡，这样和磁阵就可以用光纤传输数据了。




reffer to :  

http://www.cnblogs.com/yanghuahui/p/3412077.html  

http://www.jb51.net/article/39265.htm



