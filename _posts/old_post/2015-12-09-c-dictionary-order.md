---
author: liqimore
comments: true
date: 2015-12-09 20:54:55+00:00
layout: post
link: http://blog.codefog.com/c-dictionary-order.html
slug: c-dictionary-order
title: 【转载】C语言讨论 -- 字典顺序排序
wordpress_id: 18
categories:
- 编程
---

**输入下述8个国家名字的字符串：CHINA、JAPAN、KOREA、INDIA、CANADA、AMERICAN、ENGLAND和FRANCE，将这些国名按字典顺序排序。**

**1.字典序法**
**　　字典序法中，对于数字1、2、3......n的排列，不同排列的先后关系是从左到右逐个比较对应的数字的先后来决定的。例如对于5个数字的排列12354和12345，排列12345在前，排列12354在后。按照这样的规定，5个数字的所有的排列中最前面的是12345，最后面的是54321。**
**　　字典序算法如下：**
**　　设P是1～n的一个全排列:p=p1p2......pn=p1p2......pj-1pjpj+1......pk-1pkpk+1......pn
1）从排列的右端开始，找出第一个比右边数字小的数字的序号j（j从左端开始计算），即j=max{i|pi<pi+1}
2）在pj的右边的数字中，找出所有比pj大的数中最小的数字pk，即k=max{i|pi>pj}（右边的数从右至左是递增的，因此k是所有大于pj的数字中序号最大者）**
**3）对换pi，pk
4）再将pj+1......pk-1pkpk+1pn倒转得到排列p’’=p1p2.....pj-1pjpn.....pk+1pkpk-1.....pj+1，这就是排列p的下一个下一个排列。**
**　　例如839647521是数字1～9的一个排列。从它生成下一个排列的步骤如下：**
**　　自右至左找出排列中第一个比右边数字小的数字****4839647521
在该数字后的数字中找出比4大的数中最小的一个5839647521
将5与4交换839657421
将7421倒转839651247
所以839647521的下一个排列是839651247。**

<!-- more -->

    
    #include<stdio.h>
    #include<string.h>
    void main()
    {
    
           charstr[8][9]={"CHINA","JAPAN","KOREA","INDIA","CANADA","AMERICAN","ENGLAND","FRANCE"};
    
           chartemp[9];
    
           inti,l;
    
        for (i=0;i<8;i++)
    
           {
    
                  for(l=0;l<9;l++)
    
                  {
    
                         printf("%c",str[i][l]);
    
                  }
    
                  printf("\n");
    
           }
    
           //排序
    
           printf("以上8个国家按字典中排序如下所示：\n");
    
           intj,k;
    
           for(j=0;j<8;j++)
    
           for(k=j+1;k<8;k++)
    
           {
    
                         if(strcmp(str[j],str[k])>0)
    
                         {//交换
    
                                strcpy(temp,str[j]);
    
                                strcpy(str[j],str[k]);
    
                                strcpy(str[k],temp); 
    
                         }
    
           }
    
                  for(i=0;i<8;i++)//输出
    
                         printf("%s\n",str[i]);
    
    }




** **



转自： [pengzhaoyang100](http://blog.csdn.net/pengzhaoyang100/article/details/7815244) （点击进入原文）
