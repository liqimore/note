---
layout: post
title: "解决Linux关不了机开机,报错NMI watchdog: BUG: soft lockup - CPU#2 stuck for 22s的bug"
description: "solve linux 'MI watchdog: BUG: soft lockup - CPU#2 stuck for 22s' bug."
date: 2018-11-24
tags: [Linux, 环境准备]
categories: [毕业设计, Linux]
comments: true
---

## 问题描述
在安装完Ubuntu或者其他Linux, 关机时会卡死, 循环报错`NMI watchdog: BUG: soft lockup - CPU#2 stuck for 22s!`, 无法关机. 在本人的测试中, Centos18xx版本和Ubuntu16-18均出现了上述问题, 经过一些尝试后, 成功找到了解决方法.  

## 问题分析
初步排查, 定位在显卡驱动上. 我实在一个老MSI笔记本上安装的Linux, 它自带一个GTX960M的独立显卡, 然而, Linux对NVIDIA的显卡一向支持的很差, 会出现各种奇怪的问题. 这次的原因很可能就是它.   

## 解决方法
再开机显示`GRUB2`界面的时候, 选中你要进入的那个内核版本, 按`e`, 在Linux内核命令行(以Linux开头的那一行)末尾添加`nouveau.modeset=0`.这样可以正常进入系统, 直接修改你的`grub`文件, 把上述添加的命令写进去, 之后执行grub更新, 这样的问题就应该不会复现.  

## 建议
如果你的电脑/笔记本可以屏蔽独立显卡或者只是用CPU集成显卡, 请屏蔽掉独立显卡并且不要再开启了. 如果你需要Linux的图形界面,可以在开机进入系统后把显卡驱动换成`NVIDIA`自带的驱动,问题就会解决.台式机或者AMD平台暂未测试.  