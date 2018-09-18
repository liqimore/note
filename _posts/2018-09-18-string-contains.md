---
layout: post
title: "算法 - 字符串包含"
description: "algorithm, string contains."
date: 2018-09-18
tags: [算法, 面试]
categories: [java, 算法]
comments: true
---

## 题目简介
给定一长字符串`a -> ABCD`，短字符串`b -> BAD`, 短字符串`c -> BCE`,则字符串b中的字母都在字符串a中，b是a的真子集，所以对于a，返回`true`，对于b，返回`false`，因为字符串b的元素E不在a中。  

## 解法1，暴力轮询
