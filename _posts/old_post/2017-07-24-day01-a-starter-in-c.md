---
author: liqimore
comments: true
date: 2017-07-24 08:44:00+00:00
excerpt: 1. 把c语言的基本知识点和用法差不多都过了一遍,一年没用过的c语言算是重新捡了起来,c++毕竟才是这次的目的.
layout: post
link: http://blog.codefog.com/day01-a-starter-in-c.html
slug: day01-a-starter-in-c
title: day01- A starter in C++
wordpress_id: 591
categories:
- 编程
tags:
- c++基础
---



  1. 把c语言的基本知识点和用法差不多都过了一遍,一年没用过的c语言算是重新捡了起来,c++毕竟才是这次的目的.



2.C++类的简单例子介绍

![](https://static.codefog.com/qiniu/old/2017/07/5f1ccc571465dfcce8a68dba6bcb6ba2.png)





  1. 定义类的时候不会分配内存,当给c++的类实例化对象的时候,c++编译器才会给类分配内存



4.定义自己的命名空间,也可以嵌套命名空间

![](https://static.codefog.com/qiniu/old/2017/07/39164e96ddd5f41e11211de4a75b8a09.png)

5.c++可以取得register关键字变量的值

6.在c++中,结构体不需要typedef自行定义一个类型,直接可以当做一个已知类型进行操作,和class功能是一致的,

![](https://static.codefog.com/qiniu/old/2017/07/b525282aa459f5587fed18d0a0e42948.png)

但是也是有区别的

7.c++中的bool类型

![](https://static.codefog.com/qiniu/old/2017/07/4b186917e1316a761fa33ed5fedeb73e.png)

8.C++中也有三目运算符,

![](https://static.codefog.com/qiniu/old/2017/07/f2f1d480ae03c3e3ab8f0e98c86c84f9.png)

9.C++中的const变量的含义,

![](https://static.codefog.com/qiniu/old/2017/07/908fde87da4be0a05d07724c7a32f393.png)

C语言中const所修饰的变量可以被指针间接操作所修改,但是在C++中,const不可以被指针修改,是一个真正的常量.            

![](https://static.codefog.com/qiniu/old/2017/07/43b6cfeb6315fa25d6204016e9018a93.png)

10.const和#define的区别

![](https://static.codefog.com/qiniu/old/2017/07/318587f9051b6b53378e172d953e673b.png)

11.C++中的引用

用法和c中的指针的间接复制非常类似,如下图a的引用b

![](https://static.codefog.com/qiniu/old/2017/07/0c3a958f0cb22f7f76f6094fea5c06d6.png)

**类似**于,

![](https://static.codefog.com/qiniu/old/2017/07/1837e9da2be170ceea4cd5b666dfa632.png)

引用必须要初始化,否则编译不通过

12.引用的例子,引用当做形参

![](https://static.codefog.com/qiniu/old/2017/07/155def8d96852445895aed35b6e01aee.png)

![](https://static.codefog.com/qiniu/old/2017/07/6c4adb0d6e6718a0f40265f67b54db61.png)

这样正常调用函数,就可以实现全局区的变量值直接进行数据修改

13.

![](https://static.codefog.com/qiniu/old/2017/07/91971b237854f75d62631e0ce5f1fec1.png)

![](https://static.codefog.com/qiniu/old/2017/07/b4d252302cff5effca3839f650d15a43.png)

![](https://static.codefog.com/qiniu/old/2017/07/336fcf9dfd209e58e6b6caf3af8ef5e9.png)

引用相当于方便了指针操作,有一部分对指针和内存你的操作编译器代替程序员完成了,类似于JAVA的方式比C语言更加方便了

14.引用当做函数的返回值,返回的内容是所引用元素的地址,相当于指针作为函数的返回值,如果返回指针变量本身的值,那么返回的就是地址.

如上图所示(引用当做左值时)

15.**当返回值是静态变量或者全局变量时候引用的例子**

![](https://static.codefog.com/qiniu/old/2017/07/96ca3d31e41ee7cec6ea38390393fd9a.png)

![](https://static.codefog.com/qiniu/old/2017/07/800eeacadeb883d977131dc9e49627b8.png)

所有结果正常输出或者返回

16.函数返回值当做左值时,

![](https://static.codefog.com/qiniu/old/2017/07/75e5236a1307924ab05c6ecafd4ced1a.png)

![](https://static.codefog.com/qiniu/old/2017/07/ddd353257dfb9ee41c01fcdd691a2f1a.png)

但是通过引用返回了变量本身,相当于返回了"a"这个变量,g2() = 100,是把"a"这个变量修改为100
