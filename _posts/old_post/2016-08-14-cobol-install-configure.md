---
author: liqimore
comments: true
date: 2016-08-14 06:47:00+00:00
layout: post
link: http://blog.codefog.com/cobol-install-configure.html
slug: cobol-install-configure
title: OpenCobol IDE的安装下载与配置教程 - MacOS + WIN10
wordpress_id: 51
categories:
- 编程
---

## What is COBOL?




<blockquote>

> 
> COBOL（CommonBusinessOrientedLanguage）是数据处理领域最为广泛的程序设计语言，是第一个广泛使用的高级编程语言。在企业管理中，数值计算并不复杂，但数据处理信息量却很大。为专门解决经企管理问题，美国的一些计算机用户于1959年组织设计了专用于商务处理的计算机语言COBOL,并于1961年美国数据系统语言协会公布。经不断修改、丰富完善和标准化，目前COBOL已发展为多种版本。
> 
> 
</blockquote>




## 使用OpenCobol IDE的好处






  * COBOL 语法高亮


  * COBOL 代码自动完成


  * COBOL 代码分类


  * 导航树形视图


  * 智能自动缩进


  * 计算 PIC 字段偏移量工具


  * 编译为程序 (.exe) 或者子程序 (.so/.dll)


  * 从编辑器或者配置的外部终端运行程序


  * 黑颜色模式和主题


  * 跨平台：GNU/Linux, Windows 和 Mac OSX


  * Linux 上集成 dbpre




<blockquote>

> 
> OpenCobolIDE 是简单轻量级的 COBOL IDE，基于 GnuCOBOL 编译器。OpenCobolIDE 使用 Python 编写，基于  PyQt5 (or PyQt4) 和 pyQode. 均为开源软件.
> 
> 
</blockquote>




## OpenCobol IDE的下载




### 1.Windows平台




Windows下安装OpenCobol IDE简单方便,操作基本上就是下一步下一步,不需要配置编译器,IDE中自带了编译器,安装完成即可使用.




#### 0x01.下载




请自行使用下载工具下载  

官方链接:  

**https://launchpad.net/cobcide/4.0/4.7.4/+download/OpenCobolIDE-4.7.4_Setup.exe**  

我给大家提供的镜像链接:  

**http://file.jrlab.win/cobol/OpenCobolIDE-4.7.4_Setup.exe**  

注意:官方链接速度稍慢,请耐心等待.镜像链接速度快,但是我的流量是有限制的,如果大家官方连接的下载速度可以接受的话请尽量使用官方链接.




#### 0x02.安装




双击运行下载好的EXE安装包.




![QQ截图20160814070417.jpg](http://old.timelovelife.com/usr/uploads/2016/08/2501080527.jpg)




![2.jpg](http://old.timelovelife.com/usr/uploads/2016/08/1365182242.jpg)




同意协议.




![3.jpg](http://old.timelovelife.com/usr/uploads/2016/08/1739003733.jpg)




选择安装位置.




![4.jpg](http://old.timelovelife.com/usr/uploads/2016/08/3204876106.jpg)




剩下的操作下一步即可.安装完成后点击运行IDE,并创建新文件  

![5.jpg](http://old.timelovelife.com/usr/uploads/2016/08/3627624376.jpg)




选择目录




![6.jpg](http://old.timelovelife.com/usr/uploads/2016/08/2124897636.jpg)




IDE会自动为用户创建一个HelloWorld程序,点击左上方工具栏中的绿色运行按钮,即可成功运行实例程序.




![7.jpg](http://old.timelovelife.com/usr/uploads/2016/08/1170820508.jpg)




到此Windows的安装教程就结束了.




### 2.MacOS平台




#### 0x01.下载




请自行使用下载工具下载  

官方链接:  

**https://launchpad.net/cobcide/4.0/4.7.4/+download/OpenCobolIDE-4.7.4.dmg**  

我给大家提供的镜像链接:  

**http://file.jrlab.win/cobol/OpenCobolIDE-4.7.4.dmg**  

注意:官方链接速度稍慢,请耐心等待.镜像链接速度快,但是我的流量是有限制的,如果大家官方连接的下载速度可以接受的话请尽量使用官方链接.




#### 0x02.安装前的准备工作




##### 1.安装Command Line Tool




首先在Appstore中下载并且安装xcode，大约需要4gb的空间。  

然后打开终端，输入命令`xcode-select --install`然后按下回车键




![1.png](http://old.timelovelife.com/usr/uploads/2016/08/1545078787.png)




之后在插入电源的前提下同意所有协议即可以安装成功。之后在终端中输入`xcode-select --install`，如果出现一下情况，则代表安装成功。




![2.png](http://old.timelovelife.com/usr/uploads/2016/08/555070068.png)




#### 2.安装Homebrew包管理器




在终端中执行命令：  

`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`  

安装完成后执行命令`brew -v`，如果提示如下，则代表安装成功，否则请自行安装git或其他包。




![3.png](http://old.timelovelife.com/usr/uploads/2016/08/3979870119.png)




#### 3.安装gnu-cobol编译器




在终端内执行命令`brew install gnu-cobol`.等待完成后再次执行该命令，当看到如何提示时，则代表安装成功。  

注意:安装完成后需要执行`homebrew link gun-cobol`才可以成功链接,切记,第一次写的时候忘记写这个了.




![4.png](http://old.timelovelife.com/usr/uploads/2016/08/2815963566.png)




#### 4.安装OpenCobol IDE




1.双击打开下载好的dmg文件，讲里面的IDE文件拖动到桌面上，之后打开Mac的finder，之后把它拖动带应用程序上面，如图：




![5.png](http://old.timelovelife.com/usr/uploads/2016/08/3108617362.png)




之后，就可以在launchpad中找到它了。




![6.png](http://old.timelovelife.com/usr/uploads/2016/08/3596599895.png)




如果有如下提示，可以在`系统偏好设置`中的`安全性与隐私`处点设置`任何来源`来允许程序运行.但是你首先要点击左下方的小锁解锁设置选项。




![7.png](http://old.timelovelife.com/usr/uploads/2016/08/2425531772.png)




![8.png](http://old.timelovelife.com/usr/uploads/2016/08/2489474309.png)




之后点击允许，运行IDE。




![9.png](http://old.timelovelife.com/usr/uploads/2016/08/2022535356.png)




剩下的操作和windows的一样，就不重复了。




## 结束




到这里所有教程就结束了，有什么问题可以在本文后面留言，在我的能力范围内我会尽量帮助大家的。




2016.9.6更新:  

注意:Mac版的安装完成后如果无法编译,但是编译器设置是正确的,请在preference中设置在新终端窗口中显示结果,这个就解决了定义域的那些报错.



