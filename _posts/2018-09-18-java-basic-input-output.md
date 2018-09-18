---
layout: post
title: "算法 - java常见算法题输入输出"
description: "basic java i/o usage in OJ."
date: 2018-09-18
tags: [算法, 面试]
categories: [java, 算法]
comments: true
---

字符串和数字相同道理，本文都适用于字符串。    

## 输入一行数字
```java
		Scanner sc = new Scanner(System.in);

        System.out.println("读取一行数字：");
        String oneLine = sc.nextLine();
        String[] cs = oneLine.split(" ");
        for (String x : cs) {
        	int intValue = Integer.valueOf(x);
            System.out.print(intValue + " ");
        }
```

## 输入n行数字，行数确定
如果需要获得每行数字的值，用String的split方法分割为`char[]`后，再使用`Integer.valueOf()`转换成int即可，同上  
```java
		System.out.println("读取n行数字：");
        int lines = 3;
        String[] mutiLines = new String[3];
        int i = 0;
        while (i < lines) {
            mutiLines[i++] = sc.nextLine();
        }
        for (String s : mutiLines) {
            System.out.println(s);
        }
```

## 输入多行数字，未知行数
没有对一行多数字做处理，处理方法和上述但行输入相同。  
```java
		System.out.println("输入多行数字：");
        List<String> list = new ArrayList<>();

        String input = "";
        while (true) {
            input = sc.nextLine();
            if (!input.equals("q")) {
                list.add(input);
            }else {
                break;
            }
        }
        for (String s : list) {
            //只能转换一行一个数字，多个数字需要额外同上的操作
            //int intValue = Integer.valueOf(s);
            System.out.println(s);
        }
 ```

## 遇到其他情况再补充


