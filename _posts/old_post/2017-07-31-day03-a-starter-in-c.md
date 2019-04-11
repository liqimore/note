---
author: liqimore
comments: true
date: 2017-07-31 07:48:54+00:00
excerpt: 1.构造函数和析构函数(和类名相同的成员函数)
layout: post
link: http://blog.codefog.com/day03-a-starter-in-c.html
slug: day03-a-starter-in-c
title: day03- A starter in C++
wordpress_id: 637
categories:
- 编程
tags:
- c++基础
---

1.构造函数和析构函数(和类名相同的成员函数)

![](https://static.timelovelife.com/qiniu/old/2017/07/b1654ee1e25a643f95190eb2a2e43e38.png)

![](https://static.timelovelife.com/qiniu/old/2017/07/e1320f48fdb51e399ba316f23ec14640.png)

2.执行某个对象的时候,先自动执行构造函数,当对象运行结束后,运行析构函数

![](https://static.timelovelife.com/qiniu/old/2017/07/1df3bc90986176eb4ef33662b6020a3f.png)

3.调用有参构造函数的方法

![](https://static.timelovelife.com/qiniu/old/2017/07/a0c46dcf1f13f596f60cec73e21dba88.png)

逗号表达式的值是最后一个的数的值,上是等号右边的值为7

![](https://static.timelovelife.com/qiniu/old/2017/07/f49187fb5ab098defd7047ffc59128da.png)

4. 

![](https://static.timelovelife.com/qiniu/old/2017/07/128ad3486aa3b438f29795614a1e5476.png)

5.赋值构造函数用来使用另一个对象初始化一个新的对象

![](https://static.timelovelife.com/qiniu/old/2017/07/530b6c6b062bf4c739f7debe9abeea07.png)

![](https://static.timelovelife.com/qiniu/old/2017/07/574f2ee0d82cf4f456b132d9c1474ee7.png)

5.构造函数的调用规则

![](https://static.timelovelife.com/qiniu/old/2017/07/756e59cdaa0273bfc358dda0c76933bc.png)

6.浅拷贝解决方案,手动编写构造函数

![](https://static.timelovelife.com/qiniu/old/2017/07/2f2aacd8046d53c826cbd6af6d6b678c.png)

7.当一个类中的成员包含另一个类时,无法为其进行初始化,所以要用对象初始化列表

![](https://static.timelovelife.com/qiniu/old/2017/07/84495d27edeb5b665ffadebf7f630db4.png)

![](https://static.timelovelife.com/qiniu/old/2017/07/35ddccad698eac87f773244386acf3dc.png)

8.对象的动态建立和释放

![](https://static.timelovelife.com/qiniu/old/2017/07/7ab2284a83161a7e0cbd941f3d0f25e5.png)

![](https://static.timelovelife.com/qiniu/old/2017/07/2a58bd87a720a950ab5656598cee3d81.png)

![](https://static.timelovelife.com/qiniu/old/2017/07/d40579549da5e838f937f2324d8b7f7a.png)





  1.  new分配基础类型



![](https://static.timelovelife.com/qiniu/old/2017/07/7017fa9d1961de32ce8d3fe3165d52a1.png)

创建数组空间,

![](https://static.timelovelife.com/qiniu/old/2017/07/2d821701d02011d9d7bb018bb333c494.png)

10.动态分配对象

![](https://static.timelovelife.com/qiniu/old/2017/07/f0ea0506122ab8f7dcf710afacd8e873.png)

用new和delete来创建和删除动态对象

11.区别

![](https://static.timelovelife.com/qiniu/old/2017/07/38a99facb81e10998d70005cbcb35f6c.png)

12.static修饰的变量(静态变量和静态成员函数)

![](https://static.timelovelife.com/qiniu/old/2017/07/64ada312fc0cab84d916412d559064f7.png)

经过static修饰的变量或成员函数,则这个函数或者变量可以在这个类的所有实例化对象中使用,**但是需要在全局区中声明这个静态数据成员**

![](https://static.timelovelife.com/qiniu/old/2017/07/04f4632e4ad71673d54b94ea126c513c.png)

使用方法,

![](https://static.timelovelife.com/qiniu/old/2017/07/92262a41ebbbcbf463f0d056e04e20e2.png)
