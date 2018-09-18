---
layout: post
title: "算法 - 字符串包含[+++]"
description: "algorithm, string contains."
date: 2018-09-18
tags: [算法, 面试]
categories: [java, 算法]
comments: true
---

## 题目简介
给定一长字符串`a -> ABCD`，短字符串`b -> BAD`, 短字符串`c -> BCE`,则字符串b中的字母都在字符串a中，b是a的真子集，所以对于a，返回`true`，对于b，返回`false`，因为字符串b的元素E不在a中。  
注意：都是大写字母  

## 解法1，暴力轮询
拿出字符串b的每个元素，分别查询是否在a中出现，若一旦有一个不出现，则返回`false`，如果所有元素都出现，则返回`true`。  
时间复杂度O(nm)，其中n和m为字符串a，b的长度。  
```java
package chapter2_String_Contains;

/**
 * @Author: codefog
 * @email: at20s@sina.com
 * @Date: 2018/9/18 1:52 PM
 */
public class Solution1 {

    /**
     * 暴力轮询
     *
     * @param args
     */
    public static void main(String[] args) {

        String a = "HelloWorld"; //j
        String b = "ldWor"; // i
        String c = "ABC";

        System.out.println(isContains1(a, b));
        System.out.println(isContains1(a, c));

    }

    public static boolean isContains(String a, String b) {
        char[] aStr = a.toCharArray();
        char[] bStr = b.toCharArray();

        //固定字符串b
        for (int i = 0; i < bStr.length; i++) {
            int flag = 0;
            for (int j = 0; j < aStr.length; j++) {
                if (bStr[i] == aStr[j]) {
                    flag = 1;
                    break;
                }
            }
            if (flag == 0) {
                return false;
            }
        }
        return true;
    }

    /**
     * 相同算法，第二种写法
     * @param a
     * @param b
     * @return
     */
    public static boolean isContains1(String a, String b) {
        char[] aStr = a.toCharArray();
        char[] bStr = b.toCharArray();

        //固定字符串b
        for (int i = 0; i < bStr.length; i++) {
            for (int j = 0; j < aStr.length; j++) {
                if (bStr[i] == aStr[j]) {
                    break;
                }
                //字符串b移动到最后一位，a也是最后一位，仍然没有找到相同的，就返回false
                if (bStr[i] != aStr[j] && i == bStr.length - 1 && j == aStr.length - 1) {
                    return false;
                }
            }
        }
        return true;
    }
}




```

## 解法2，排序后再轮询
排序时间复杂度`O(mlogm)+O(nlogn)+O(m+n)`，即两次排序和线性扫描的复杂度。与第一种解法类似，改进不大。  
```java
package chapter2_String_Contains;

import java.util.Arrays;

/**
 * @Author: codefog
 * @email: at20s@sina.com
 * @Date: 2018/9/18 4:59 PM
 */
public class Solution2 {

    /**
     * 排序轮询
     * @param args
     */
    public static void main(String[] args) {

        String a = "HelloWorld"; //j
        String b = "ldWor"; // i
        String c = "ABC";

        System.out.println(isContains(a, b));
        System.out.println(isContains(a, c));

    }

    public static boolean isContains(String a, String b) {

        char[] aStr = a.toCharArray();
        char[] bStr = b.toCharArray();
        Arrays.sort(aStr);
        Arrays.sort(bStr);

        //固定字符串b
        for (int i = 0; i < bStr.length; i++) {
            int flag = 0;
            for (int j = 0; j < aStr.length; j++) {
                if (bStr[i] == aStr[j]) {
                    flag = 1;
                    break;
                }
            }
            if (flag == 0) {
                return false;
            }
        }
        return true;

    }
}
```

## 解法3，素数相乘
时间复杂度O(m+n),最好情况O(n)。巧妙的利用了素数，非常聪明。缺点是获取的素数乘积会可能超过int的最大值，造成溢出。   
证明: `每个正整数都可以唯一表示成素数的乘积.`在本算法中，利用字母在编码中对应的数字，可以把字母当作一个正整数，获取到他们的乘积后，可以为一表示字符串。  
```
首先证明存在性,  
用数学归纳法,n=2很显然,假设n＜k时成立,当n=k时,如果k为素数,显然成立；如果k是合数,则至少有一个素因数p1,k=p1*a,而由归纳假设a＜k能分解为素数乘积,所以n=k也成立.所以对于任意大于1的整数n都存在.  
然后证明唯一性,  
如果有两个分解式,2^p1*3^p2*5^p3*…=2^q1*3^q2*5^q3*…,则  
2^p1|2^q1*3^q2*5^q3*…,所以p1≤q1,同理q1≤p1,所以p1=q1,  
后边的类似证明.  
```
代码:
```java
package chapter2_String_Contains;

/**
 * @Author: codefog
 * @email: at20s@sina.com
 * @Date: 2018/9/18 10:33 PM
 */
public class Solution3 {

    public static void main(String[] args) {

        String a = "HELLOWORLD"; //j
        String b = "LDWOR"; // i
        String c = "ABC";

        System.out.println(isContains(a, b));
        System.out.println(isContains(a, c));
    }


    public static boolean isContains(String a, String b) {

        final int[] pr = {2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97,101};

        long muti = 1;
        char[] aStr = a.toCharArray();
        char[] bStr = b.toCharArray();
        //遍历字符串a，获取到它所对应的全部素数的乘积
        for (int i = 0; i < aStr.length; i++) {
            //都是大写字母，所以直接相减就在26的范围内，即可确定索引值
            int index = aStr[i] - 'A';
            muti *= pr[index];
        }

        //遍历字符串b，然后让第一步获得的乘积和短字符串所对应的素数取余数，如果由余数，返回false
        for (int i = 0; i < bStr.length; i++) {
            int index = bStr[i] - 'A';
            if (muti % pr[index] > 0) {
                return false;
            }
        }
        return true;
    }

}
```

## 解法4，位运算法(HASH)
这个方法和解法3类似，只不过把算出的素数乘积换成了HASH值，然后在用b查询，所有操作使用位运算完成。时间复杂度同上O(n+m)，空间复杂度为O(1)，对空间友好。   
```java
package chapter2_String_Contains;

/**
 * @Author: codefog
 * @email: at20s@sina.com
 * @Date: 2018/9/19 12:06 AM
 */
public class Solution4 {

    public static void main(String[] args) {

        String a = "HELLOWORLD"; //j
        String b = "LDWOR"; // i
        String c = "ABC";

        System.out.println(isContains(a, b));
        System.out.println(isContains(a, c));
    }

    public static boolean isContains(String a, String b) {
        char[] aStr = a.toCharArray();
        char[] bStr = b.toCharArray();

        int HASH = 0;

        //遍历a字符串，为每个字符计算HASH值
        for (int i = 0; i < aStr.length; i++) {
            HASH |= (1 << (aStr[i] - 'A'));
        }
        //把b的每个字符放到a中查找
        for (int i = 0; i < bStr.length; i++) {
            if ( (HASH & (1 << (bStr[i] - 'A')) ) == 0) {
                return false;
            }
        }

        return true;
    }
}
```

## 其他资料算法
参考： https://www.cnblogs.com/tgycoder/p/5241157.html  

