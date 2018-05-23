---
author: liqimore
comments: true
date: 2016-08-04 00:34:00+00:00
layout: post
link: http://blog.codefog.com/linux-swap.html
slug: linux-swap
title: linux下添加SWAP交换空间
wordpress_id: 45
categories:
- 编程
---

## 操作步骤




1，创建一个需要的swap大小文件（创建了一个swap文件在/mnt目录下）：



    
    <code>sudo dd if=/dev/zero of=/mnt/1024Mb.swap bs=1M count=1024
    </code>




其中：“count=1024”指要创建的文件大小，bs = block size 区块大小;




2，格式化该文件，将其转换为swap：



    
    <code>sudo mkswap /mnt/1024Mb.swap
    </code>




3，将该swap添加到系统中：



    
    <code>sudo swapon /mnt/1024Mb.swap
    </code>




4，添加完后，可以查看：



    
    <code>cat /proc/meminfo 
    </code>




5，刚刚的操作做完后需要为其做永久性的变更，步骤如下：



    
    <code>（sudo）vi /etc/fstab//在文件末尾加上如下一行:/mnt/1024Mb.swap  none  swap  sw  0 0
    </code>




6，保存修改，并重启。



    
    <code>shutdown -r now
    </code>



