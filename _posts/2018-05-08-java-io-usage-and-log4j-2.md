---
layout: post
title: "java中的I/O操作详解和log4j的基本使用 - 2(Log4j)"
description: "接上一篇文章,篇幅太长,分成两篇.中英文混合."
date: 2018-05-08
tags: java, 秋招准备
comments: true
---

## Features
1. It is thread-safe.
2. It is optimized for speed.
3. It is based on a named logger hierarchy.
4. It supports multiple output appenders per logger.
5. It supports internationalization.
6. It is not restricted to a predefined set of facilities.
7. Logging behavior can be set at runtime using a configuration file.
8. It is designed to handle Java Exceptions from the start.
9. It uses multiple levels, namely ALL, TRACE, DEBUG, INFO, WARN, ERROR and FATAL.
10. The format of the log output can be easily changed by extending the Layout class.
11. The target of the log output as well as the writing strategy can be altered by implementations of the Appender interface.
12. It is fail-stop. However, although it certainly strives to ensure delivery, log4j does not guarantee that each log statement will be delivered to its destination.

## Architecture
![20180508152578887758452.png](https://static.timelovelife.com/20180508152578887758452.png)  
Applications using the Log4j 2 API will **request a Logger with a specific name from the LogManager**. The LogManager will locate the appropriate LoggerContext and then obtain the Logger from it. If the Logger must be created it will be associated with the LoggerConfig that contains either a) the same name as the Logger, b) the name of a parent package, or c) the root LoggerConfig. LoggerConfig objects are created from Logger declarations in the configuration. The LoggerConfig is associated with the Appenders that actually deliver the LogEvents.    

## Configuration
The **log4j.properties** file is a log4j configuration file which keeps properties in key-value pairs. By default, the **LogManager** looks for a file named log4j.properties in the **CLASSPATH**.   



## Simple Usage
**Hello World**  
```java
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class HelloWorld {
    private static final Logger logger = LogManager.getLogger("HelloWorld");
    public static void main(String[] args) {
        logger.info("Hello, World!");
    }
}
```

**log4j.properties Syntax:**  
```
# Define the root logger with appender X
log4j.rootLogger = DEBUG, X

# Set the appender named X to be a File appender
log4j.appender.X=org.apache.log4j.FileAppender

# Define the layout for X appender
log4j.appender.X.layout=org.apache.log4j.PatternLayout
log4j.appender.X.layout.conversionPattern=%m%n
```
**log4j.properties Example**   
Using the above syntax, we define the following in log4j.properties file:

1. The level of the root logger is defined as DEBUG, The DEBUG appender named FILE to it.

2. The appender FILE is defined as org.apache.log4j.FileAppender. It writes to a file named log.out located in the log directory.

3. The layout pattern defined is %m%n, which means the printed logging message will be followed by a newline character.
```
# Define the root logger with appender file
log4j.rootLogger = DEBUG, FILE

# Define the file appender
log4j.appender.FILE=org.apache.log4j.FileAppender
log4j.appender.FILE.File=${log}/log.out

# Define the layout for file appender
log4j.appender.FILE.layout=org.apache.log4j.PatternLayout
log4j.appender.FILE.layout.conversionPattern=%m%n
```

## More info
Log4j can save log file into file or db or just print it out.   
For later reference, you can check this [Quick Guide](https://www.tutorialspoint.com/log4j/log4j_quick_guide.htm)   




## Reference
[log4j Tutorial](https://www.tutorialspoint.com/log4j/index.htm) | pretty useful website for self-learner    
[Apache Log4j 2 Offical Site](https://logging.apache.org/log4j/2.x/index.html)  
