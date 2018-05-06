---
layout: post
title: "枚举和JAVA的单例模式"
description: "枚举例子和对java单例模式的理解."
date: 2018-05-06
tags: java, 春招
comments: true
---

## 枚举
**定义枚举类**  
```java
package com;

public enum Color {

     RED, GREEN, BLANK, YELLOW

}
```

**简单使用**   
```java
package com;

public class B {

    public static void main(String[] args) {


        System.out.println( isRed( Color.BLANK ) ) ;  //结果： false
        System.out.println( isRed( Color.RED ) ) ;    //结果： true

    }


    static boolean isRed( Color color ){
        if ( Color.RED.equals( color )) {
            return true ;
        }
        return false ;
    }

}
```

**自定义函数**  
```java
package com;

public enum Color {

     RED("红色", 1), GREEN("绿色", 2), BLANK("白色", 3), YELLO("黄色", 4);


    private String name ;
    private int index ;

    private Color( String name , int index ){
        this.name = name ;
        this.index = index ;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public int getIndex() {
        return index;
    }
    public void setIndex(int index) {
        this.index = index;
    }


}
```
使用:  
```java
package com;

public class B {

    public static void main(String[] args) {

        //输出某一枚举的值
        System.out.println( Color.RED.getName() );
        System.out.println( Color.RED.getIndex() );

        //遍历所有的枚举
        for( Color color : Color.values()){
            System.out.println( color + "  name: " + color.getName() + "  index: " + color.getIndex() );
        }
    }

}
```

**输出结果:**   
```
红色  
1  
RED name: 红色 index: 1  
GREEN name: 绿色 index: 2  
BLANK name: 白色 index: 3  
YELLO name: 黄色 index: 4  
```
除了枚举,亦可以使用 **public static final** 来实现类似枚举的效果.  

<hr>
# 单例模式
单例模式（Singleton Pattern）是 Java 中最简单的设计模式之一。这种类型的设计模式属于创建型模式，它提供了一种创建对象的最佳方式。  

这种模式涉及到一个单一的类，该类负责创建自己的对象，同时确保只有单个对象被创建。这个类提供了一种访问其唯一的对象的方式，可以直接访问，不需要实例化该类的对象。  

**注意：**   

1、单例类只能有一个实例。  
2、单例类必须自己创建自己的唯一实例。  
3、单例类必须给所有其他对象提供这一实例。  

**实现方法:**  
通常情况下，我们写单例模式的时候无非就是三个步骤：构造器私有化，声明私有静态变量，提供静态获取实例的方法。简单说就是以下这种方式(饿汉)：  
```java
class SingletonA {
    //私有静态实例变量
    private static SingletonA instence = new SingletonA();
    //私有构造器
    private SingletonA() {
    }
    //公有获取静态实例的方法
    public static SingletonA getInstance() {
        return instence;
    }
}
```
这是最基本的单例模式的写法，考虑到线程安全的问题，会用synchronized 关键字修饰getInstance()方法，另外还有饿汉式、懒汉式、静态内部类、双重校验锁的写法。   
但是这种写法存在缺陷，可以利用反射的方式来实例化多个不同的实例.   
详细做法参考: [浅谈使用单元素的枚举类型实现单例模式](https://blog.csdn.net/huangyuan_xuan/article/details/52193006)   

**第一种（懒汉，线程不安全）:**   
```java
public class SingletonDemo1 {
    private static SingletonDemo1 instance;
    private SingletonDemo1(){}
    public static SingletonDemo1 getInstance(){
        if (instance == null) {
            instance = new SingletonDemo1();
        }
        return instance;
    }
}
```
这种写法lazy loading很明显，但是致命的是在多线程不能正常工作。　  

**第二种（懒汉，线程安全）：**   
```java
public class SingletonDemo2 {
    //不在这里实例化
    private static SingletonDemo2 instance;
    private SingletonDemo2(){}
    public static synchronized SingletonDemo2 getInstance(){
        if (instance == null) {
            instance = new SingletonDemo2();
        }
        return instance;
    }
}
```
使用synchronized修饰了getInstance方法.   
这种写法在getInstance()方法中加入了synchronized锁。能够在多线程中很好的工作，而且看起来它也具备很好的lazy loading，但是效率很低（因为锁），并且大多数情况下不需要同步。   

**第三种（饿汉）：**  
```java
public class SingletonDemo3 {
    private static SingletonDemo3 instance = new SingletonDemo3();
    private SingletonDemo3(){}
    public static SingletonDemo3 getInstance(){
        return instance;
    }
}
```
这种方式基于classloder机制避免了多线程的同步问题，不过，instance在类装载时就实例化，这时候初始化instance显然没有达到lazy loading的效果。   

**第四种（饿汉，变种）：**  
```java
public class SingletonDemo4 {
    private static SingletonDemo4 instance = null;
    static{
        instance = new SingletonDemo4();
    }
    private SingletonDemo4(){}
    public static SingletonDemo4 getInstance(){
        return instance;
    }
}
```
表面上看起来差别挺大，其实更第三种方式差不多，都是在类初始化即实例化instance   

**第五种（静态内部类）：**  
```java
public class SingletonDemo5 {
    private static class SingletonHolder{
        private static final SingletonDemo5 instance = new SingletonDemo5();
    }
    private SingletonDemo5(){}
    public static final SingletonDemo5 getInsatance(){
        return SingletonHolder.instance;
    }
}
```
这种方式同样利用了classloder的机制来保证初始化instance时只有一个线程，它跟第三种和第四种方式不同的是（很细微的差别）：第三种和第四种方式是只要Singleton类被装载了，那么instance就会被实例化（没有达到lazy loading效果），而这种方式是Singleton类被装载了，instance不一定被初始化。因为SingletonHolder类没有被主动使用，只有显示通过调用getInstance方法时，才会显示装载SingletonHolder类，从而实例化instance。想象一下，如果实例化instance很消耗资源，我想让他延迟加载，另外一方面，我不希望在Singleton类加载时就实例化，因为我不能确保Singleton类还可能在其他的地方被主动使用从而被加载，那么这个时候实例化instance显然是不合适的。这个时候，这种方式相比第三和第四种方法就 **显得更合理**。   

**第六种（枚举）：**   
```java
public enum SingletonDemo6 {
    instance;
    public void whateverMethod(){
    }
}
```
这种方式是Effective Java作者Josh Bloch 提倡的方式，它不仅能避免多线程同步问题，而且还能防止反序列化重新创建新的对象，可谓是很坚强的壁垒啊，不过，个人认为由于1.5中才加入enum特性，用这种方式写不免让人感觉生疏，在实际工作中，我也很少看见有人这么写过。    

**第七种（双重校验锁）：**   
```java
public class SingletonDemo7 {
    private volatile static SingletonDemo7 singletonDemo7;
    private SingletonDemo7(){}
    public static SingletonDemo7 getSingletonDemo7(){
        if (singletonDemo7 == null) {
            synchronized (SingletonDemo7.class) {
                if (singletonDemo7 == null) {
                    singletonDemo7 = new SingletonDemo7();
                }
            }
        }
        return singletonDemo7;
    }
}
```
这个是第二种方式的升级版，俗称双重检查锁定，详细介绍请查看：http://www.ibm.com/developerworks/cn/java/j-dcl.html
在JDK1.5之后，双重检查锁定才能够正常达到单例效果。   



## 参考
[浅谈使用单元素的枚举类型实现单例模式](https://blog.csdn.net/sup_heaven/article/details/35295851)   
[Java学习整理系列之Java枚举类型的使用](https://blog.csdn.net/sup_heaven/article/details/35295851)  
[Java 枚举(enum) 详解7种常见的用法](https://blog.csdn.net/qq_27093465/article/details/52180865)   
[常见的几种单例模式](https://www.cnblogs.com/Ycheng/p/7169381.html)  
[JAVA设计模式之单例模式](https://blog.csdn.net/jason0539/article/details/23297037/)   
