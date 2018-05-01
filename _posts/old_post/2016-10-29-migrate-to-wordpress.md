---
author: liqimore
comments: true
date: 2016-10-29 14:08:13+00:00
layout: post
link: http://blog.codefog.com/migrate-to-wordpress.html
slug: migrate-to-wordpress
title: 博客转为WP,并且取消https,开启了Memcached
wordpress_id: 91
categories:
- 生活点滴
---

使用typecho也有2年了,可以说它肯定是一个稳定的,值得使用的blog程序,但是官方支持太少了,论坛活跃度也差WP太多,各大管理员都几年不上线,版本从14年发布1.0后就停止了.貌似写typecho的都是SF的co-founder,可能工作太忙吧.耐不住性子的我最终决定转回WP去.

<!-- more -->


## 一.从Typecho转移到WordPress


当初从WP转到te的时候,使用了一个叫做WordPress to typecho的工具,而从WP到TE的工具叫做TypExport(https://github.com/panxianhai/TypExport),将TE的评论,文章,分类目录,独立页面全部导出为WXR的WordPress专用XML文件.但是没有图片以及其他附件,当你将WXR文件导入到WP时,附件会自动从你的TE博客上下载(我的下载失败了,不过这不是问题,请看下文).

如果你的附件下载成功,那么恭喜你.如果不成功,不要急.你需要把你的TE附件单独上传到一个虚拟主机内,并做好解析.比如我把老的te程序解析到了old.timelovelife.com上.之后再那个XML文件内,把所有附件的链接修改成old.XXX.com/xxx.jpg即可.WP虽然没有附件在upload文件夹内,但是依然在你的服务器内.

此方法支持TE1.0版本和WP4.6+,亲测.


## 二.数据在导入WP后保持旧的链接不变


在te中,我设置的是XXX.com/postname.html的固定链接,在导入wp后,只需要同样的设置成这样就好,WXR文件会将你的旧链接同样导入到WP里面去.把固定链接的方式完全按照TE的设置,非常的方便.


## 三.加速WordPress访问,减少服务器负载


我使用的是阿里云1G1核的服务器,系统是CentOS7.2,说实话,这个配置确实有点低,我跑了几个程序就感觉很吃力了,内存基本上处于满的状态.

所以,这次我完全重装了环境,使用了Oneinstack(https://oneinstack.com/)的一键包,能省非常多的时间,虽然我支持在某些时候自己造轮子,但是重复的劳动真的不如省时省力的强.安装了PHP5.6用来跑其他除了WP之外的其他PHP程序,HHVM专门给WP装的,Mysql这个不用说数据库,Nginx用的顺手,并且比apache性能好不少.

开启memcached,用来加速WP,同时安装了WP Super Cache插件,静态化网站.就获得了现在这样的速度,你在访问时候也可以感受到,确实速度很快.

下图是memcached的探针,由于刚安装不就,所以miss的还是有些多,但是可以看到,提升效果很明显,mysql压力瞬间减少.

![memcached](https://static.timelovelife.com/old/2016/10/memcached.jpg)

下图是我的WP插件,装的不多不少,再加个友情链接的插件就基本上定型了.

![plugin](https://static.timelovelife.com/old/2016/10/plugin.jpg)


## 四.关闭https,换成http


虽然说国内的各大搜索引擎开始支持https并且提高https的权重(百度),但是我国广大用户还是对这个不敏感,我博客也没什么违法违纪的文章,简单的技术生活博客而已,没什么见不得人的事情,所以就去掉了,还能加速打开,但是不能保证之后不会再添加...


## 五.Typecho遗留问题


如果你发现我发布的某些资源不能下载了,不要着急,你要的资源会在http://file.jrlab.win/ 或者 http://file.jrlab.net/ 找到,我会尽量把附件放在本站外,所以即使博客挂了也不会影响.

我制作的Typecho主题预览就不再提供了,需要预览请自行下载,反正都不大.

友情链接我会逐步恢复,请大家稍安勿躁,这次采用内页链接(没什么打影响的),在博客上方提示条小时候如果还找不到你的链接,请你联系我,我会及时补上.


##### 如果你有什么相关问题不理解的话可以在本页面留言,我会尽量帮助你的.
