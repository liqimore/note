---
layout: post
title: "java8中的Lambda表达式和Stream"
description: "了解java8中新添加的Lambda表达式和Stream概念."
date: 2018-05-09
tags: [java, 秋招准备]
comments: true
---

## 非常非常棒的JAVA教程,来自于IBM
https://www.ibm.com/developerworks/cn/java/intro-to-java-course/index.html  
***强烈推荐***

## Syntax
A lambda expression is characterized by the following syntax.  
`parameter -> expression body`  
Following are the important characteristics of a lambda expression.  
1. Optional type declaration − No need to declare the type of a parameter. The compiler can inference the same from the value of the parameter.
2. Optional parenthesis around parameter − No need to declare a single parameter in parenthesis. For multiple parameters, parentheses are required.  
3. Optional curly braces − No need to use curly braces in expression body if the body contains a single statement.
4. Optional return keyword − The compiler automatically returns the value if the body has a single expression to return the value. Curly braces are required to indicate that expression returns a value.

## Lambda Expressions Example
```java
public class Java8Tester {

   public static void main(String args[]) {
      Java8Tester tester = new Java8Tester();

      //with type declaration
      MathOperation addition = (int a, int b) -> a + b;

      //with out type declaration
      MathOperation subtraction = (a, b) -> a - b;

      //with return statement along with curly braces
      MathOperation multiplication = (int a, int b) -> { return a * b; };

      //without return statement and without curly braces
      MathOperation division = (int a, int b) -> a / b;

      System.out.println("10 + 5 = " + tester.operate(10, 5, addition));
      System.out.println("10 - 5 = " + tester.operate(10, 5, subtraction));
      System.out.println("10 x 5 = " + tester.operate(10, 5, multiplication));
      System.out.println("10 / 5 = " + tester.operate(10, 5, division));

      //without parenthesis
      GreetingService greetService1 = message ->
      System.out.println("Hello " + message);

      //with parenthesis
      GreetingService greetService2 = (message) ->
      System.out.println("Hello " + message);

      greetService1.sayMessage("Mahesh");
      greetService2.sayMessage("Suresh");
   }

   interface MathOperation {
      int operation(int a, int b);
   }

   interface GreetingService {
      void sayMessage(String message);
   }

   private int operate(int a, int b, MathOperation mathOperation) {
      return mathOperation.operation(a, b);
   }
}
```
Output:  
10 + 5 = 15  
10 - 5 = 5  
10 x 5 = 50  
10 / 5 = 2  
Hello Mahesh  
Hello Suresh   

Following are the important points to be considered in the above example.  
1. Lambda expressions are used primarily to define inline implementation of a functional interface, i.e., an interface with a single method only. In the above example, we've used various types of lambda expressions to define the operation method of MathOperation interface. Then we have defined the implementation of sayMessage of GreetingService.
2. Lambda expression eliminates the need of anonymous class and gives a very simple yet powerful functional programming capability to Java.

## ???
Still got questions about what situations that lambda is required.  
need further practice.  
simplify interface implementation?  


<hr>

## java中的Stream(java8 new feature)
Stream represents a sequence of objects from a source, which supports aggregate operations. Following are the characteristics of a Stream −   

1. Sequence of elements − A stream provides a set of elements of specific type in a sequential manner. A stream gets/computes elements on demand. It never stores the elements.

2. Source − Stream takes Collections, Arrays, or I/O resources as input source.

3. Aggregate operations − Stream supports aggregate operations like filter, map, limit, reduce, find, match, and so on.

4. Pipelining − Most of the stream operations return stream itself so that their result can be pipelined. These operations are called intermediate operations and their function is to take input, process them, and return output to the target. collect() method is a terminal operation which is normally present at the end of the pipelining operation to mark the end of the stream.

5. Automatic iterations − Stream operations do the iterations internally over the source elements provided, in contrast to Collections where explicit iteration is required.

## Generating Streams
With Java 8, Collection interface has two methods to generate a Stream.  

1. **stream()** − Returns a sequential stream considering collection as its source.

2. **parallelStream()** − Returns a parallel Stream considering collection as its source.

## 为什么需要Stream
Java 8 中的 Stream 是对集合（Collection）对象功能的增强，它专注于对集合对象进行各种非常便利、高效的聚合操作（aggregate operation），或者大批量数据操作 (bulk data operation)。Stream API 借助于同样新出现的 Lambda 表达式，极大的提高编程效率和程序可读性。同时它提供串行和并行两种模式进行汇聚操作，并发模式能够充分利用多核处理器的优势，使用 fork/join 并行方式来拆分任务和加速处理过程。通常编写并行代码很难而且容易出错, 但使用 Stream API 无需编写一行多线程的代码，就可以很方便地写出高性能的并发程序。所以说，Java 8 中首次出现的 java.util.stream 是一个函数式语言+多核时代综合影响的产物。  

## 更多资料请看Reference中IBM的链接


## Reference
[Java 8 - Lambda Expressions](https://www.tutorialspoint.com/java8/java8_lambda_expressions.htm)  
[Java 8 中的 Streams API 详解](https://www.ibm.com/developerworks/cn/java/j-lo-java8streamapi/) 推荐阅读    
