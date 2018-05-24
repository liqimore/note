---
layout: post
title: "java修饰符和this关键子解析"
description: "对四个修饰符还有this关键词做个总结."
date: 2018-05-06
tags: [java, 秋招准备]
comments: true
---

## 简单明了的的表格介绍
java的四个关键字：public、protected、default、private（他们决定了紧跟其后被定义的东西可以被谁使用）  

适用范围<访问权限范围越小，安全性越高>   

　　　　  访问权限   类   包  子类  其他包   

 　　　　  public     ∨   ∨    ∨     ∨          （对任何人都是可用的）   

  　　　　 protect    ∨   ∨   ∨     ×　　　 （继承的类可以访问以及和private一样的权限）  

  　　　　 default    ∨   ∨   ×     ×　　　 （包访问权限，即在整个包内均可被访问）  

  　　　　 private    ∨   ×   ×     ×　　　 （除类型创建者和类型的内部方法之外的任何人都不能访问的元素）  

## 访问控制
**private限制构造函数后，其他类中将不能够通过new的方式来获取这个类的对象，能够有效控制对象的创建行为，这在有些设计模式中是非常重要的。**   

## 类的修饰符
```java
// public，默认，abstract，final。
public class Test1 {}
class Test2{}
abstract class Test3{}
final class Test4{}
```
**abstract是表示该类为一个抽象类，不能实例化该类，即不能使用Test3 test3 = new Test3();的方式获取Test3的实例。final表示该类不能被子类继承，该类即为最终类，不可再被继承。**   


## 接口修饰符
**接口比较特殊，接口的修饰符只有public和默认（default），其控制权限和变量完全相同，不再赘述。**   
值得注意的是，接口中的变量只能为：public static final 变量名。当然了，你也可以不写这些修饰符，编译器会自动帮你加上的，因为编译器默认情况下就是这样修饰的。    
接口中的方法，只能用public和abstract修饰符，当然了，你也可以不写这些修饰符，同样，编译器会自动帮你加上的。  

## this关键字的三种用法
1. 引用成员变量   
```java
public class ThisDemo {
        public static void main(String[] args) {
            Student s=new Student("小明明",20);
            System.out.println(s);
        }
    }
    class Student{
        String name;
        int age;
        public Student(String name, int age) {
            //注:没有加this
            name = name;
            age = age;
        }
        @Override
        public String toString() {
            return "Student [ name=" + name + ", age=" + age +"]";
        }
    }
```
打印结果:`Student [ name=null, age=0]`   
赋值没有成功,说明:name(局部变量)=name(局部变量);  
而不是name(成员变量)=name(局部变量);  
```java
public Student(String name, int age) {
        //注:可以使用this进行区分成员变量和局部变量
        this.name = name;
        this.age = age;
}
```
打印结果:`Student [ name=小明明, age=20]`   
这样子就可以赋值成功啦   

2. 代表当前对象的引用
this关键字除了可以引用变量或者成员方法之外，还有一个重大的作用就是返回类的引用。如在代码中，可以使用return this，来返回某个类的引用。此时这个this关键字就代表类的名称。如代码在上面student类中，那么代码代表的含义就是return student。可见，这个this关键字除了可以引用变量或者成员方法之外，还可以作为类的返回值，这才是this关键字最引人注意的地方。  
例如:   
```java
public Student(String name, int age) {
        //注:可以使用this进行区分成员变量和局部变量
        this.name = name;
        this.age = age;
        //上述两行代码就相当于(假设当前实例对象为s)
        {
          s.name = name;
          s.age = age;
        }
}
```   

3. 代表构造器与构造器之间的调用
```java
class Student{
        String name;
        int age;
        int id;
        public Student(String name, int age, int id) {
            this.name = name;
            this.age = age;
            this.id = id;
            System.out.println("构造器3已调用");
        }
        public Student(String name, int age) {
            this(name,age,0);
            System.out.println("构造器2已调用");
        }

        public Student(String name) {
            this(name,0);//参数不足,就使用参数默认值补全
            System.out.println("构造器1已调用");
        }
        @Override
        public String toString() {
            return "Student [ id=" + id + ", name=" + name + ", age=" + age +"]";
        }
    }
```
//构造器用法-->this();跟函数一样()中可以写参数  
构造器调用一般是这样子用的.不同的构造器中存在相同代码.为了复用性。可以在参数少的构造器中调用参数多的构造器   




## 参考
[别说你懂修饰符——深入分析Java修饰符](https://blog.csdn.net/qiumengchen12/article/details/44939929)   
[java中四种访问修饰符区别及详解全过程](https://www.cnblogs.com/zdmylove/p/5958053.html)  
[java this 3种常见用法 详解](https://blog.csdn.net/u012176204/article/details/54580232)   
[Java中this关键字详解](https://blog.csdn.net/oleg_wu/article/details/53284067)   
