---
author: liqimore
comments: true
date: 2015-03-21 22:29:00+00:00
layout: post
link: http://blog.codefog.com/test-mweb-html.html
slug: test-mweb-html
title: testing for wordpress publishing
wordpress_id: 471
categories:
- 生活点滴
---

## Markdown syntax guide and writing on MWeb





## Philosophy





<blockquote>

> 
> Markdown is intended to be as easy-to-read and easy-to-write as is feasible.  

Readability, however, is emphasized above all else. A Markdown-formatted document should be publishable as-is, as plain text, without looking like it's been marked up with tags or formatting instructions.  

Markdown's syntax is intended for one purpose: to be used as a format for _writing_ for the web.
> 
> 
</blockquote>



<!-- more -->



## Notice





You can use  `CMD + R` to preview the result.





## Headers





**Example:**




    
    <code># This is an `<h1>` tag
    ## This is an `<h2>` tag
    ###### This is an `<h6>` tag
    </code>





**Result:**





# This is an `<h1>` tag





## This is an `<h2>` tag





###### This is an `<h6>` tag





## Emphasis





**Example:**




    
    <code>*This text will be italic*
    _This will also be italic_
    
    **This text will be bold**
    __This will also be bold__
    
    *You **can** combine them*
    </code>





**Shortcuts:**  `CMD + U`、`CMD + I`、`CMD + B`  

**Result:**





_This text will be italic_  

_This will also be italic_





**This text will be bold**  

**This will also be bold**





*You **can** combine them*





## Newlines





End a line with two or more spaces + enter.  

Just typing enter to newline,please set：`Preferences` - `Themes` - `Translate newlines to <br> tags`  enable ( default is enable )





## Lists





### Unordered





**Example:**




    
    <code>* Item 1 unordered list `* + SPACE`
    * Item 2
        * Item 2a unordered list `TAB + * + SPACE`
        * Item 2b
    </code>





**Shortcuts:**  `Option + U`  

**Result:**







  * Item 1 unordered list `* + SPACE`


  * Item 2



    * Item 2a unordered list `TAB + * + SPACE`


    * Item 2b







### Ordered





**Example:**




    
    <code>1. Item 1 ordered list `Number + . + SPACE`
    2. Item 2 
    3. Item 3
        1. Item 3a ordered list `TAB + Number + . + SPACE`
        2. Item 3b
    </code>





**Result:**







  1. Item 1 ordered list `Number + . + SPACE`


  2. Item 2 


  3. Item 3



    1. Item 3a ordered list `TAB + Number + . + SPACE`


    2. Item 3b







### Task lists





**Example:**




    
    <code>- [ ] task one not finish `- + SPACE + [ ]`
    - [x] task two finished `- + SPACE + [x]`
    </code>





**Result:**







  * task one not finish `- + SPACE + [ ]`



  * task two finished `- + SPACE + [x]`






## Images





**Example:**




    
    <code>![GitHub set up](https://help.github.com/assets/images/site/set-up-git.gif)
    Format: ![Alt Text](url)
    </code>





**Shortcuts:**  `Control + Shift + I`  

The Library's document support drag & drop or `CMD + V` paste or `CMD + Option + I` to insert  the pictrue.  

**Result:**





![GitHub set up](https://help.github.com/assets/images/site/set-up-git.gif)





## Links





**Example:**




    
    <code>email <example@example.com>
    [GitHub](http://github.com)
    autolink  <http://www.github.com/>
    </code>





**Shortcuts:**  `Control + Shift + L`  

The Library's document support drag & drop or `CMD + Option + I` to insert attachment.  

**Result:**





An email [example@example.com](mailto:example@example.com) link.  

[GitHub](http://github.com)  

Automatic linking for URLs  

Any URL (like [http://www.github.com/](http://www.github.com/)) will be automatically converted into a clickable link.





## Blockquotes





**Example:**




    
    <code>As Kanye West said:
    > We're living the future so
    > the present is our past.
    </code>





**Shortcuts:**  `CMD + Shift + B`  

**Result:**





As Kanye West said:





<blockquote>

> 
> We're living the future so  

the present is our past.
> 
> 
</blockquote>





## Inline code





**Example:**




    
    <code>I think you should use an
    `<addr>` `code` element here instead.
    </code>





**Shortcuts:**  `CMD + K`  

**Result:**





I think you should use an  

`<addr>` `code` element here instead.





## Multi-line code





**Example:**




    
    <code>```js
    function fancyAlert(arg) {
      if(arg) {
        $.facebox({div:'#foo'})
      }
    
    }
    ```
    </code>





**Shortcuts:**  `CMD + Shift + K`  

**Result:**




    
    <code class="language-js">function fancyAlert(arg) {
      if(arg) {
        $.facebox({div:'#foo'})
      }
    
    }
    </code>





## Sequence and Flow chart





**Example:**




    
    <code>```sequence
    张三->李四: 嘿，小四儿, 写博客了没?
    Note right of 李四: 李四愣了一下，说：
    李四-->张三: 忙得吐血，哪有时间写。
    ```
    
    ```flow
    st=>start: 开始
    e=>end: 结束
    op=>operation: 我的操作
    cond=>condition: 确认？
    
    st->op->cond
    cond(yes)->e
    cond(no)->op
    ```
    </code>





**Result:** ( Please enable  `Preferences` - `Themes` - `Enable sequence & flow chart`, default is enable. )




    
    <code class="language-sequence">张三->李四: 嘿，小四儿, 写博客了没?
    Note right of 李四: 李四愣了一下，说：
    李四-->张三: 忙得吐血，哪有时间写。
    </code>




    
    <code class="language-flow">st=>start: 开始
    e=>end: 结束
    op=>operation: 我的操作
    cond=>condition: 确认？
    
    st->op->cond
    cond(yes)->e
    cond(no)->op
    </code>





More info: [http://bramp.github.io/js-sequence-diagrams/](http://bramp.github.io/js-sequence-diagrams/), [http://adrai.github.io/flowchart.js/](http://adrai.github.io/flowchart.js/)





## Tables





**Example:**




    
    <code>First Header | Second Header
    ------------ | -------------
    Content from cell 1 | Content from cell 2
    Content in the first column | Content in the second column
    </code>





You can create tables by assembling a list of words and dividing them with hyphens - (for the first row), and then separating each column with a pipe |:





**Result:**



<table >

<tr >
First Header
Second Header
</tr>


<tbody >
<tr >

<td >Content from cell 1
</td>

<td >Content from cell 2
</td>
</tr>
<tr >

<td >Content in the first column
</td>

<td >Content in the second column
</td>
</tr>
</tbody>
</table>



## Strikethrough





**Example:**




    
    <code> (like ~~this~~)
    </code>





**Result:**





Any word wrapped with two tildes (like <del>this</del>) will appear crossed out.





## Horizontal Rules





Following lines will produce a horizontal rule:




    
    <code>***
    
    *****
    
    - - -
    </code>





**Result:**





* * *





* * *





* * *





## MathJax





Use double US dollors sign pair for Block level Math formula, and one US dollor sign pair for Inline Level.




    
    <code>For example this is a Block level $$x = {-b \pm \sqrt{b^2-4ac} \over 2a}$$ formula, and this is an inline Level $x = {-b \pm \sqrt{b^2-4ac} \over 2a}$ formula.
    
    \\[ \frac{1}{\Bigl(\sqrt{\phi \sqrt{5}}-\phi\Bigr) e^{\frac25 \pi}} =
    1+\frac{e^{-2\pi}} {1+\frac{e^{-4\pi}} {1+\frac{e^{-6\pi}}
    {1+\frac{e^{-8\pi}} {1+\ldots} } } } \\]
    
    </code>





**Result:**





For example this is a Block level \[x = {-b \pm \sqrt{b^2-4ac} \over 2a}\] formula, and this is an inline Level \(x = {-b \pm \sqrt{b^2-4ac} \over 2a}\) formula.





\[ \frac{1}{\Bigl(\sqrt{\phi \sqrt{5}}-\phi\Bigr) e^{\frac25 \pi}} =  

1+\frac{e^{-2\pi}} {1+\frac{e^{-4\pi}} {1+\frac{e^{-6\pi}}  

{1+\frac{e^{-8\pi}} {1+\ldots} } } } \]





## Footnote





**Example:**




    
    <code>This is a footnote:[^sample_footnote]
    </code>





**Result:**





This is a footnote:1





## Comment And Read More..





<!-- more -->



Actions->Insert Read More Comment _OR_ `CMD + .`





## TOC





**Example:**




    
    <code>[TOC]
    </code>





**Result:**







  * 
Markdown syntax guide and writing on MWeb



  * 
Philosophy



  * 
Notice



  * 
Headers






* 
This is an `<h1>` tag




  * 
This is an `<h2>` tag


    * 


      * 


        * 


          * 
This is an `<h6>` tag















  * 
Emphasis



  * 
Newlines



  * 
Lists


    * 
Unordered



    * 
Ordered



    * 
Task lists






  * 
Images



  * 
Links



  * 
Blockquotes



  * 
Inline code



  * 
Multi-line code



  * 
Sequence and Flow chart



  * 
Tables



  * 
Strikethrough



  * 
Horizontal Rules



  * 
MathJax



  * 
Footnote



  * 
Comment And Read More..



  * 
TOC










* * *







  1. 


footnote text detail... ↩







