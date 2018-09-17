---
layout: post
title: "算法 - 字符串旋转"
description: "algorithm, string reverse."
date: 2018-09-17
tags: [算法, 面试]
categories: [java, 算法]
comments: true
---

## 题目简介
字符串反转，字符串旋转，例如`abcdef`旋转为`defabc`。  

## 解法1,暴力
时间复杂度`O(nm)`,空间`O(1)` (长度为n，移动m个字符）  
### 坑：
java如果想覆盖字符串的值，不能和`c/c++`一样，直接传入指针就能修改原值，而是需要`old = opeartion(old)`这样子把旧的引用覆盖掉才行。  
```java
package string_reverse;

/**
 * @Author: codefog
 * @email: at20s@sina.com
 * @Date: 2018/9/17 10:44 PM
 */
public class Solution1 {


    /**
     * 暴力一次一个字符的移动
     * 时间复杂度O(nm),空间O(1) (长度为n，移动m个字符）
     * @param args
     */
    public static void main(String[] args) {
        String str = "hello world!";
        System.out.println(rotateString(str,3));

    }

    public static String shifting(String str) {

        char[] strs = str.toCharArray();
        char temp = strs[0];
        for (int i = 1; i < strs.length; ++i) {
            //从第一个开始，一次被后一个字符覆盖
            strs[i - 1] = strs[i];
        }
        strs[strs.length - 1] = temp;
        return String.valueOf(strs);
    }

    public static String rotateString(String string, int m) {
        while (m > 0) {
            string = shifting(string);
            m--;
        }
        return string;
    }



}
```

## 解法2，三步反转
时间复杂度`O(n)`,空间复杂度`O(1)`  
1. 分割原字符串
2. 分别反转
3. 整体反转
```java
public class Solution2 {

    /**
     * 三步反转
     * @param args
     */
    public static void main(String[] args) {
        String str = "hello world!";
        System.out.println(rotateString(str,4));

    }

    /**
     * 把字符串m到n的位置反转
     * @param string
     * @return
     */
    public static String reverseString(String string,int m, int n) {
        char[] cString = string.toCharArray();

        while (m < n) {
            char temp = cString[m];
            //第一个值被最后一个覆盖，然后移动m到下一个值
            cString[m++] = cString[n];
            //最后一个值被第一个覆盖，向前移动
            cString[n--] = temp;
        }
        return String.valueOf(cString);
    }

    public static String rotateString(String str, int m) {
        //m = m % length, 如果移动的位置数量超过长度，则相当于一个环旋转
        // 3 % 5 = 3， 小于字符串长度则没有问题
        m %= str.length();
        //反转第一部分
        str = reverseString(str,0, m);
        //反转第二部分
        str = reverseString(str, m, str.length() - 1);
        //整体反转
        str = reverseString(str, 0, str.length() - 1);

        return str;

    }
}
```

## 举一反三
反转句子中单词的位置，比如`i am a student.`， 反转后`student. a am i`，标点符号作为单词的一部分处理.  

### 思路
1. 以空格分割句子为n(单词数量)部分
2. 分别反转
3. 总体反转

```java
public class Others {

    /**
     * 反转句子中的单词
     * @param args
     */
    public static void main(String[] args) {
        String str = "i am quite a student.";
        System.out.println(rotateString(str));

    }

    /**
     * 把字符串m到n的位置反转
     * @param string
     * @return
     */
    public static String reverseString(String string,int m, int n) {
        char[] cString = string.toCharArray();

        while (m < n) {
            char temp = cString[m];
            //第一个值被最后一个覆盖，然后移动m到下一个值
            cString[m++] = cString[n];
            //最后一个值被第一个覆盖，向前移动
            cString[n--] = temp;
        }
        return String.valueOf(cString);
    }

    public static String rotateString(String str) {
        //以空格分割，正则表达
        String[] spString = str.split("\\s+");
        str = "";
        //分别反转分割后的字符串
        if (spString.length > 0) {
            for (int i = 0; i < spString.length; ++i) {
                spString[i] = reverseString(spString[i],0,spString[i].length() - 1);
                //拼接完整字符串
                str += " " + spString[i];
            }
        }
        //总体旋转
        str = reverseString(str, 0, str.length() - 1);

        return str;
    }

}
```

复杂度同上.  