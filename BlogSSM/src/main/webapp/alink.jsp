<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>友情链接</title>
<link rel="ICON" href="static/image/logo.jpg">
<link rel="SHORTCUT ICON" href="static/image/logo.jpg">
<script type="text/javascript" src="static/js/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="read/css/main.css">
<link rel="stylesheet" href="read/css/font-awesome.min.css"/>
<link href="read/css/about.css" rel="stylesheet"/>
<link rel="stylesheet" href="static/layui/css/layui.css" media="all">
<script src="static/layui/layui.js"></script>
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
					  <li class="layui-nav-item layui-this"><a href="alink.jsp">友情链接</a></li>
					  <li class="layui-nav-item"><a href="about.jsp">关于</a></li>
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
        <div class="container-inner">
        <blockquote class="layui-elem-quote sitemap">
            <i class="layui-icon"></i>
            <span class="layui-breadcrumb" lay-separator=">" style="visibility: visible;">
            </span>
        </blockquote>
            <!--友链申请说明-->
            <article>
                <section>
                    <div class="message-tips">
                        <h1>链接说明</h1>
                        <p>
                            <i></i><strong>学习类</strong>&nbsp;
                            <i></i><strong>IT科技</strong>&nbsp;
                            <i></i><strong>音乐类</strong>&nbsp;
                            <i></i><strong>体育类</strong>&nbsp;
                        </p>
                        <blockquote>
                            <p style="word-wrap:break-word;word-break:break-all;white-space: normal">
                                本网站博主名：LBJ·Bin<br>
                                描述：LBJ·Bin|学习新知识，交流新技术。
                            </p>
                             <p><i class="layui-icon layui-icon-speaker"></i>公告：<span>以下链接可点击查看其详情</span><img src="read/images/hand.jpg" style="width: 20px; height: 20px"></p>
                        </blockquote>
                    </div>
                </section>
            </article>
            <!--友链-->
            <ul class="link-list">
                <li>
                    <div class="pd-lr-10">
                        <a href="https://www.icourse163.org/" target="_blank">
                            <img src="read/images/MOOC.jpg">
                            <h3>中国大学MOOC</h3>
                            <p>千所中国高校，近万课程资源</p>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="pd-lr-10">
                        <a href="https://www.imooc.com/" target="_blank">
                            <img src="read/images/imooc.jpg">
                            <h3>慕课网</h3>
                            <p>慕课网，程序员的工厂</p>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="pd-lr-10">
                        <a href="https://www.layui.com/doc/element/form.html" target="_blank">
                            <img src="read/images/layui.png">
                            <h3>Layui文档</h3>
                            <p>前端框架，适合界面的快速开发</p>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="pd-lr-10">
                        <a href="https://www.lzhpo.com" target="_blank">
                            <img src="https://lzhpo-images.lzhpo.com/aboutme/tx.jpg">
                            <h3>会打篮球的程序猿</h3>
                            <p>一个程序员的原创博客</p>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="pd-lr-10">
                        <a href="https://ai.163.com/#/m/overview" target="_blank">
                            <img src="read/images/ai.jpg">
                            <h3>网易人工智能</h3>
                            <p>基于AI能力，提供全新产品服务体验</p>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="pd-lr-10">
                        <a href="https://sports.qq.com/nba/" target="_blank">
                            <img src="read/images/nba.jpg">
                            <h3>腾讯NBA</h3>
                            <p>NBA中国数字媒体合作伙伴</p>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="pd-lr-10">
                        <a href="https://weibo.com/u/1749224837?from=myfollow_all&is_all=1" target="_blank">
                            <img src="read/images/it.jpg">
                            <h3>IT工程师</h3>
                            <p>新浪微博知名科技博主</p>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="pd-lr-10">
                        <a href="https://weibo.com/u/5979001958?from=myfollow_all&is_all=1" target="_blank">
                            <img src="read/images/lal.jpg">
                            <h3>湖人最前线</h3>
                            <p>知名体育博主 体育视频自媒体</p>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="pd-lr-10">
                        <a href="https://www.arcinbj.com/" target="_blank">
                            <img src="https://www.arcinbj.com/avatar">
                            <h3>在码圈</h3>
                            <p>代码改变未来，努力codeing</p>
                        </a>
                    </div>
                </li>
                 <li>
                    <div class="pd-lr-10">
                        <a href="http://www.jiangxindc.com" target="_blank">
                            <img src="http://www.jiangxindc.com/favicon.ico">
                            <h3>AiLinkLif</h3>
                            <p>Java教程博客，人工智能技术博客，分享技术，分享生活，分享资料</p>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="pd-lr-10">
                        <a href="https://music.163.com/" target="_blank">
                            <img src="read/images/wangyi.jpg">
                            <h3>网易云音乐</h3>
                            <p>网易云音乐，享受无限的乐趣</p>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="pd-lr-10">
                        <a href="https://github.com/" target="_blank">
                            <img src="read/images/github.jpg">
                            <h3>GitHub</h3>
                            <p>GitHub,程序员的代码库</p>
                        </a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>