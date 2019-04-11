---
layout: post
title: "java异常研究,详解"
description: "深入了解java的异常机制."
date: 2018-05-07
tags: [java, 秋招准备]
comments: true
---

## 概述
在Java中，所有的事件都能由类描述，Java中的异常就是由java.lang包下的异常类描述的。  
![20180507152570136268599.png](https://static.timelovelife.com/qiniu/20180507152570136268599.png)  

**1、Throwable（可抛出）：** 异常类的最终父类，它有两个子类，Error与Exception。   
Throwable中常用方法有：   
getCause()：返回抛出异常的原因。如果 cause 不存在或未知，则返回 null。   
getMeage()：返回异常的消息信息。    
printStackTrace()：对象的堆栈跟踪输出至错误输出流，作为字段 System.err 的值。   

**2、Error（错误）：** 表示程序无法处理的错误，一般与程序员的执行操作无关。理论上这些错误是不允许发生的，如果发生，也不应该试图通过程序去处理，所以Error不是try-catch的处理对象，而JVM一般的处理方式是终止发生错误的线程。Error类常见子类有VirtualMachineError与AWTError。   

**3、VirtualMachineError（虚拟机错误）：** 表示虚拟机出现错误。   
在Java运行时内存中，除程序计数器外的虚拟机栈、堆、方法区在请求的内存无法被满足时都会抛出OutOfMemoryError；   
而如果线程请求的栈深度超出虚拟机允许的深度时，就会抛出StackOverFlowError。  

**4、AWTError（AWT组件出错）：** 这个错误并不是很常用。但是提一下AWT与Swing的区别，AWT是使用操作系统中的图形函数的抽象窗口工具，用C\C++编写，为了实现Java“一次编译，处处运行”的理念，AWT使用各个操作系统图形函数的交集，所以功能较差，但运行速度较快，适合嵌入式Java；   
而Swing组件是基于AWT编写的图形界面系统，它用纯Java编写，所以必然实现了“一次编译，处处运行”，但相较于AWT运行速度较慢，适合PC使用。  

**5、Exception（异常）：** 出现原因取决于程序，所以程序也理应通过try-catch处理。    
异常分为两类：可查异常与不可查异常。    

可查异常：编译器要求必须处理，否则不能通过编译，使用try-catch捕获或者throws抛出。常见的可查异常有IOException（IO错误）及其子类EOFExcption(文件已结束异常)、FileNotFound（文件未找到异常）。    

不可查异常（也叫运行时异常）：编译期不会检查，所以在程序中可不处理，但如果发生，会在运行时抛出。所以这类异常要尽量避免！常见的不可查异常都是RuntimeException类及其子类。  

**1’ NullPointerException：空指针异常。** 调用了不存在的对象或未经实例化或初始化的对象时会抛出，如当试图操作一个空对象（赋值为null）的属性、方法时就会抛出。  

（实例化：通俗的理解就是为对象开辟空间，使其可在规定范围内被调用。注意：User u;这只是一个对象声明，并没有进行实例化或初始化。   
初始化：就是把实例化后的对象中的基本数据类型字段赋默认值或设定值，为非基本类型赋值null，对于static字段只会初始化一次。）    

**2’ ArithmeticException：算术条件异常。** 最常见的就是0作除数时会抛出。  

**3’ ClassNotFoundException：类未找到异常。** 在通过反射Class.forName(“类名”)来获取类时，如果未找到则会抛出异常。  

**4’ ArrayIndexOutOfBoundsException：数组索引越界异常。** 当试图操作数组的索引值为负数或大于等于数组大小时会抛出。  

**5’ NegativeArraySizeException：数组长度为负值异常。** 一般在初始化数组大小为负值时抛出。  

**6’ ArrayStoreException：数组类型不匹配值异常。** 例如将一个Object数组中加入一个Integer对象与一个String对象时，类型不匹配就会抛出。  

**7’ IllegalArgumentException：非法参数异常。** 会在使用Java类库方法时传入参数值越界时抛出。  

## 处理异常
Java中的异常处理原则：必须声明抛出异常或捕获可查异常，允许忽略Error与不可查异常。  
```java
public class TestException {
    public static void main(String[] args)
            throws IOException{     //抛出可查IO异常
        //throw是针对对象抛出的异常，throws是针对方法抛出的异常
        FileWriter fileWriter = new FileWriter("output.txt");
        String str = null;          //str对象未经初始化
        try {
            fileWriter.write(str);  //尝试调用未经初始化的str对象，会抛出空指针异常
        } catch (NullPointerException e) {
            System.out.println("Catch NullPointerException!");
        }finally{
            str = "finally!";
            fileWriter.write(str);
            fileWriter.close();
        }   
    }
}
```
执行结果：   
控制台：  
***Catch NullPointerException!***    
output.txt:  
***finally!***     

1、throws意为抛出，只要出现异常，就会创建对应异常对象，然后记录异常时运行状态等异常信息，交付给运行时系统处理。抛出异常是一定执行在捕获之前的，没有抛出就不会有捕获。程序可以显式使用throws来声明抛出可查异常以通过编译。  

2、try-catch-finally异常捕获语句：   
try中是可能发生异常的程序段；  

catch中依次编写对应的异常处理器方法，当抛出异常后，由运行时系统在栈中从当前位置开始依次回查方法，直到找到合适的异常处理方法，如果未找到，则执行finally或直接结束程序运行。  

finally ：无论是否捕获或处理异常，finally块里的语句都会被执行。   
**注意（很重要，面试常问）：当在try块或catch块中遇到return语句时，finally语句块将在方法返回之前被执行。   
在以下4种特殊情况下，finally块不会被执行：   
1）在finally语句块中抛出了异常且未处理。   
2）在前面的代码中用了System.exit()退出程序。   
3）程序所在的线程死亡。   
4）CPU出现异常被关闭**    

3、try-catch-finally的执行顺序   
1’当没有异常捕获时，会跳过catch，直接执行finally块。  
```java
public class TestException {
    public static void main(String[] args){         

        try {
            System.out.println("Hello world！");
        } catch (NullPointerException e) {
            System.out.println("Catch NullPointerException!");
        }catch (ArithmeticException e) {
            System.out.println("Catch ArithmeticException!");
        }catch(Exception e){
            System.out.println("Catch other Exception!");
        }
        finally{
            System.out.println("Finally!");
        }   
    }
}
```
输出结果:  
Hello world！   
Finally!  

2’ 当抛出运行时异常且没有定义相应的异常处理方法，就会由JVM抛出异常。  
```java
public class TestException {
    public static void main(String[] args){         
        String str = null;  
        int a = 2, b = 0;
        //调用空对象的方法，会抛出空指针异常
        System.out.println(str.length());       
    }
}
```
输出结果:  
Exception in thread “main” java.lang.NullPointerException   
at Java面试.TestException.main(TestException.java:11)  

3、当try捕获到异常，catch语句块里有处理此异常的情况：在try语句块中是按照顺序来执行的，当执行到某一条语句出现异常时，程序将跳到catch语句块，并与catch语句块逐一匹配，找到与之对应的处理程序，其他的catch语句块将不会被执行，<mark>而try语句块中，出现异常之后的语句也不会被执行</mark>，catch语句块执行完后，最后执行finally语句块后的语句。    

```java
public class TestException {
    public static void main(String[] args){         
        String str = null;  
        int a = 2, b = 0;
        try {
            //调用空对象的方法，会抛出空指针异常
            System.out.println(str.length());  //语句1
            //除数为0，会抛出数学运算错误
            System.out.println("a/b=" + a/b);  //语句2
        } catch (NullPointerException e) {
            System.out.println("Catch NullPointerException!");
        }catch (ArithmeticException e) {
            System.out.println("Catch ArithmeticException!");
        }catch(Exception e){
            System.out.println("Catch other Exception!");
        }
        finally{
            System.out.println("Finally!");
        }   
    }
}
```
输出结果:  
Catch NullPointerException!   
Finally!   

## 自定义一个异常类   
通过继承Exception类实现。    
```java
class MyException extends Exception { // 创建自定义异常类  
    String message;                   // 定义String类型变量  
    public MyException(String ErrorMessagr) { // 父类方法  
        message = ErrorMessagr;  
    }  
    public String getMessage() { // 覆盖getMessage()方法  
        return message;  
    }  
}  
```

## 异常链与异常栈轨迹  

```java
public class TestException {
    public static void main(String[] args){         
        TestException test = new TestException();
        String str = null;
        test.printStringMessage(str);
    }

    public void printStringMessage(String str){
        System.out.println(str.length());
    }
}
```
输出结果:  
Exception in thread “main” java.lang.NullPointerException   
at Java面试.TestException.printStringMessage(TestException.java:16)   
at Java面试.TestException.main(TestException.java:12)   

常规异常：有Java所定义的异常，不需要异常声明，在未被try-catch的情况下，会被默认上报到main()方法。  

异常的冒泡上传机制：当一个异常对象产生了以后，其会按照调用层次（一般是方法的调用层次）进行冒泡，直到被try-catch处理，或上报至main()方法。  

```java
//自定义的异常类
public class MyException extends Exception{
    String message;                           // 定义String类型变量  
    public MyException(String ErrorMessagr) { // 父类方法  
        message = ErrorMessagr;  
    }  
    public String getMessage() {              // 覆盖getMessage()方法  
        return message;  
    }  
}  
```

```java
//测试异常链、冒泡机制
public class TestException {
    void firstThrow()
            throws MyException { //抛出自定义异常
        System.out.println("Oringinally creat a MyException and throw it out");
        throw new MyException("MyException"); //真正的抛出异常处
    }
    void secondThrow()
            throws MyException { //抛出自定义异常
        firstThrow();            //调用firstThrow()
    }
    public TestException()
            throws MyException { //构造方法，抛出自定义异常
        secondThrow();           //调用secondThrow()
    }

    public static void main(String[] args) {
        try{
            //调用构造方法
            TestException testException=new TestException();
        }
        catch(MyException e)
        {
            e.printStackTrace();
            System.out.println("Catch a my exception!");
        }
    }
}
```
输出结果:  
Oringinally creat a MyException and throw it out   
Java面试.MyException: MyException   
at Java面试.TestException.firstThrow(TestException.java:11)   
at Java面试.TestException.secondThrow(TestException.java:16)   
at Java面试.TestException.(TestException.java:20)   
at Java面试.TestException.main(TestException.java:26)   
Catch a my exception!  

从异常栈的记录信息可以发现，与代码相对应的异常抛出机制和次序：  

**firstThrow()产生MyException对象->异常冒泡至调用其的secondThrow()->冒泡至调用secondThrow()的TestExceptionChain的构造方法->冒泡至printtry的main()方法。**     

注意到：异常对象一直被抛出，直至在printtry的mian()方法中被try-catch捕获！   

**在补上一张异常类的继承图**  
![20180507152570771437636.png](https://static.timelovelife.com/qiniu/20180507152570771437636.png)  


## 参考
[Java异常的深入研究与分析](http://developer.51cto.com/art/201601/503857.htm)  
[JAVA基础——异常详解](https://www.cnblogs.com/hysum/p/7112011.html)  
[Java必知必会：异常机制详解](https://blog.csdn.net/zhangliangzi/article/details/51290026) |强烈推荐,写的非常棒!    
