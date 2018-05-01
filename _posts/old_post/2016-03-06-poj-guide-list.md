---
author: liqimore
comments: true
date: 2016-03-06 15:34:16+00:00
layout: post
link: http://blog.codefog.com/poj-guide-list.html
slug: poj-guide-list
title: Poj算法做题顺序【转】
wordpress_id: 20
categories:
- 编程
---

# Part1:





## 初期:




### 一.基本算法:


(1)枚举. (poj1753,poj2965)

(2)贪心(poj1328,poj2109,poj2586)

(3)递归和分治法.

(4)递推.

(5)构造法.(poj3295)

(6)模拟法.(poj1068,poj2632,poj1573,poj2993,poj2996)


### 二.图算法:


(1)图的深度优先遍历和广度优先遍历.

(2)最短路径算法(dijkstra,bellman-ford,floyd,heap+dijkstra)

(poj1860,poj3259,poj1062,poj2253,poj1125,poj2240)

(3)最小生成树算法(prim,kruskal)

(poj1789,poj2485,poj1258,poj3026)

(4)拓扑排序 (poj1094)

(5)二分图的最大匹配 (匈牙利算法) (poj3041,poj3020)

(6)最大流的增广路算法(KM算法). (poj1459,poj3436)


### 三.数据结构.


(1)串 (poj1035,poj3080,poj1936)

(2)排序(快排、归并排(与逆序数有关)、堆排) (poj2388,poj2299)

(3)简单并查集的应用.

(4)哈希表和二分查找等高效查找法(数的Hash,串的Hash)

(poj3349,poj3274,POJ2151,poj1840,poj2002,poj2503)

(5)哈夫曼树(poj3253)

(6)堆

(7)trie树(静态建树、动态建树) (poj2513)


### 四.简单搜索


(1)深度优先搜索 (poj2488,poj3083,poj3009,poj1321,poj2251)

(2)广度优先搜索(poj3278,poj1426,poj3126,poj3087.poj3414)

(3)简单搜索技巧和剪枝(poj2531,poj1416,poj2676,1129)


### 五.动态规划


(1)背包问题. (poj1837,poj1276)

(2)型如下表的简单DP(可参考lrj的书 page149):

1.E[j]=opt{D+w(i,j)} (poj3267,poj1836,poj1260,poj2533)

2.E[i,j]=opt{D[i-1,j]+xi,D[i,j-1]+yj,D[i-1][j-1]+zij} (最长公共子序列)



(poj3176,poj1080,poj1159)

3.C[i,j]=w[i,j]+opt{C[i,k-1]+C[k,j]}.(最优二分检索树问题)


### 六.数学


(1)组合数学:

1.加法原理和乘法原理.

2.排列组合.

3.递推关系.

(POJ3252,poj1850,poj1019,poj1942)

(2)数论.

1.素数与整除问题

2.进制位.

3.同余模运算.

(poj2635, poj3292,poj1845,poj2115)

(3)计算方法.

1.二分法求解单调函数相关知识.(poj3273,poj3258,poj1905,poj3122)


### 七.计算几何学.


(1)几何公式.

(2)叉积和点积的运用(如线段相交的判定,点到线段的距离等). (poj2031,poj1039)



(3)多边型的简单算法(求面积)和相关判定(点在多边型内,多边型是否相交)

(poj1408,poj1584)

(4)凸包. (poj2187,poj1113)






## 中级:




### 一.基本算法:


(1)C++的标准模版库的应用. (poj3096,poj3007)

(2)较为复杂的模拟题的训练(poj3393,poj1472,poj3371,poj1027,poj2706)


### 二.图算法:


(1)差分约束系统的建立和求解. (poj1201,poj2983)

(2)最小费用最大流(poj2516,poj2195)

(3)双连通分量(poj2942)

(4)强连通分支及其缩点.(poj2186)

(5)图的割边和割点(poj3352)

(6)最小割模型、网络流规约(poj3308, )


### 三.数据结构.


(1)线段树. (poj2528,poj2828,poj2777,poj2886,poj2750)

(2)静态二叉检索树. (poj2482,poj2352)

(3)树状树组(poj1195,poj3321)

(4)RMQ. (poj3264,poj3368)

(5)并查集的高级应用. (poj1703,2492)

(6)KMP算法. (poj1961,poj2406)


### 四.搜索


(1)最优化剪枝和可行性剪枝

(2)搜索的技巧和优化 (poj3411,poj1724)

(3)记忆化搜索(poj3373,poj1691)




### 五.动态规划


(1)较为复杂的动态规划(如动态规划解特别的施行商问题等)

(poj1191,poj1054,poj3280,poj2029,poj2948,poj1925,poj3034)

(2)记录状态的动态规划. (POJ3254,poj2411,poj1185)

(3)树型动态规划(poj2057,poj1947,poj2486,poj3140)


### 六.数学


(1)组合数学:

1.容斥原理.

2.抽屉原理.

3.置换群与Polya定理(poj1286,poj2409,poj3270,poj1026).

4.递推关系和母函数.



(2)数学.

1.高斯消元法(poj2947,poj1487, poj2065,poj1166,poj1222)

2.概率问题. (poj3071,poj3440)

3.GCD、扩展的欧几里德(中国剩余定理) (poj3101)

(3)计算方法.

1.0/1分数规划. (poj2976)

2.三分法求解单峰(单谷)的极值.

3.矩阵法(poj3150,poj3422,poj3070)

4.迭代逼近(poj3301)

(4)随机化算法(poj3318,poj2454)

(5)杂题.

(poj1870,poj3296,poj3286,poj1095)


### 七.计算几何学.


(1)坐标离散化.

(2)扫描线算法(例如求矩形的面积和周长并,常和线段树或堆一起使用).

(poj1765,poj1177,poj1151,poj3277,poj2280,poj3004)

(3)多边形的内核(半平面交)(poj3130,poj3335)

(4)几何工具的综合应用.(poj1819,poj1066,poj2043,poj3227,poj2165,poj3429

)






## 高级:




### 一.基本算法要求:


(1)代码快速写成,精简但不失风格

(poj2525,poj1684,poj1421,poj1048,poj2050,poj3306)

(2)保证正确性和高效性. poj3434


### 二.图算法:


(1)度限制最小生成树和第K最短路. (poj1639)

(2)最短路,最小生成树,二分图,最大流问题的相关理论(主要是模型建立和求解)

(poj3155, poj2112,poj1966,poj3281,poj1087,poj2289,poj3216,poj2446

(3)最优比率生成树. (poj2728)

(4)最小树形图(poj3164)

(5)次小生成树.

(6)无向图、有向图的最小环


### 三.数据结构.


(1)trie图的建立和应用. (poj2778)

(2)LCA和RMQ问题(LCA(最近公共祖先问题) 有离线算法(并查集+dfs) 和 在线算法



(RMQ+dfs)).(poj1330)

(3)双端队列和它的应用(维护一个单调的队列,常常在动态规划中起到优化状态转移

的

目的). (poj2823)

(4)左偏树(可合并堆).

(5)后缀树(非常有用的数据结构,也是赛区考题的热点).

(poj3415,poj3294)


### 四.搜索


(1)较麻烦的搜索题目训练(poj1069,poj3322,poj1475,poj1924,poj2049,poj3426)



(2)广搜的状态优化:利用M进制数存储状态、转化为串用hash表判重、按位压缩存储

状态、双向广搜、A*算法. (poj1768,poj1184,poj1872,poj1324,poj2046,poj1482)

(3)深搜的优化:尽量用位运算、一定要加剪枝、函数参数尽可能少、层数不易过大

、可以考虑双向搜索或者是轮换搜索、IDA*算法. (poj3131,poj2870,poj2286)


### 五.动态规划


(1)需要用数据结构优化的动态规划.

(poj2754,poj3378,poj3017)

(2)四边形不等式理论.

(3)较难的状态DP(poj3133)


### 六.数学


(1)组合数学.

1.MoBius反演(poj2888,poj2154)

2.偏序关系理论.

(2)博奕论.

1.极大极小过程(poj3317,poj1085)

2.Nim问题.


### 七.计算几何学.


(1)半平面求交(poj3384,poj2540)

(2)可视图的建立(poj2966)

(3)点集最小圆覆盖.

(4)对踵点(poj2079)


### 八.综合题.


(poj3109,poj1478,poj1462,poj2729,poj2048,poj3336,poj3315,poj2148,poj1263)



1、   排序

1423, 1694, 1723, 1727, 1763, 1788, 1828, 1838, 1840, 2201, 2376, 2377, 2380, 1318, 1877, 1928, 1971, 1974, 1990, 2001, 2002, 2092, 2379,

1002（需要字符处理，排序用快排即可） 1007（稳定的排序） 2159（题意较难懂） 2231
2371（简单排序） 2388（顺序统计算法） 2418（二*排序树）

2、 搜索、回溯、遍历

1022,1111,1118,1129,1190,1562,1564,1573,1655,2184,2225,2243,2312,2362,2378,2386,1010,1011,1018,1020,1054,1062,1256,1321,1363,1501,1650,1659,1664,1753,2078,208
3,2303,2310,2329

简单：1128, 1166, 1176, 1231, 1256, 1270, 1321, 1543, 1606, 1664, 1731, 1742, 1745, 1847, 1915, 1950, 2038, 2157, 2182, 2183, 2381, 2386, 2426,
不易：1024, 1054, 1117, 1167, 1708, 1746, 1775, 1878, 1903, 1966, 2046, 2197, 2349,
推荐：1011, 1190, 1191, 1416, 1579, 1632, 1639, 1659, 1680, 1683, 1691, 1709, 1714, 1753, 1771, 1826, 1855, 1856, 1890, 1924, 1935, 1948, 1979, 1980, 2170, 2288, 2331, 2339, 2340,1979（和迷宫类似） 1980（对剪枝要求较高）

3、 历法

1008 2080 （这种题要小心）

4、 枚举

1012，1046， 1387， 1411， 2245， 2326， 2363， 2381，1054（剪枝要求较高），1650(小数的精度问题）

5、   数据结构的典型算法

容易：1182, 1656, 2021, 2023, 2051, 2153, 2227, 2236, 2247, 2352, 2395,
不易：1145, 1177, 1195, 1227, 1661, 1834,
推荐：1330, 1338, 1451, 1470, 1634, 1689, 1693, 1703, 1724, 1988, 2004, 2010, 2119, 2274, 1125(弗洛伊德算法) ，2421（图的最小生成树）

6、 动态规划

1037 A decorative fence、
1050 To the Max、
1088 滑雪、
1125 Stockbroker Grapevine、
1141 Brackets Sequence、
1159 Palindrome、
1160 Post Office、
1163 The Triangle、
1458 Common Subsequence、
1579 Function Run Fun、
1887 Testing the CATCHER、
1953 World Cup Noise、
2386 Lake Counting

动态规划
容易：
1018, 1050, 1083, 1088, 1125, 1143, 1157, 1163, 1178, 1179, 1189, 1208, 1276, 1322, 1414, 1456, 1458, 1609, 1644, 1664, 1690, 1699, 1740, 1742, 1887, 1926, 1936, 1952, 1953, 1958, 1959, 1962, 1975, 1989, 2018, 2029, 2033, 2063, 2081, 2082, 2181, 2184, 2192, 2231, 2279, 2329, 2336, 2346, 2353, 2355, 2356, 2385, 2392, 2424,
不易：
1019, 1037, 1080, 1112, 1141, 1170, 1192, 1239, 1655, 1695, 1707, 1733, 1737, 1837, 1850, 1920, 1934, 1937, 1964, 2039, 2138, 2151, 2161, 2178,
推荐：
1015, 1635, 1636, 1671, 1682, 1692, 1704, 1717, 1722, 1726, 1732, 1770, 1821, 1853, 1949, 2019, 2127, 2176, 2228, 2287, 2342, 2374, 2378, 2384, 2411,

7、 贪心

1042, 1065, 1230, 1784,1328 1755（或用单纯形方法），2054，1017， 1328，1862， 1922 ，2054， 2209， 2313， 2325， 2370。

8、 模拟

容易：1006, 1008, 1013, 1016, 1017, 1169, 1298, 1326, 1350, 1363, 1676, 1786, 1791, 1835, 1970, 2317, 2325, 2390,
不易：1012, 1082, 1099, 1114, 1642, 1677, 1684, 1886,1281 1928 2083 2141 2015

9、   递归

1664

10、字符串处理

1488, 1598, 1686, 1706, 1747, 1748, 1750, 1760, 1782, 1790, 1866, 1888, 1896, 1951, 2003, 2121, 2141, 2145, 2159, 2337, 2359, 2372, 2406, 2408, 1016 1051 1126 1318 1572 1917 1936 2039 2083 2136 2271 2317 2330，2121 2403

11、数论

1006,1014,1023,1061,1152,1183,1730,2262

12、几何有关的题目

凸包：1113, 1228, 1794, 2007, 2187,1113 wall，2187 beauty contest
容易：1319, 1654, 1673, 1675, 1836, 2074, 2137, 2318,
不易：1685, 1687, 1696, 1873, 1901, 2172, 2333,

13、任意精度运算、数字游戏、高精度计算

1001 1023 1047 1060 1079 1131 1140 1142 1207 1220 1284 1289 1306 1316 1338 1405 14541503 1504 1519 1565 1650 1969 2000 2006 2081 2247 2262 2305 2316 2389
1001, 1220, 1405, 1503,1001（高精度乘法） 2413(高精度加法，还有二分查找)

14、概率统计

1037,1050

15、小费用最大流、最大流

2195 going home，2400 supervisor, supervisee，1087 a plug for UNIX，1149 PIGS，1273 drainage ditches，1274 the perfect stall，1325 machine schedule，1459 power network，2239 selecting courses

16、压缩存储的DP

1038 bugs integrated inc，1185 炮兵阵地，2430 lazy cow

17、最长公共子串（LCS）

1080 human gene functions，1159 palindrome，1458 common subsequence，2192 zipper

18、图论及组合数学

2421 Constructing Roads、
2369 Permutations、
2234 Matches Game、
2243 Knight Moves、
2249 Binomial Showdown、
2255 Tree Recovery、
2084 Game of Connections、
1906 Three powers、
1833 排列、
1850 Code、
1562 Oil Deposits、
1496 Word Index、
1306 Combinations、
1125 Stockbroker Grapevine、
1129 Channel Allocation、
1146 ID Codes、
1095 Trees Made to Order、找规律
2247 Humble Numbers、
2309 BST、
2346 Lucky tickets、
2370 Democracy in danger、
2365 Rope、
2101 Honey and Milk Land
2028 When Can We Meet?、
2084 Game of Connections、
1915 Knight Moves、
1922 Ride to School、
1941 The Sierpinski Fractal、
1953 World Cup Noise、
1958 Strange Towers of Hanoi、
1969 Count on Canton、
1806 Manhattan 2025、
1809 Regetni、
1844 Sum、
1870 Bee Breeding、
1702 Eva\’s Balance、
1728 A flea on a chessboard、
1604 Just the Facts、
1642 Stacking Cubes、
1656 Counting Black、
1657 Distance on Chessboard、
1662 CoIns、
1663 Number Steps、
1313 Booklet Printing、
1316 Self Numbers、
1320 Street Numbers、
1323 Game Prediction、
1338 Ugly Numbers、
1244 Slots of Fun、
1250 Tanning Salon、
1102 LC-Display、
1147 Binary codes、
1013 Counterfeit Dollar、

19、博弈类

1067 取石子游戏、
1740 A New Stone Game、
2234 Matches Game、
1082 Calendar Game 、
2348 Euclid\’s Game、
2413 How many Fibs?、
2419 Forest

20、简单、模拟题
1001 Exponentiation 、
1002 487-3279、
1003 Hangover 、
1701 Dissatisfying Lift、
2301 Beat the Spread!、
2304 Combination Lock、
2328 Guessing Game、
2403 Hay Points 、
2406 Power Strings、
2339 Rock, Scissors, Paper、
2350 Above Average、
2218 Does This Make Me Look Fat?、
2260 Error Correction、
2262 Goldbach\’s Conjecture、
2272 Bullseye、
2136 Vertical Histogram、
2174 Decoding Task、
2183 Bovine Math Geniuses、
2000 Gold Coins、
2014 Flow Layout、
2051 Argus、
2081 Calendar、
1918 Ranking List、
1922 Ride to School、
1970 The Game、
1972 Dice Stacking、
1974 The Happy Worm、
1978 Hanafuda Shuffle、
1979 Red and Black、
1617 Crypto Columns、
1666 Candy Sharing Game、
1674 Sorting by Swapping、
1503 Integer Inquiry、
1504 Adding Reversed Numbers、
1528 Perfection、
1546 Basically Speaking、
1547 Clay Bully、
1573 Robot Motion、
1575 Easier Done Than Said?、
1581 A Contesting Decision、
1590 Palindromes、
1454 Factorial Frequencies、
1363 Rails、
1218 THE DRUNK JAILER、
1281 MANAGER、
1132 Border、
1028 Web Navigation、

21、初等数学

1003 Hangover、
1045 Bode Plot、
1254 Hansel and Grethel、
1269 Intersecting Lines、
1401 Factorial、
1410 Intersection、
2363 Blocks 、
2365 Rope、
2242 The Circumference of the Circle、
2291 Rotten Ropes、
2295 A DP Problem、
2126 Factoring a Polynomial、
2191 Mersenne Composite Numbers、
2196 Specialized Four-Digit Numbers、
1914 Cramer\’s Rule、
1835 宇航员、
1799 Yeehaa!、
1607 Deck、
1244 Slots of Fun、
1269 Intersecting Lines、
1299 Polar Explorer、
1183 反正切函数的应用、

22、匹配

1274, 1422, 1469, 1719, 2060, 2239

===================================

经典
1011（搜索好题）
1012（学会打表）
1013
1019（它体现了很多此类问题的特点）
1050（绝对经典的dp）
1088（dp好题）
1157（花店，经典的dp）
1163（怎么经典的dp那么多呀？？？）
1328（贪心）
1458（最长公共子序列）
1647（很好的真题，考临场分析准确和下手迅速）
1654（学会多边形面积的三角形求法）
1655（一类无根树的dp问题）
1804（逆序对）
2084（经典组合数学问题）
2187（用凸包求最远点对，求出凸包后应该有O(N)的求法，可我就是调不出来）
2195（二分图的最佳匹配）
2242（计算几何经典）
2295（等式处理）
2353（dp，但要记录最佳路径）
2354（立体解析几何）
2362（搜索好题）
2410（读懂题是关键）
2411（经典dp）



趣味
1067（很难的数学，但仔细研究，是一片广阔的领域）
1147（有O(n)的算法，需要思考）
1240（直到一棵树的先序和后序遍历，那么有几种中序遍历呢？dp）
1426（是数论吗？错，是图论！）
1648（别用计算几何，用整点这个特点绕过精度的障碍吧）
1833（找规律）
1844（貌似dp或是搜索，其实是道有趣的数学题）
1922（贪心，哈哈）
2231
2305（不需要高精度噢）
2328（要仔细噢）
2356（数论知识）
2359（约瑟夫问题变种）
2392（有趣的问题）



很繁的题
1001
1008
1087（构图很烦，还有二分图的最大匹配）
1128（USACO）
1245
1329
1550（考的是读题和理解能力）
1649（dp）
2200（字符串处理+枚举）
2358（枚举和避免重复都很烦）
2361（仔细仔细再仔细）



难题

1014（数学证明比较难，但有那种想法更重要）
1037（比较难的dp）
1405（高精度算法也分有等级之分，不断改进吧）
2002（不知道有没有比O(n^2*logn)更有的算法？）
2054（极难，很强的思考能力）
2085（组合数学）
2414（dp，但要剪枝）
2415（搜索）
2423（计算几何+统计）



多解题
1002（可以用排序，也可以用统计的方法）
1338（搜索和dp都可以）
1664（搜索和dp都练一练吧）
2082（这可是我讲的题噢）
2352（桶排和二*树都行）



Note:
1011: 很经典的剪支
1014: 难在数学上
1017: 严格的数学证明貌似不容易
1021: 有点繁,考察对图形进行各种旋转的处理
1083: 巧妙的思考角度
1150: 分奇偶讨论,lg(n)算法
1218: 三行就够了,虽然简单,但也有优劣之别
1505: 二分加贪心
1654: 做法也许很多吧,本人用有向面积做的
1674: 计算圈的个数(算是graph 吧)
1700: 数学证明不容易
1742: O(m*n)的算法
1863: 要耐心地慢慢写…^_^
1988: 并查集
2051: 堆
2078: 不难，但剪支可以做到很好
2082::O(n),你想到了吗？
2084: 卡特兰数
2182: 线段树
2195: 最小费用最大流
2234: 经典博弈算法
2236: 并查集
2299: 二分思想
2395: Kruskal 最小生成树的拓展
2406: KMP
2411: 用二进制串来表示状态




# Part2:


按照我做题的顺序，在这里总结一下好了：
[Problem 1000](http://poj.org/problem?id=1000)： 求A+B，相当于hello World，典型的水题。
[Problem 2105](http://poj.org/problem?id=2105)： 把一个32位的字符串转换为点分的IP地址。
[Problem 1004](http://poj.org/problem?id=1004)： 求十二个数字的平均数。
[Problem 2027](http://poj.org/problem?id=2027)： 僵尸会吃脑子，让你判断僵尸需要的脑子的大小和脑子的大小来判断有没有用。水题一个。
[Problem 3030](http://poj.org/problem?id=3030)： 给你一个广告不做广告的收益，做广告的收益，广告费用，来计算做广告合适不合适。
[Problem 3062](http://poj.org/problem?id=3062)： 原样输出程序的输入。
[Problem 3077](http://poj.org/problem?id=3077)： 典型的水题。
[Problem 1102](http://poj.org/problem?id=1102)：典型的水题。
[Problem 1657](http://poj.org/problem?id=1657)：棋盘上的距离，比较简单，只要了解了能够各个角色能够到达的地点之间的数学关系即可；属于最简单的水题。
[Problem 1045](http://poj.org/problem?id=1045)：典型的水题。
[Problem 2719](http://poj.org/problem?id=2719)：汽车的里程表是坏掉的，不管哪一位总会从3直接跳到五。根据里程表显示的数字求真实的数字。也就是9进制转化为十进制的问题，简单，水题。
[Problem 1298](http://poj.org/problem?id=1298)：破译密码：凯撒密码，每个字母用其后面的第五个代替。很简单是水题。
[Problem 3749](http://poj.org/problem?id=3749)：破译密码：凯撒密码，每个字母用其后面的第五个代替。很简单是水题。
[Problem 3917](http://poj.org/problem?id=3917)：石头剪子布的游戏，给你两个出拳的序列，让你判断每个人分别赢了多少次，简单，水题。
[Problem 2000](http://poj.org/problem?id=2000)：Gold Coins简单，水题。
[Problem 1003](http://poj.org/problem?id=1003)：Hangover
[Problem 1218](http://poj.org/problem?id=1218)：The Drunk Jailor。
[Problem 2590](http://poj.org/problem?id=2590)：Steps，给你两个坐标，问最少走多少步能到。转换以下思路，就比较简单。可以转换成n步，最远可以到多远即可。
[Problem 1046](http://poj.org/problem?id=1046)：Color me less。给你16个颜色，然后给你另外的颜色，计算给定的颜色离哪个颜色最近。简单的逻辑题目。水题。
[Problem 3325](http://poj.org/problem?id=3325)：ICPC SCORE Totalizer software。一个评委用的计算器，去掉一个最高分，去掉一个最低分，然后求出平均分，输出。水题。
[Problem 2101](http://poj.org/problem?id=3325)：Honey and Milk Land。给你两个数组，分别把他们求和，当作一个矩形的边长。然后求对角线的长度。输出ceil之后得到的结果。水题。
[Problem 1207](http://poj.org/problem?id=1207)：The 3n + 1 Problem。一个数论的问题，比较简单，属于典型的水题，但是如果牺牲一部分空间来记忆一部分计算的结果，可能节约计算的时间。加油。
[Problem 1005](http://poj.org/problem?id=1005)：I think i need a houseboat。一个简单的计算题。典型的水题。
[Problem 1401](http://poj.org/problem?id=1401)：Factorial。要求计算n的阶乘最后的零的个数。算法思想很重要。
[Problem 1423](http://poj.org/problem?id=1423)：Big Number。计算一个数字n的阶乘的位数。就是一个简单的公式striling公式。
