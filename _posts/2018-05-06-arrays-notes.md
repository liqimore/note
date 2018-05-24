---
layout: post
title: "Arrays工具类知识点笔记"
description: "自己对Arrays类不熟悉的地方."
date: 2018-05-06
tags: [java, 秋招准备]
comments: true
---

## Arrays的构造函数
可以看到Arrays的构造函数被被设置为private的，表明这个类禁止使用默认构造函数并且不能被实例化，但是可以通过提供静态方法来使用这个类，这种模式就是单例模式   

## Arrays所有方法
```java
public static void sort(Object[] a)
public static void sort(Object[] a, int fromIndex, int toIndex)
public static <T> void sort(T[] a, Comparator<? super T> c)
public static <T> void sort(T[] a, int fromIndex, int toIndex, Comparator<? super T> c)

public static int binarySearch(Object[] a, Object key)
public static int binarySearch(Object[] a, int fromIndex, int toIndex, Object key)
public static <T> int binarySearch(T[] a, T key, Comparator<? super T> c)
public static <T> int binarySearch(T[] a, int fromIndex, int toIndex, T key, Comparator<? super T> c)

public static boolean equals(Object[] a, Object[] a2)

public static void fill(Object[] a, Object val)
public static void fill(Object[] a, int fromIndex, int toIndex, Object val)
public static <T> T[] copyOf(T[] original, int newLength)
public static <T,U> T[] copyOf(U[] original, int newLength, Class<? extends T[]> newType)

public static <T> T[] copyOfRange(T[] original, int from, int to)
public static <T,U> T[] copyOfRange(U[] original, int from, int to, Class<? extends T[]> newType)

public static <T> List<T> asList(T... a)

public static int hashCode(Object a[])

public static int deepHashCode(Object a[])

public static boolean deepEquals(Object[] a1, Object[] a2)

public static String toString(Object[] a)

public static String deepToString(Object[] a)
```



## 使用比较器为数组降序排序

```java
//在指定下标内，对数组进制默认升序排序，这将改变原数组，下标含头不含尾
Integer[] sortArray1 = Arrays.copyOf(arrayTest, arrayTest.length);
Arrays.sort(sortArray1,0,5);
arrayPrint(sortArray1);
//数组内全部排序
Arrays.sort(sortArray1);
arrayPrint(sortArray1);
Integer[] sortArray2 = Arrays.copyOf(arrayTest, arrayTest.length);
//使用比较器降序排序，在指定下标范围内
Arrays.sort(sortArray2,0,5,(x,y)->y.compareTo(x));
arrayPrint(sortArray2);
//使用比较器全部降序排序
//第二个参数为lambda表达式
Arrays.sort(sortArray2,(x,y)->y.compareTo(x));
arrayPrint(sortArray2);
```

## Lambda表达式相关
[Lambda 表达式有何用处？如何使用？](https://www.zhihu.com/question/20125256)   
[Java中Lambda表达式的使用](https://www.cnblogs.com/franson-2016/p/5593080.html)   
[Java8 lambda表达式10个示例](http://www.importnew.com/16436.html)   

## 多线程数组操作
```java
//以下是多线程算法，处理数组(大多以parallel做为开头的方法，可以充分利用现代CPU多核，处理大规模庞大的数组很有效)

　　　　　　
　　　　　//9.
        Integer[] arrayPP1 = Arrays.copyOf(arrayTest, arrayTest.length);
        arrayPrint(arrayPP1);
        //二元迭代，对原数组内容进行二元操作
        Arrays.parallelPrefix(arrayPP1,(x,y)->x*y);
        arrayPrint(arrayPP1);
        Integer[] arrayPP2 = Arrays.copyOf(arrayTest, arrayTest.length);
        //在指定下标范围内，对原数组内容进行二元操作，下标含头不含尾
        Arrays.parallelPrefix(arrayPP2,0,5,(x,y)->x*y);
        arrayPrint(arrayPP2);

　　　　 //10.
        Integer[] arrayPSA = Arrays.copyOf(arrayTest, arrayTest.length);
        //对原有数组对每个元素重新赋值，下面例子是 下标*5 然后赋到数组对应元素
        Arrays.parallelSetAll(arrayPSA,a->a*5);
        arrayPrint(arrayPSA);

　　　　 //11.
        Integer[] arrayPS1 = Arrays.copyOf(arrayTest, arrayTest.length);
        //对数组进行升序排序
        Arrays.parallelSort(arrayPS1);
        arrayPrint(arrayPS1);
        //对指定下标范围内的元素进行指定排序方法的排序，含头不含尾
        Arrays.parallelSort(arrayPS1,0,5,(x,y)->y.compareTo(x));
        arrayPrint(arrayPS1);

　　　　 //12.
        //返回一个Spliterator进行其它操作
        Spliterator<Integer> spliterator = Arrays.spliterator(arrayPS1);
        //将原有Spliterator切出一部分为新的Spliterator，不可切时返回null
        Spliterator<Integer> integerSpliterator = spliterator.trySplit();
        // estimateSize 还有几个元素要处理
        while(spliterator.estimateSize()>0){
            //对每个元素进行处理
            spliterator.tryAdvance(x-> System.out.print(x*2+" "));
        }

        System.out.println();

        //对Spliterator遍历操作
        integerSpliterator.forEachRemaining(a-> System.out.print(a+" "));
        System.out.println();

        //还有几个要遍历
        System.out.println(integerSpliterator.getExactSizeIfKnown());

        //表示该Spliterator有那些特性，用于优化
        System.out.println(spliterator.characteristics());


    }

    //懒人癌晚期....
    public static void arrayPrint(Object[] oArray){
        System.out.println(Arrays.toString(oArray));
    }
```

## 参考
[Java8 增强工具类 Arrays 笔记](https://www.cnblogs.com/HeDante/p/7464874.html#b5)
