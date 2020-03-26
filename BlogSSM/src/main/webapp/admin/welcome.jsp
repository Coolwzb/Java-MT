<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>欢迎页面</title>
<link rel="stylesheet" href="../static/layui/css/layui.css" media="all">
<script type="text/javascript" src="../static/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="../static/layui/layui.js"></script>
<script>
	//JavaScript代码区域
	layui.use('element', function() {
		var element = layui.element;

	});
</script>

<style type="text/css">
body {
    width:100%;
    height:100%;
	background-image: url('../read/images/bac.jpg');  
	background-repeat:no-repeat;
  	background-size:100%;
}

.font1{
    background: linear-gradient(to right, red, orange, yellow, green, yellow, orange, red, orange, yellow, green, yellow, orange, red);
    color: transparent;
    -webkit-background-clip: text;
    width: 300px;
    animation: move 5s infinite; 
}
@keyframes move {
      0% {background-position: 0 0;}
      100% {
        background-position: -300px 0;
      }
        }
        
.font2{
            font-size:22px;
            background-image: -webkit-linear-gradient(bottom, rgb(201, 115, 255), rgb(20, 11, 255));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

</style>


</head>
<body>
	<div title="欢迎使用"
		style="padding: 20px; overflow: hidden;">
		<p style="font-size: 30px; line-height: 60px; height: 60px; font-family: Microsoft Yahei" class="font1">欢迎您！</p>
		<p style="font-size: 25px; line-height: 30px; height: 30px;" class="font2">Welcome
			to the system!</p>

		<hr />
		<div class="layui-card-header"><a style="color:purple">系统信息</a></div>
		<table class="layui-table">
			<tbody>
			<col width="128" />
			<col />
			<tr>
				<td style="color:black">系统名称</td>
				<td style="color:black">博客管理系统</td>
			</tr>
			<tr>
				<td style="color:black">系统环境</td>
				<td style="color:black">Windows7</td>
			</tr>
			<tr>
				<td style="color:black">开发工具</td>
				<td style="color:black">Eclipse</td>
			</tr>
			<tr>
				<td style="color:black">开发者</td>
				<td style="color:black">LBJ·Bin</td>
			</tr>
			<tr>
				<td style="color:black">Java版本</td>
				<td style="color:black">JDK 1.8</td>
			</tr>
			<tr>
				<td style="color:black">服务器</td>
				<td style="color:black">Tomcat 7.0</td>
			</tr>
			<tr>
				<td style="color:black">数据库</td>
				<td style="color:black">MySQL 5.7</td>
			</tr>
			<tr>
				<td style="color:black">系统采用技术</td>
				<td style="color:black">Spring+SpringMVC+Mybaits+LayUI+JQuery+Ajax</td>
			</tr>
			</tbody>
		</table>
	</div>
</body>
</html>