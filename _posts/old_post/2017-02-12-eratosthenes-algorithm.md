---
author: liqimore
comments: true
date: 2017-02-12 18:32:37+00:00
excerpt: 埃拉托色尼筛选法(the Sieve of Eratosthenes)简称埃氏筛法，是古希腊数学家埃拉托色尼(Eratosthenes 274B.C.～194B.C.)提出的一种筛选法。
  是针对自然数列中的自然数而实施的，用于求一定范围内的质数，它的容斥原理之完备性条件是p=H~。
layout: post
link: http://blog.codefog.com/eratosthenes-algorithm.html
slug: eratosthenes-algorithm
title: 高效率素数生成 - 埃拉托色尼筛选法
wordpress_id: 350
categories:
- 算法
tags:
- 埃拉托色尼筛选法
---

计算素数的一个方法是埃氏筛法，它的算法理解起来非常简单：

(1).首先，列出从2开始的所有自然数，构造一个序列：

    
    2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, ...


(2).取序列的第一个数2，它一定是素数，然后用2把序列的2的倍数筛掉：

    
    3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, ...


(3).取新序列的第一个数3，它一定是素数，然后用3把序列的3的倍数筛掉：

    
    5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, ...


(4).取新序列的第一个数5，然后用5把序列的5的倍数筛掉：

    
    7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, ...


不断筛下去，就可以得到所有的素数。

用Python实现(迭代器):

    
    #!/usr/bin/env python3
    # -*- coding: utf-8 -*-
    
    def main():
        for n in primes():
            if n < 1000:
                print(n)
            else:
                break
    
    def _odd_iter():
        n = 1
        while True:
            n = n + 2
            yield n
    
    def _not_divisible(n):
        return lambda x: x % n > 0
    
    def primes():
        yield 2
        it = _odd_iter()
        while True:
            n = next(it)
            yield n
            it = filter(_not_divisible(n), it)
    
    if __name__ == '__main__':
        main()


类似的,可以使用C语言实现(百度):

    
    #include <stdio.h>
    #define TRUE 1
    #define FALSE 0
    #define SIZE 10000
    int main()
    {
    int i; /*i表示整数和对应的下标*/
    int j; /*j表示正要处理的质数j之前的已处理j之后的未处理*/
    int k; /*k表示正在处理的j的倍数从2开始到j*k<SIZE*/
    int a[SIZE]; /*下标表示整数内容判断是否为质数*/
    int *p; /*控制循环*/
    for(p = a; p < a+SIZE; ++p) { /*初始化数组全是TRUE*/
        *p = TRUE;
        }
    a[0] = a[1] = FALSE; /*设置前面两个不是质数的数的状态为FALSE*/
    i = 2;
    while(i < SIZE) { /*找到下一个质数*/
        while(a[i++] == TRUE) {
          j = i-1;
        break;
        }
    for(k = 2; j*k < SIZE && i < SIZE; ++k) { /*处理质数的倍数*/
    a[j*k] = FALSE;
    }
    }
    for(p = a; p < a+SIZE; ++p) { /*打印出质数*/
    if(*p == TRUE) {
    printf("%8d", p-a);
    }
    }
    printf("\n");
    return 0;
    }


其他语言亦可以轻松实现.
