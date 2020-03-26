<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>关于我</title>
<link rel="ICON" href="static/image/logo.jpg">
<link rel="SHORTCUT ICON" href="static/image/logo.jpg">
<script type="text/javascript" src="static/js/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="read/css/main.css">
<link rel="stylesheet" href="read/css/font-awesome.min.css"/>
<link href="read/css/about.css" rel="stylesheet"/>
<link rel="stylesheet" href="static/layui/css/layui.css" media="all">
<script src="static/layui/layui.js"></script>
<script type="text/javascript">
			$(document).on("click","#audio_btn",function() {
					var music = document.getElementById("music");
					if(music.paused) {
						music.play();
						$("#music_btn").attr("src", "read/music/play.png");
					} else {
						music.pause();
						$("#music_btn").attr("src", "read/music/pause.png");
					}
				});
		</script>
</head>
<body class="lay-blog">
		<div class="header">
			<div class="header-wrap">
				<h1 class="logo pull-left">
						<a href="javascript:void(0)" class="header-logo" id="logo">Mr.Wang</a>
				</h1>
				<div class="blog-nav pull-right">
					<ul class="layui-nav pull-left">
					  <li class="layui-nav-item"><a href="mainTemp.jsp">首页</a></li>
					  <li class="layui-nav-item"><a href="Marticle.jsp">博客</a></li>
					  <li class="layui-nav-item"><a href="alink.jsp">友情链接</a></li>
					  <li class="layui-nav-item layui-this"><a href="about.jsp">关于</a></li>
					</ul>
					<a href="admin/login.jsp" class="personal pull-left">
						<i class="layui-icon layui-icon-username"></i>
					</a>
				</div>
				<div class="mobile-nav pull-right" id="mobile-nav">
					<a href="javascript:;">
						<i class="layui-icon layui-icon-more"></i>
					</a>
				</div>
			</div>
			<ul class="pop-nav" id="pop-nav">
				<li><a href="mainTemp.jsp">首页</a></li>
				<li><a href="Marticle.jsp">博客</a></li>
				<li><a href="alink.jsp">友情链接</a></li>
				<li><a href="about.jsp">关于</a></li>
			</ul>
		</div>
		
		<div class="doc-container animated fadeIn" id="doc-container">
    <div class="container-fixed">
         <blockquote class="layui-elem-quote sitemap">
            <i class="layui-icon"></i>
            <span class="layui-breadcrumb" lay-separator=">" style="visibility: visible;">
            </span>
        </blockquote>
        <!--中间内容-->
        <div class="container-inner">
            <article>
                <!--关于我-->
                <section>
                    <h1>关于我  
      <audio id="music" src="static/music/Sold.mp3" autoplay="autoplay" loop="loop"></audio>
		<a id="audio_btn"><img src="read/music/play.png" width="20" height="22" id="music_btn" border="0"></a>
                    </h1>
                    <div class="message-tips">
                        <h2>概况</h2>
                        <ul>
                            <li>
                                <p>
                                    对IT感兴趣，喜欢上Java开发，对Java的技术有所了解，沉迷于敲代码，乐于学习新技术。
                                </p>
                            </li>
                        </ul>
                        <h2>联系</h2>
                        <ul>
                            <li>
                                <p>邮&nbsp;箱 ：<a>970291791@qq.com</a>
                                </p>
                                <p>Q&nbsp;&nbsp;Q ：<a> 970291791</a></p>
                                <p>微&nbsp;信：<a>想认识我的可以找我要。嘻嘻......</a></p>
                            </li>
                        </ul>
                    </div>
                </section>
                <!--关于本站-->
                <section>
                    <h1>关于本站</h1>
                    <div class="message-tips">
                        <h2>说明</h2>
                        <ul>
                            <li>
                                <p>本网站主要为了记录个人学习内容、以及技术、资源的分享等。前端参考过几个开源模板，然后进行修改开发，自我感觉效果还可以。嘻嘻......<strong
                                        style="font-size: 10px;"></strong>
                                </p>
                            </li>
                        </ul>
                        <h2>结构</h2>
                        <ul>
                            <li>
                                <p>前&nbsp;&nbsp;&nbsp;端 ：<code>LayUI</code></p>
                                <p>后&nbsp;&nbsp;&nbsp;端 ：<code>Spring + SpringMVC + Mybatis + Mysql + druid + shiro</code>
                                </p>
                                <p>服务器 ：<code>Tomcat</code></p>
                            </li>
                        </ul>
                    </div>
                </section>
                 <section>
		<br ><br >
                <div>
                    <img src="read/images/per.jpg" style="width:100%;height:600px;">
                </div>
            </section>
                
            </article>
        </div>
    </div>
</div>
	
</body>
</html>