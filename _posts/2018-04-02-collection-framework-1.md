---
layout: post
title: "Basic knowledge of collection framework - 1"
description: "Hierarchy, Difference about List,Queue,Set,Map interface and Collection interface method"
date: 2018-04-02
tags: java, collection framework
categories: java
comments: true
---


### Basic Knowledge of Collection Framewrok
---

#### Class Hierarchy Of Collection Framework:
![hierarchy_photo](http://javaconceptoftheday.com/wp-content/uploads/2014/11/CollectionHierarchy.png?)

----

#### Difference about List,Queue,Set,Map interface:
The entire collection framework is divided into four interfaces.

1) <mark>List</mark>  —> It handles sequential list of objects. ArrayList, Vector and LinkedList classes implement this interface.

2) <mark>Queue</mark>  —> It handles special list of objects in which elements are removed only from the head. LinkedList and PriorityQueue classes implement this interface.

3) <mark>Set</mark>  —> It handles list of objects which must contain unique element. This interface is implemented by HashSet and LinkedHashSet classes and extended by SortedSet interface which in turn, is implemented by TreeSet.

4) <mark>Map</mark>  —> This is the one interface in Collection Framework which is not inherited from Collection interface. It handles group of objects as Key/Value pairs. It is implemented by HashMap and HashTable classes and extended by SortedMap interface which in turn is implemented by TreeMap.

Three of above interfaces (List, Queue and Set) inherit from Collection interface. Although, Map is included in collection framework it does not inherit from Collection interface.

----

#### Collection interface method
![method](http://javaconceptoftheday.com/wp-content/uploads/2014/11/CollectionInterface.png?x70034)

Collection interface contains total 15 abstract methods. 14 of it’s own and one is inherited from Iterable interface. Here is the list and descriptions of those methods.

> <mark>equals()</mark> and <mark>hashcode()</mark> methods in the Collection interface are not the methods of java.lang.Object class. Because, interfaces does not inherit from Object class. Only classes in java are sub classes of Object class. Any classes implementing Collection interface `must provide their own version of equals() and hashcode() methods` or they can retain default version `inherited from Object class`.

----

orginal: 
- [Java of the day](http://javaconceptoftheday.com/collection-framework-list-interface/)


