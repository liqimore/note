---
layout: post
title: "Basic knowledge of collection framework - 2"
description: "Usage & Advantage of ArrayList"
date: 2018-04-02
tags: java, collection framework, ArrayList, Array
categories: java
comments: true
---

### Advantage of using ArrayList over Arrays

Drawbacks of Arrays:
1. Arrays are <mark>fixed length</mark>, once created, you can not change the size of the array.
2. After Arrays are created , you can not accommodate an extra element.
3. Memory is allocated to an array during it’s creation only, much before the actual elements are added to it.

Advantages of ArrayList:
1. You can define ArrayList as <mark>re-sizable</mark> array. Size of the ArrayList is not fixed. ArrayList can grow and shrink dynamically.
```java
class ArrayListDemo
{
    public static void main(String[] args)
    {
        ArrayList<String> list = new ArrayList<String>();
 
        list.add("ONE");
 
        list.add("TWO");
 
        list.add("THREE");
 
        System.out.println(list.size());     //Output : 3
 
        //Inserting some more elements
        list.add("FOUR");
 
        list.add("FIVE");
 
        System.out.println(list.size());    //Output : 5
 
        //Removing an element
        list.remove("TWO");
 
        System.out.println(list.size());    //Output : 4
    }
}
```
2. Elements can be inserted at or deleted from a particular position.
```java
class ArrayListDemo
{
    public static void main(String[] args)
    {
        ArrayList<String> list = new ArrayList<String>();
 
        list.add("ZERO");
 
        list.add("TWO");
 
        list.add("FOUR");
 
        System.out.println(list);     //Output : [ZERO, TWO, FOUR]
 
        list.add(2, "THREE");       //Inserting an element at index 2
 
        list.add(1, "ONE");     //Inserting an element at index 1
 
        System.out.println(list);    //Output : [ZERO, ONE, TWO, THREE, FOUR]
 
        list.remove(3);       //Removing an element from index 3
 
        System.out.println(list);    //Output : [ZERO, ONE, TWO, FOUR]
    }
}
```
3. ArrayList class has many methods to manipulate the stored objects.

ArrayList class has methods to perform solo modifications ( add(), remove()… ), bulk modifications ( addAll(), removeAll(), retainAll()… ), searching( indexOf(), lasIndexOf() ) and iterations( iterator() ).

4. If generics are not used, ArrayList can hold any type of objects.
```java
class ArrayListDemo
{
    public static void main(String[] args)
    {
        ArrayList list = new ArrayList();     //ArrayList without generics
 
        list.add("ZERO");    //adding string type object
 
        list.add(1);        //adding primitive int type
 
        list.add(20.24);    //adding primitive double type
 
        list.add(new Float(23.56));   //Adding Float wrapper type object
 
        list.add(new Long(25));      //Adding Long wrapper type object
 
        System.out.println(list);     //Output : [ZERO, 1, 20.24, 23.56, 25]
    }
}
```
5. 5) Many are of the assumption that multiple insertion and removal operations on ArrayList will decrease the performance of an application. But, there will be no significant change in the performance of an application if you use ArrayList instead of arrays. Below example shows time taken to add 1000 string elements to ArrayList and array.
```java
class ArrayListDemo
{
    public static void main(String[] args)
    {
        String[] namesArray = new String[1000];
 
        long startTime = System.currentTimeMillis();
 
        for (int i = 0; i < namesArray.length; i++)
        {
            namesArray[i] = "Name"+i;
        }
 
        long endTime = System.currentTimeMillis();          
 
        System.out.println("Time taken by Array : "+(endTime - startTime)+"ms");
 
        ArrayList<String> nameList = new ArrayList<String>();     
 
        startTime = System.currentTimeMillis();
 
        for (int i = 0; i <= 1000; i++)
        {
            nameList.add("Name"+i);
        }
 
        endTime = System.currentTimeMillis();
 
        System.out.println("Time taken by ArrayList : "+(endTime-startTime)+"ms");
    }
}
```
>Output :
Time taken by Array : 6ms
Time taken by ArrayList : 6ms

6. You can traverse an ArrayList in both the directions – forward and backward using ListIterator.
```java
class ArrayListDemo
{
    public static void main(String[] args)
    {    
        ArrayList<String> list = new ArrayList<String>();
         
        list.add("ONE");
         
        list.add("TWO");
         
        list.add("THREE");
         
        list.add("FOUR");
         
        ListIterator iterator = list.listIterator();
         
        System.out.println("Elements in forward direction");
         
        while (iterator.hasNext())
        {
            System.out.println(iterator.next());
        }
         
        System.out.println("Elements in backward direction");
         
        while (iterator.hasPrevious())
        {
            System.out.println(iterator.previous());
        }
    }
}
```
7. ArrayList can hold multiple null elements.
```java
class ArrayListDemo
{
    public static void main(String[] args)
    {
        ArrayList<Integer> list = new ArrayList<Integer>();     
 
        list.add(100);
 
        list.add(null);
 
        list.add(null);
 
        System.out.println(list);     //Output : [100, null, null]
    }
}
```
8. ArrayList can hold duplicate elements.
```java
class ArrayListDemo
{
    public static void main(String[] args)
    {
        ArrayList<Integer> list = new ArrayList<Integer>();     
 
        list.add(100);
 
        list.add(100);
 
        list.add(100);
 
        System.out.println(list);     //Output : [100, 100, 100]
    }
}
```

#### (Above two advantages(7 and 8) are also applicable to arrays. But, you can treat them as bonus with all above advantages of ArrayList.)

[orginal link](http://javaconceptoftheday.com/advantages-of-using-arraylist-over-arrays/)
