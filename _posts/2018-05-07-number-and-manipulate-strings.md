---
layout: post
title: "数字,字符串和日期类的基本操作"
description: "Number,Date类的常见使用,字符串的简单操作和常用方法复习,做个记录."
date: 2018-05-07
tags: [java, 秋招准备]
comments: true
---

## 基本类型的封装类
所有的基本类型，都有对应的类类型,比如int对应的类是Integer,这种类就叫做封装类.   
![20180507152562630687372.png](https://static.timelovelife.com/20180507152562630687372.png)  

**基本类型和封装类的转化**  
```java
public class TestNumber {

    public static void main(String[] args) {
        int i = 5;

        //基本类型转换成封装类型
        Integer it = new Integer(i);
        //封装类型转换成基本类型
        int i2 = it.intValue();
        //自动转换就叫装箱
        Integer it2 = i;
        //自动转换就叫拆箱
        int i3 = it;
    }
}
```

**TODO: StringBuffer & StringBuilder**   
[Java基础之String、StringBuffer与StringBuilder的区别及应用场景](https://blog.csdn.net/chenliguan/article/details/51911906)  

## 日期和时间

除了String这个类在日常的项目中比较常用之外，有关时间和日期的操作也是经常遇到的，本篇就讲详细介绍下Java API中对时间和日期的支持。其实在Java 8之前时间日期的API并不是很好用，以至于人们在项目中大多使用的是一个第三方库 Joda-Time，当然Java 8 吸收了该库的大部分优点，改进了相关API，现在的时间日期处理接口相对以前来说是好用很多，本篇也将学习下这个优秀的第三方库。下面是本篇主要涉及内容：   
1. 古老的Date类  
2. 处理年月日的年历类Calendar
3. 格式化字符串和日期对象的DateFormat格式转换类
4. 好用的SimpleDateFormat实现类
5. Joda-Time库

**java.util.Date类**   
 类 Date 表示特定的瞬间，精确到毫秒。从 JDK 1.1 开始，应该使用 Calendar 类实现日期和时间字段之间转换，使用 DateFormat 类来格式化和分析日期字符串。Date 中的把日期解释为年、月、日、小时、分钟和秒值的方法已废弃。   
 ***提供了很多的方法，但是很多已经过时，不推荐使用，下面仅仅列出没有过时的方法：***    

构造方法摘要  
-------------
Date()
          分配 Date 对象并用当前时间初始化此对象，以表示分配它的时间（精确到毫秒）。
Date(long date)
          分配 Date 对象并初始化此对象，以表示自从标准基准时间（称为“历元（epoch）”，即 1970 年 1 月 1 日 00:00:00 GMT）以来的指定毫秒数。

构造方法源码:   
```java
public Date(long date) {
        fastTime = date;
    }
public Date() {
        this(System.currentTimeMillis());
    }
```

方法摘要
-------------
 boolean after(Date when)
          测试此日期是否在指定日期之后。

 boolean before(Date when)
          测试此日期是否在指定日期之前。

 Object clone()
          返回此对象的副本。

 int compareTo(Date anotherDate)
          比较两个日期的顺序。

 boolean equals(Object obj)
          比较两个日期的相等性。

 long getTime()
          返回自 1970 年 1 月 1 日 00:00:00 GMT 以来此 Date 对象表示的毫秒数。

 int hashCode()
          返回此对象的哈希码值。

 void setTime(long time)
          设置此 Date 对象，以表示 1970 年 1 月 1 日 00:00:00 GMT 以后 time 毫秒的时间点。

 String toString()
          把此 Date 对象转换为以下形式的 String： dow mon dd hh:mm:ss zzz yyyy 其中：
          dow 是一周中的某一天 (Sun, Mon, Tue, Wed, Thu, Fri, Sat)。
          mon 是月份 (Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec)。
          dd 是一月中的某一天（01 至 31），显示为两位十进制数。
          hh 是一天中的小时（00 至 23），显示为两位十进制数。
          mm 是小时中的分钟（00 至 59），显示为两位十进制数。
          ss 是分钟中的秒数（00 至 61），显示为两位十进制数。
          zzz 是时区（并可以反映夏令时）。标准时区缩写包括方法 parse 识别的时区缩写。如果不提供时区信息，则 zzz 为空，即根本不包括任何字符。
          yyyy 是年份，显示为 4 位十进制数。

例子:  
```java
import java.util.Date;

/**
* Created by IntelliJ IDEA.
* User: leizhimin
* Date: 2007-11-30
* Time: 8:45:44
* 日期测试
*/
public class TestDate {
    public static void main(String args[]) {
        TestDate nowDate = new TestDate();
        nowDate.getSystemCurrentTime();
        nowDate.getCurrentDate();
    }

    /**
     * 获取系统当前时间
     * System.currentTimeMillis()返回系统当前时间，结果为1970年1月1日0时0分0秒开始，到程序执行取得系统时间为止所经过的毫秒数
     * 1秒＝1000毫秒
     */
    public void getSystemCurrentTime() {
        System.out.println("----获取系统当前时间----");
        System.out.println("系统当前时间 = " + System.currentTimeMillis());
    }

    /**
     * 通过Date类获取当前日期和当前时间
     * date.toString()把日期转换为dow mon dd hh:mm:ss zzz yyyy
     */
    public void getCurrentDate() {
        System.out.println("----获取系统当前日期----");
        //创建并初始化一个日期（初始值为当前日期）
        Date date = new Date();
        System.out.println("现在的日期是 = " + date.toString());
        System.out.println("自1970年1月1日0时0分0秒开始至今所经历的毫秒数 = " + date.getTime());
    }
}
```

返回结果:  

运行结果:
----获取系统当前时间----
系统当前时间 = 1196413077278
----获取系统当前日期----
现在的日期是 = Fri Nov 30 16:57:57 CST 2007
自1970年1月1日0时0分0秒开始至今所经历的毫秒数 = 1196413077278

Process finished with exit code 0

**java.text.DateFormat抽象类的使用**   
DateFormat是一个抽象类，该类主要用于实现Date对象和字符串之间相互转换， 涉及到两个转换的方法：   
```java
//将Date类型转换为String类型
public final String format(Date date)
//将String类型转换Date类型
public Date parse(String source)
```
除此之外，DateFormat还提供了四个静态常量，代表着四种不同的风格。不同的风格输出信息的内容详尽程度不同，默认的风格是MEDIUM。   
```java
public static final int FULL = 0;
public static final int LONG = 1;

public static final int MEDIUM = 2;

public static final int SHORT = 3;

public static final int DEFAULT = MEDIUM;
```

**java.text.SimpleDateFormat（DateFormat的直接子类）的使用**  
SimpleDateFormat是DateFormat的一个优秀的实现类，它增强了一个重要的性质。它允许自定义格式输出模板。构造SimpleDateFormat实例的时候，可以传入一个pattern作为输出模板。看个例子：  
```java
public static void main(String[] args) {
    Calendar c = Calendar.getInstance();
    SimpleDateFormat sm = new SimpleDateFormat("yyyy年MM月dd日 E HH时mm分ss秒");
    System.out.println(sm.format(c.getTime()));
}
```
输出结果：  
2017年05月29日 星期一 20时25分31秒   
上述的代码中，字符串yyyy年MM月dd日 E HH时mm分ss秒就是一个模板pattern，其中：   
![20180507152569819984583.png](https://static.timelovelife.com/20180507152569819984583.png)  
更多的参考信息可以查看JDK API文档,下面给出一个综合实例:  
```java
import java.util.Date;
import java.util.Locale;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
* Created by IntelliJ IDEA.
* User: leizhimin
* Date: 2007-11-30
* Time: 11:20:58
* To change this template use File | Settings | File Templates.
*/
public class TestSimpleDateFormat {
    public static void main(String args[]) throws ParseException {
        TestSimpleDateFormat test = new TestSimpleDateFormat();
        test.testDateFormat();

    }

    public void testDateFormat() throws ParseException {
        //创建日期
        Date date = new Date();

        //创建不同的日期格式
        DateFormat df1 = DateFormat.getInstance();
        DateFormat df2 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss EE");
        DateFormat df3 = DateFormat.getDateInstance(DateFormat.FULL, Locale.CHINA);     //产生一个指定国家指定长度的日期格式，长度不同，显示的日期完整性也不同
        DateFormat df4 = new SimpleDateFormat("yyyy年MM月dd日 hh时mm分ss秒 EE", Locale.CHINA);
        DateFormat df5 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss EEEEEE", Locale.US);
        DateFormat df6 = new SimpleDateFormat("yyyy-MM-dd");
        DateFormat df7 = new SimpleDateFormat("yyyy年MM月dd日");

        //将日期按照不同格式进行输出
        System.out.println("-------将日期按照不同格式进行输出------");
        System.out.println("按照Java默认的日期格式，默认的区域                      : " + df1.format(date));
        System.out.println("按照指定格式 yyyy-MM-dd hh:mm:ss EE ，系统默认区域      :" + df2.format(date));
        System.out.println("按照日期的FULL模式，区域设置为中文                      : " + df3.format(date));
        System.out.println("按照指定格式 yyyy年MM月dd日 hh时mm分ss秒 EE ，区域为中文 : " + df4.format(date));
        System.out.println("按照指定格式 yyyy-MM-dd hh:mm:ss EE ，区域为美国        : " + df5.format(date));
        System.out.println("按照指定格式 yyyy-MM-dd ，系统默认区域                  : " + df6.format(date));

        //将符合该格式的字符串转换为日期，若格式不相配，则会出错
        Date date1 = df1.parse("07-11-30 下午2:32");
        Date date2 = df2.parse("2007-11-30 02:51:07 星期五");
        Date date3 = df3.parse("2007年11月30日 星期五");
        Date date4 = df4.parse("2007年11月30日 02时51分18秒 星期五");
        Date date5 = df5.parse("2007-11-30 02:51:18 Friday");
        Date date6 = df6.parse("2007-11-30");

        System.out.println("-------输出将字符串转换为日期的结果------");
        System.out.println(date1);
        System.out.println(date2);
        System.out.println(date3);
        System.out.println(date4);
        System.out.println(date5);
        System.out.println(date6);
    }
}
```
运行结果:  
-------将日期按照不同格式进行输出------   
按照Java默认的日期格式，默认的区域                      : 07-11-30 下午5:04   
按照指定格式 yyyy-MM-dd hh:mm:ss EE ，系统默认区域      :2007-11-30 05:04:10 星期五   
按照日期的FULL模式，区域设置为中文                      : 2007年11月30日 星期五   
按照指定格式 yyyy年MM月dd日 hh时mm分ss秒 EE ，区域为中文 : 2007年11月30日 05时04分10秒 星期五   
按照指定格式 yyyy-MM-dd hh:mm:ss EE ，区域为美国        : 2007-11-30 05:04:10 Friday   
按照指定格式 yyyy-MM-dd ，系统默认区域                  : 2007-11-30   
-------输出将字符串转换为日期的结果------   
Fri Nov 30 14:32:00 CST 2007   
Fri Nov 30 02:51:07 CST 2007   
Fri Nov 30 00:00:00 CST 2007   
Fri Nov 30 02:51:18 CST 2007   
Fri Nov 30 02:51:18 CST 2007   
Fri Nov 30 00:00:00 CST 2007   

Process finished with exit code 0   

**java.util.Calendar（抽象类）**  
以前我们是可以使用Date来处理日期年月日的，但是由于该类不支持国际化等原因，现在其中大部分方法被注解，不再推荐使用，现在的Date类更像是代表着某一个时刻的对象，而处理年月日的这种转换则完全交给了Calendar类处理。所以Calendar目前是日期时间处理中的核心类，接下来我们看看其中源码：  
```java
//和Date一样封装了毫秒属性
protected long  time;
protected int           fields[];
//封装了十七个静态常量
public final static int ERA = 0;
public final static int YEAR = 1;
public final static int MONTH = 2;
public final static int WEEK_OF_YEAR = 3;
.........
public final static int DST_OFFSET = 16;
```
在Calendar的内部封装了17个静态常量，这些常量将会作为索引用来检索fields属性，例如：fields[YEAR]将返回当前毫秒值对应的日期时间的年份部分，fields[MONTH]将返回的是月份部分的值等等。至于这些值是哪里来的，等我们介绍到后续源码的时候再说明，此处只需要理解这些常量的作用即可。  

该类是抽象类，我们使用工厂方法获取该类实例：  
```java
public static Calendar getInstance()
{
    return createCalendar(TimeZone.getDefault(), Locale.getDefault(Locale.Category.FORMAT));
}

public static Calendar getInstance(TimeZone zone)
{
    return createCalendar(zone, Locale.getDefault(Locale.Category.FORMAT));
}

public static Calendar getInstance(Locale aLocale)
{
    return createCalendar(TimeZone.getDefault(), aLocale);
}

public static Calendar getInstance(TimeZone zone,
                                       Locale aLocale)
{
    return createCalendar(zone, aLocale);
}
```
主要有四个方法用于创建Calendar实例，其实内部调用的是同一的方法只是传入的参数的值不同。创建一个Calend 实例需要两个参数，一个是TimeZone时区，另一个是Locale语言国家。因为每个国家或地区他们表示时间的形式是不一样的，所以我们需要通过这两个参数确定具体需要使用的格式，当然是以本地时间作为fastTime的值的，如果我们没有指定时区和国家语言，那么将会默认使用本机系统信息。接下来我们看如何通过获取到Calendar实例完成对日期时间进行计算。   
我们有获取和设置内部代表毫秒的time属性：  
```java
public final Date getTime() {
    return new Date(getTimeInMillis());
}
public void setTimeInMillis(long millis){

}
```
也有获取上述介绍的17中属性的方法：  
```java
public int get(int field)
{
    complete();
    return internalGet(field);
}
```
其中complete方法就是调用了本地函数完成对fields属性中没有值的元素赋值。 调用internalGet方法其实就是调用的fields[field]，为我们返回指定属性的结果值。我们可以看个例子：  
```java
public static void main(String[] args){
    Calendar calendar = Calendar.getInstance();
    System.out.println(calendar.get(Calendar.YEAR));
    System.out.println(calendar.get(Calendar.MONTH));
    System.out.println(calendar.get(Calendar.AM_PM))
}
```
结果如下:  
![20180507152569930577383.png](https://static.timelovelife.com/20180507152569930577383.png)  
上述代码运行在不同的时候的结果都是不一样的，写作时的时间：2017/5/29 14:02。需要注意一点的是，month属性是从0开始的，也就是0表示一月，4表示5月，星期也是一样。此外，上述中的AM_PM表示的是上下午的概念，上午为0，下午为1。  

**开源第三方库Joda-Time**  
Joda-Time库中的内容还是很多的，我们简单了解下基本的使用即可，至于深入学习该库，大家可以自行尝试，此处限于篇幅，不再赘述。在该库中DateTime相当于jdk中Calendar，主要完成对日期年月日的计算操作。首先我们通过简单易理解的方式创建DateTime的实例对象：  
```java
//2017-05-29 21:40
DateTime dt = new DateTime(2017,5,29,21,40);

//2017-05-29 21:40 50秒
DateTime dt2 = new DateTime(2017,5,29,21,40,50);
```
创建一个日期实例比Calendar中为每个属性set值方便多了。在该库中获取日期的操作被分解了，不像Calendar中共享一个int数组。  
```java  
DateTime dt = new DateTime(2017,5,29,21,40);
System.out.println("year: "+dt.getYear());
System.out.println("month: "+dt.getMonthOfYear());
System.out.println("day: "+dt.getDayOfMonth());
System.out.println("hour: "+dt.getHourOfDay());
System.out.println("minute: "+dt.getMinuteOfHour());
System.out.println("second: "+dt.getSecondOfMinute());
System.out.println("millisecond: " +dt.getMillisOfSecond());
System.out.println("day_of_week: " +dt.getDayOfWeek());
```
我们也可以直接使用DateTime的tostring方法来实现将日期转换成指定pattern的字符串，例如：  
```java
DateTime dt = new DateTime(2017,5,29,21,40);
System.out.println(dt.toString("yyyy-MM-dd HH:mm:ss"));
```
上述代码将会把日期类型按照指定的模板输出，该Joda-Time库中内容很多，此处就简单介绍到这， 感兴趣的同学可以自行研究，该库的核心优势就在于它将很多复杂的操作分解为单个简单操作，这也是我们程序设计中核心的思维方式。  

## 参考
[JAVA的日期类DATE](http://how2j.cn/k/date/date-date/346.html)  
[Java中的日期操作](https://blog.csdn.net/jediael_lu/article/details/43852043)  
[深入理解Java常用类-----时间日期](https://www.cnblogs.com/yangming1996/p/6919191.html)  
[关于 Java 的静态工厂方法，看这一篇就够了!](https://www.jianshu.com/p/ceb5ec8f1174)  
