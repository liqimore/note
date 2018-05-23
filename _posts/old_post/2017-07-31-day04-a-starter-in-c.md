---
author: liqimore
comments: true
date: 2017-07-31 10:25:49+00:00
excerpt: 1.c++的类中隐含了this指针
layout: post
link: http://blog.codefog.com/day04-a-starter-in-c.html
slug: day04-a-starter-in-c
title: day04- A starter in C++
wordpress_id: 655
categories:
- 编程
tags:
- c++基础
---

1.c++的类中隐含了this指针

![](https://static.timelovelife.com/old/2017/07/30a8bb909ef8900bcd2a60c875fa2290.png)

2.用const修饰成员函数,和位置没有关系

![](https://static.timelovelife.com/old/2017/07/870f9510e407ce3f515c893f883eaa71.png)

而且const修饰的是this指针所指向的内存空间(其中,this指针默认就是带有const的,只读),相当于

![](https://static.timelovelife.com/old/2017/07/0624add1aed64cd12d0ed2496321d32e.png)

3.类的封装

**.h文件用来声明类中的成员**

**和类同名的.cpp用来实现类中的函数**

**在调用的时候,只要把.h包含到需要用的地方就可以了**

4.友元函数

![](https://static.timelovelife.com/old/2017/07/a193f1c3ac371f93fa3c4d20ef6b4c79.png)

友元函数可以修改类的私有属性,而且定义友元函数的位置与是否是private或者public无关

例如,

![](https://static.timelovelife.com/old/2017/07/66b0b1a19d17f016f3b91d16913b38b8.png)

5.友元类

![](https://static.timelovelife.com/old/2017/07/c9c4e8724d70dd2364912658e374d3e5.png)

![](https://static.timelovelife.com/old/2017/07/9db9f74747b64875cf0b9c949eb07786.png)

则可以通过B类中的友元函数修改A类中的成员,整个B类中的成员全部是A的友元

_**友元函数和友元类破坏了类的私有性(封装性)**_

6.运算符重载(运算符定义)

![](https://static.timelovelife.com/old/2017/07/342c4695e340b8b1dbc7a10220a68ed3.png)

当自定义数据类型进行运算的时候,就需要运算符重载

![](https://static.timelovelife.com/old/2017/07/ab1dc31d3ad21f9c10f8a3db0c0c4268.png)

7.运算符重载的语法

![](https://static.timelovelife.com/old/2017/07/0bc269d68e9141d7750976763bd29110.png)

![](https://static.timelovelife.com/old/2017/07/f35f6f693a5c9d0476e5b9981bb0f9fd.png)

8.运算符重载的步骤

![](https://static.timelovelife.com/old/2017/07/2f4137726ae7faf03a2f8cbaf8914a90.png)

![](https://static.timelovelife.com/old/2017/07/923447f39d872b37bf69fdb23e953f27.png)

等效于,

![](https://static.timelovelife.com/old/2017/07/51dbfd2e103795d3951320ce6179c9ea.png)

9.相关知识点

![](https://static.timelovelife.com/old/2017/07/e245bd9a6308846b35e59e8a6575e065.png)

![](https://static.timelovelife.com/old/2017/07/dfe5cb43830da1c284f44960ea77ec29.png)

![](https://static.timelovelife.com/old/2017/07/380d2ce79b73aae81a8fa5777d416892.png)

10.以上是基本运算符重载的概念,还有二元运算符重载,等号重载等等.之后做练习题的时候再进行详细的学习,本次只了解一下运算符重载的概念和简单的运算符重载
