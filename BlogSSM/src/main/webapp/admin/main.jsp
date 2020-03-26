<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>博客管理系统</title>
<link rel="ICON" href="../static/image/James.jpg">
<script type="text/javascript" src="../static/js/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="../static/layui/css/layui.css" media="all">
<link rel="stylesheet" href="../static/css/index.css">
<link href="../static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="../static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../static/js/Weather.js"></script>
<script type="text/javascript" src="../static/layui/layui.js"></script>
<script type="text/javascript">
	layui.use('element', function() {
		var element = layui.element;

	});

	layui.use('element', function() {
		var element = layui.element;
		var active = {
			tabAdd : function(url, id, name) {
				element.tabAdd('contentnav', {
					title : name,
					content : '<iframe data-frameid="' + id
							+ '" scrolling="auto" frameborder="0" src="' + url
							+ '" style="width:100%;"></iframe>',
					id : id
				});
				rightMenu();
				iframeWH();
			},
			tabChange : function(id) {
				element.tabChange('contentnav', id);
			},
			tabDelete : function(id) {
				element.tabDelete('contentnav', id);
			},
			tabDeleteAll : function(ids) {
				$.each(ids, function(index, item) {
					element.tabDelete('contentnav', item);
				});
			}
		};
		$(".site-url").on(
				'click',
				function() {
					var nav = $(this);
					var length = $("ul.layui-tab-title li").length;
					if (length <= 0) {
						active.tabAdd(nav.attr("data-url"),
								nav.attr("data-id"), nav.attr("data-title"));
					} else {
						var isData = false;
						$.each($("ul.layui-tab-title li"), function() {
							if ($(this).attr("lay-id") == nav.attr("data-id")) {
								isData = true;
							}
						});
						if (isData == false) {
							active.tabAdd(nav.attr("data-url"), nav
									.attr("data-id"), nav.attr("data-title"));
						}
						active.tabChange(nav.attr("data-id"));
					}
				});
		function rightMenu() {
			//右击弹出
			$(".layui-tab-title li").on('contextmenu', function(e) {
				var menu = $(".rightmenu");
				menu.find("li").attr('data-id', $(this).attr("lay-id"));
				l = e.clientX;
				t = e.clientY;
				menu.css({
					left : l,
					top : t
				}).show();
				return false;
			});
			//左键点击隐藏
			$("body,.layui-tab-title li").click(function() {
				$(".rightmenu").hide();
			});
		}
		$(".rightmenu li").click(function() {
			if ($(this).attr("data-type") == "closethis") {
				active.tabDelete($(this).attr("data-id"));
			} else if ($(this).attr("data-type") == "closeall") {
				var tabtitle = $(".layui-tab-title li");
				var ids = new Array();
				tabtitle.each(function(i) {
					ids.push($(this).attr("lay-id"));
				});
				//如果关闭所有 ，即将所有的lay-id放进数组，执行tabDeleteAll
				active.tabDeleteAll(ids);
			}
			$('.rightmenu').hide(); //最后再隐藏右键菜单
		});
		function iframeWH() {
			var H = $(window).height() - 80;
			$("iframe").css("height", H + "px");
		}
		$(window).resize(function() {
			iframeWH();
		});
	})

	/*刷新后台页面*/
	function reloadPage() {
		window.location.reload()
	}
	
	/*退出系统*/
	$(document).on("click", "#logout", function() {
		var msg = "您确定要退出系统吗？";
		if (confirm(msg) == true) {
			window.location.href = "login.jsp";

		}
	});

	/*music*/
	$(document).on("click", "#audio_btn", function() {
		var music = document.getElementById("music");
		if (music.paused) {
			music.play();
			$("#music_btn").attr("class", "glyphicon glyphicon-volume-down");
		} else {
			music.pause();
			$("#music_btn").attr("class", "glyphicon glyphicon-volume-off");
		}
	});
</script>

</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">
				博客管理系统
				<audio id="music" src="../static/music/少年.mp3" autoplay="autoplay"
					loop="loop"></audio>
				<a id="audio_btn"><i class="glyphicon glyphicon-volume-down"
					width="15" height="18" id="music_btn"></i></a>
			</div>
			<nav class="layui-layout-left">
			<ul class="layui-inline layui-nav layui-nav-switch"
				style="padding: 0;">
				<!--当前城市天气-->
				<li class="layui-nav-item layui-hide-xs">
					<div class="weather">
						<div id="tp-weather-widget" title="城市天气温度">
							<p class="pre">城市天气温度</p>
						</div>
					</div>
				</li>
				<li class="layui-nav-item"><a href="javascript:;" type="button"
					value="Reload page" onclick="reloadPage()" title="刷新后台页面"><i
						class="layui-icon layui-icon-refresh"></i></a></li>
			</ul>
			</nav>
			<nav class="layui-layout-right">
			<ul class="layui-nav">
				<li class="layui-nav-item layui-hide-xs"><a
					href="javascript:void();"> <img src="../static/image/James.jpg"
						class="layui-nav-img userAvatar" width="35" height="35" /> <cite
						class="adminName">${param.name}</cite>
				</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="javascript:;" class="site-url" data-id="1"
								data-title="个人资料" data-url="badmin.jsp"><img
								src="../static/image/admin.png"
								style="width: 18px; height: 18px"><span>个人资料</span></a>
						</dd>
						<dd>
							<a href="javascript:;" id="logout"><img
								src="../static/image/logout.png"
								style="width: 18px; height: 18px"><span>退&nbsp;&nbsp;&nbsp;&nbsp;出</span></a>
						</dd>
					</dl></li>
				<li class="layui-nav-item"><a
					href="javascript:location.href='../mainTemp.jsp'">前台首页</a></li>
			</ul>
			</nav>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<li class="layui-nav-item layui-this"><a href="javascript:;"
						class="site-url" data-id="2" data-title="首页"
						data-url="welcome.jsp"><i class="glyphicon glyphicon-home"></i><span>首页</span></a>
					</li>
					<li class="layui-nav-item"><a href="javascript:;"><i
							class="glyphicon glyphicon-file"></i><span>博客管理</span></a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;" class="site-url" data-id="3"
									data-title="文章管理" data-url="article.jsp">文章管理</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;"><i
							class="glyphicon glyphicon-list"></i><span>博客类别管理</span></a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;" class="site-url" data-id="4"
									data-title="类别信息管理" data-url="blogTypeManage.jsp">类别信息管理</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;"><i
							class="glyphicon glyphicon-user"></i><span>管理员管理</span></a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;" class="site-url" data-id="5"
									data-title="用户管理" data-url="pmessage.jsp">用户管理</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;"><i
							class="glyphicon glyphicon-link"></i><span>友情链接管理</span></a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;" class="site-url" data-id="6"
									data-title="链接管理" data-url="link.jsp">链接管理</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;"><i
							class="glyphicon glyphicon-bell"></i><span>评论管理</span></a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;" class="site-url" data-id="7"
									data-title="评论信息管理" data-url="comment.jsp">评论信息管理</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;"><i
							class="glyphicon glyphicon-cog"></i><span>系统管理</span></a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;" onclick="reloadPage()"><i
									class="layui-icon layui-icon-refresh"></i><span>刷新页面</span></a>
							</dd>
						</dl></li>
				</ul>
			</div>
		</div>

		<div class="layui-tab layui-tab-brief" lay-filter="contentnav"
			lay-allowClose="true" style="margin-left: 205px; margin-top: 0;">
			<ul class="layui-tab-title">
				<li class="layui-nav-item layui-this" lay-id="2">首页</li>
			</ul>
			<ul class="layui-bg-green rightmenu"
				style="display: none; position: absolute;">
				<li data-type="closethis">关闭当前</li>
				<li data-type="closeall">关闭所有</li>
			</ul>
			<div class="layui-tab-content" style="padding: 0;">
				<div class="layui-tab-item layui-show">
					<iframe src="welcome.jsp" width="100%"
						style="border: none; min-height: 600px" height="100%"
						name="iframe" scrolling="auto" class="iframe" framborder="0"></iframe>
				</div>
			</div>
		</div>
	</div>

</body>

</html>