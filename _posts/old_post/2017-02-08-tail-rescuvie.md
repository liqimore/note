---
author: liqimore
comments: true
date: 2017-02-08 08:26:58+00:00
excerpt: '        我们知道, 在计算机中,函数是通过栈实现的, 每当进入一个函数调用，栈就会加一层栈帧，每当函数返回，栈就会减一层栈帧。由于栈的大小不是无限的，所以，递归调用的次数过多，会导致栈溢出。比如递归求阶乘的函数:'
layout: post
link: http://blog.codefog.com/tail-rescuvie.html
slug: tail-rescuvie
title: 尾递归--避免栈溢出
wordpress_id: 327
categories:
- 编程
tags:
- Python3
---

我们知道, 在计算机中,函数是通过栈实现的, 每当进入一个函数调用，栈就会加一层栈帧，每当函数返回，栈就会减一层栈帧。由于栈的大小不是无限的，所以，递归调用的次数过多，会导致栈溢出。比如递归求阶乘的函数:

    
    def fact(n):
        if n==1:
            return 1
        return n * fact(n - 1)


当计算数值小的阶乘时候没有问题,但是如果数值过大,就会出现栈溢出.比如`fact(2000)`,为了避免这种问题的出现,我们可以通过尾递归的方式来实现这个函数,如下:

    
    def fact(n):
        return fact_iter(n, 1)
    
    def fact_iter(num, product):
        if num == 1:
            return product
        return fact_iter(num - 1, num * product)




尾递归是指，在函数返回的时候，调用自身本身，并且，return语句不能包含表达式。这样，编译器或者解释器就可以把尾递归做优化，使递归本身无论调用多少次，都只占用一个栈帧，不会出现栈溢出的情况。

参考链接:[廖雪峰的Python3教程](http://www.liaoxuefeng.com/wiki/0014316089557264a6b348958f449949df42a6d3a2e542c000/001431756044276a15558a759ec43de8e30eb0ed169fb11000)
