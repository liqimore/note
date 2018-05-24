---
layout: post
title: "IBM的java系列教程笔记"
description: "在复习过程中,发现了IBM的免费教程,非常棒,比很多收费的教程好多了,在此把不熟悉的
知识记录一下."
date: 2018-05-17
tags: [java, 秋招准备]
comments: true
---

## 迭代泛型
泛型使用处理一些实体（比如 List）的特殊语法增强了 Java 语言，您通常可能希望逐个元素地处理这些实体。举例而言，如果想迭代 ArrayList，可以将 清单 3 中的代码重写为：  
```java
private void processArrayList(ArrayList<String> theList) {
  for (String s : theList) {
    String s = theList.get(aa);
  }
}
```
此语法<mark>适用于任何 Iterable（即实现了 Iterable 接口）的对象类型</mark>。   

## 一个参数化的 List
在泛型语法中，创建 List 的代码类似于：   

List<E> listReference = new concreteListClass<E>();   
E（表示元素）是我之前提到的 “东西”。concreteListClass 是 JDK 中您实例化的类。该 JDK 包含多个 List<E> 实现，但您使用了 ArrayList<E>。您可能看到的泛型类的另一种形式是 Class<T>，其中 T 表示类型。<mark>在 Java 代码中看到 E 时，它通常指的是某种类型的集合。当您看到 T 时，它表示一个参数化的类。</mark>     

所以，要创建一个由 java.lang.Integer 组成的 ArrayList，可以这样做：  
```java
List<Integer> listOfIntegers = new ArrayList<Integer>();
```

**原文地址**  
[第20单元:泛型](https://www.ibm.com/developerworks/cn/java/j-perry-generics/index.html)  
