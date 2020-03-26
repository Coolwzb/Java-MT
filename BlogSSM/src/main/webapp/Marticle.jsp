<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>博客</title>
<link rel="ICON" href="static/image/logo.jpg">
<link rel="SHORTCUT ICON" href="static/image/logo.jpg">
<script type="text/javascript" src="static/js/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="read/css/main.css">
<link rel="stylesheet" href="static/layui/css/layui.css" media="all">
<script src="static/layui/layui.js"></script>
<script src="read/js/blog.js"></script>
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
					<li class="layui-nav-item layui-this"><a href="Marticle.jsp">博客</a></li>
					<li class="layui-nav-item"><a href="alink.jsp">友情链接</a></li>
					<li class="layui-nav-item"><a href="about.jsp">关于</a></li>
				</ul>
				<a href="admin/login.jsp" class="personal pull-left"> <i
					class="layui-icon layui-icon-username"></i>
				</a>
			</div>
			<div class="mobile-nav pull-right" id="mobile-nav">
				<a href="javascript:;"> <i class="layui-icon layui-icon-more"></i>
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





	<div class="container-wrap">
		<div class="container">
			<div class="contar-wrap">
				<h4 class="item-title">
					<p>
						<i class="layui-icon layui-icon-speaker"></i>公告：<span>欢迎光临！</span>
					</p>
				</h4>
				<div class="item">
					<div class="item-box  layer-photos-demo1 layer-photos-demo">
						<h3>
							<a>Redis 性能问题分析</a>
						</h3>
						<h5>
							发布于：<span>刚刚</span>
						</h5>
						<p style="font-size: 20px">Redis的性能基本面：</p>
						<p>&nbsp;&nbsp;&nbsp;首先，Redis
							使用操作系统提供的虚拟内存来存储数据。而且，这个操作系统一般就是指 Unix。Windows 上也能运行
							Redis，但是需要特殊处理。如果你的操作系统使用交换空间，那么 Redis 的数据可能会被实际保存在硬盘上。其次，Redis
							支持持久化，可以把数据保存在硬盘上。很多时候，我们也确实有必要进行持久化来实现备份，数据恢复等需求。但持久化不会凭空发生，它也会占用一部分资源。第三，Redis
							是用 key-value 的方式来读写的，而 value
							中又可以是很多不同种类的数据；更进一步，一个数据类型的底层还有被存储为不同的结构。不同的存储结构决定了数据增删改查的复杂度以及性能开销。最后，在上面的介绍中没有提到的是，Redis
							大多数时候是单线程运行的（single-threaded)，即同一时间只占用一个
							CPU，只能有一个指令在运行，并行读写是不存在的。很多操作带来的延迟问题，都可以在这里找到答案。关于最后这个特性，为什么
							Redis 是单线程的，却能有很好的性能(根据 Amdahl’s
							Law，优化耗时占比大的过程，才更有意义)，两句话概括是：Redis 利用了多路 I/O
							复用机制，处理客户端请求时，不会阻塞主线程；Redis 单纯执行（大多数指令）一个指令不到 1 微秒，如此，单核 CPU
							一秒就能处理 1 百万个指令（大概对应着几十万个请求吧），用不着实现多线程（网络才是瓶颈）。 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:;"class="like"><i class="layui-icon layui-icon-praise"></i><span style="color:blue">点赞</span></a></p>
						<div style="text-align: center">
							<img src="read/images/redis.jpg">
						</div>
					</div>
				</div>
				<div class="item">
					<div class="item-box  layer-photos-demo2 layer-photos-demo">
						<h3>
							<a>洛杉矶湖人</a>
						</h3>
						<h5>
							发布于：<span>刚刚</span>
						</h5>
						<p>
							&nbsp;&nbsp;&nbsp;洛杉矶湖人队（Los Angeles
							Lakers）是一家位于美国加利福尼亚州洛杉矶的篮球俱乐部。球队于1947年成立于明尼阿波利斯，1960年搬迁到了洛杉矶。“湖人”这个名字来源于明尼阿波利斯的别称——千湖之地，指在美国东北五大湖工作或者居住的人。由于球衣颜色的关系，湖人又被称为“紫金军团”。湖人于1948年加入美国职业篮球联赛（NBA）。球队的最大特点是总有巨星跟他们联系在一起。50年代，乔治·迈肯是球队早期主力中锋，在他的带领下，湖人6年间5次夺得总冠军，很快成为了NBA的豪门球队。60年代，在埃尔金·贝勒、杰里·韦斯特、威尔特·张伯伦的带领下，湖人在整个60年代从未缺席过季后赛。1975年，湖人得到“天勾”卡里姆·阿布杜尔-贾巴尔。1979年，湖人选中状元秀“魔术师”埃尔文·约翰逊，他在新秀赛季便带领球队夺冠并当选FMVP，同时和贾巴尔一起在80年代先后夺得了5次总冠军。
							1996年夏天，湖人签下“大鲨鱼”沙奎尔·奥尼尔，并交易得到了新秀科比·布莱恩特，两人组成了“OK组合”，带领湖人于2000-02年取得三连冠。
							2007年，保罗·加索尔加盟湖人。球队又于2008-10年三度进入总决赛并两度夺冠。2016年4月，湖人传奇球员科比宣布退役。
							2018年7月2日，勒布朗·詹姆斯宣布加盟湖人。2019年6月16日，湖人交易得到了安东尼·戴维斯。
							截至2019-20赛季，湖人队史共56次进入季后赛，31次获得西部冠军、16次获得总冠军，仅次于波士顿凯尔特人队（17次）；常规赛最高连胜纪录为33场（NBA历史最高）。')<br>
							&nbsp;&nbsp;&nbsp;在19-20赛季，湖人如今位列西部第一，高居联盟第二，这赛季湖人一路高歌猛进，有很大几率获得球队的第17座总冠军。
						 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:;"class="like"><i class="layui-icon layui-icon-praise"></i><span style="color:blue">点赞</span></a></p>
						<div style="text-align: center">
							<img src="read/images/Los.jpg">&nbsp;&nbsp;<img
								src="read/images/james.jpg" style="width: 140px; height: 140px">
						</div>
					</div>
				</div>
				<div class="item">
					<div class="item-box  layer-photos-demo3 layer-photos-demo">
						<h3>
							<a>Spring Boot、Spring MVC 和 Spring 有什么区别？</a>
						</h3>
						<h5>
							发布于：<span>刚刚</span>
						</h5>
						<p><b>&nbsp;&nbsp;&nbsp;Spring 框架就像一个家族，有众多衍生产品例如
						   boot、security、jpa等等。</b>但他们的基础都是Spring 的ioc和 aop，ioc 提供了依赖注入的容器，
							aop解决了面向横切面的编程，然后在此两者的基础上实现了其他延伸产品的高级功能。<br>
							<b>&nbsp;&nbsp;&nbsp;SpringMVC提供了一种轻度耦合的方式来开发web应用。它是Spring的一个模块，是一个web框架。</b>通过DispatcherServlet, ModelAndView 和 ViewResolver，开发web应用变得很容易。解决的问题领域是网站应用程序或者服务开发——URL路由、Session、模板引擎、静态Web资源等等。<br>
							<b>&nbsp;&nbsp;&nbsp;SpringBoot实现了自动配置，降低了项目搭建的复杂度。</b>它主要是为了解决使用Spring框架需要进行大量的配置太麻烦的问题，所以它并不是用来替代Spring的解决方案，而是和Spring框架紧密结合用于提升Spring开发者体验的工具。同时它集成了大量常用的第三方库配置(例如Jackson,
							JDBC, Mongo, Redis, Mail等等)，SpringBoot应用中这些第三方库几乎可以零配置的开箱即用(out-of-the-box)。<br>
							 &nbsp;&nbsp;&nbsp;所以，用最简练的语言概括就是: Spring是一个“引擎”; Spring MVC 是基于Spring的一个 MVC 框架; Spring Boot是基于Spring4的条件注册的一套快速开发整合包。  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:;"class="like"><i class="layui-icon layui-icon-praise"></i><span style="color:blue">点赞</span></a></p>
						<div style="text-align: center"><img src="read/images/spring.jpg" style="width: 300px; height: 300px"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="footer">
		<p>
			<span>&copy; 2018</span> <span><a href="http://www.layui.com"
				target="_blank">layui.com</a></span> <span>MIT license</span>
		</p>
		<p>
			<span>人生就是一场修行</span>
		</p>
	</div>
</body>
</html>