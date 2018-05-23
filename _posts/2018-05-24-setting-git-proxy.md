---
layout: post
title: "设置git走ssr(socks5)代理"
description: "set git using ssr proxy"
date: 2018-05-24
tags: gist 
comments: true
---

## Setting proxy
if socks5(SSR)  
first, you need to know you local socks5 proxy ip address and port.  
eg. 127.0.0.1 port 1086  
then use this command to set proxy  
```
git config --global http.proxy socks5h://127.0.0.1:1080
```

if http/https  
use this command:  
```
git config --global https.proxy http://127.0.0.1:1080

git config --global https.proxy https://127.0.0.1:1080
```

## To unset proxys
```
git config --global --unset http.proxy

git config --global --unset https.proxy
```

