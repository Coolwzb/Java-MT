<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="ICON" href="../static/image/Jlogo.jpg">
<script type="text/javascript" src="../static/js/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="../static/layui/css/layui.css" media="all">
<link rel="stylesheet" media="screen"
	href="../static/login/css/style.css">
<link rel="stylesheet" type="text/css"
	href="../static/login/css/reset.css">
<link href="../static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="../static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../static/layui/layui.js"></script>
<script type="text/javascript">
	function blogger_login() {
		var name = $("#name").val();
		var password = $("#password").val();

		$.ajax({
			url : "bloggerSelectByLogin",
			data : "name=" + name + "&password=" + password,
			type : "post",
			success : function(msg) {
				if (msg.code == 100) {
					window.location.href = "main.jsp?name="
							+ msg.map.blogger.name + "&password="
							+ msg.map.blogger.password;
				} else {
					alert(msg.map.msg);
				}
			},
			error : function() {

			}
		});
		return false;
	}
	
	/*验证码*/
 	$(function(){
	 var show_num = [];
	 draw(show_num);
	
	 $("#canvas").on('click',function(){
	 draw(show_num);
	 })
	 $(".login-button").on('click',function(){
	 var val = $(".code-input").val().toLowerCase();
	 var num = show_num.join("");
	 if(val==''){
	 alert('请输入验证码！');
	 window.location.href = "login.jsp";
	 }else if(val == num){
	 alert('验证码正确！');
	 $(".code-input").val('');
	 draw(show_num);
	
	 }else{
	 alert('验证码错误！请重新输入！');
	 $(".code-input").val('');
	 draw(show_num);
	 window.location.href = "login.jsp";
	 }
	 })
	 })
	
	 function draw(show_num) {
	 var canvas_width=$('#canvas').width();
	 var canvas_height=$('#canvas').height();
	 var canvas = document.getElementById("canvas");//获取到canvas的对象，演员
	 var context = canvas.getContext("2d");//获取到canvas画图的环境，演员表演的舞台
	 canvas.width = canvas_width;
	 canvas.height = canvas_height;
	 var sCode = "A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0";
	 var aCode = sCode.split(",");
	 var aLength = aCode.length;//获取到数组的长度
	
	 for (var i = 0; i <= 3; i++) {
	 var j = Math.floor(Math.random() * aLength);//获取到随机的索引值
	 var deg = Math.random() * 30 * Math.PI / 180;//产生0~30之间的随机弧度
	 var txt = aCode[j];//得到随机的一个内容
	 show_num[i] = txt.toLowerCase();
	 var x = 10 + i * 20;//文字在canvas上的x坐标
	 var y = 20 + Math.random() * 8;//文字在canvas上的y坐标
	 context.font = "bold 23px 微软雅黑";
	
	 context.translate(x, y);
	 context.rotate(deg);
	
	 context.fillStyle = randomColor();
	 context.fillText(txt, 0, 0);
	
	 context.rotate(-deg);
	 context.translate(-x, -y);
	 }
	 for (var i = 0; i <= 5; i++) { //验证码上显示线条
	 context.strokeStyle = randomColor();
	 context.beginPath();
	 context.moveTo(Math.random() * canvas_width, Math.random() * canvas_height);
	 context.lineTo(Math.random() * canvas_width, Math.random() * canvas_height);
	 context.stroke();
	 }
	 for (var i = 0; i <= 30; i++) { //验证码上显示小点
	 context.strokeStyle = randomColor();
	 context.beginPath();
	 var x = Math.random() * canvas_width;
	 var y = Math.random() * canvas_height;
	 context.moveTo(x, y);
	 context.lineTo(x + 1, y + 1);
	 context.stroke();
	 }
	 }
	
	 function randomColor() {//得到随机的颜色值
	 var r = Math.floor(Math.random() * 256);
	 var g = Math.floor(Math.random() * 256);
	 var b = Math.floor(Math.random() * 256);
	 return "rgb(" + r + "," + g + "," + b + ")";
	 }
</script>
</head>
<body>

	<div id="particles-js">
		<div class="login" style="display: block;">
			<form method="post" onsubmit="blogger_login()"
				action="javascript:void(0)">
				<div class="login-top">登录</div>
				<div class="login-center clearfix">
					<div class="login-center-img">
						<img src="../static/login/images/name.png">
					</div>
					<div class="login-center-input">
						<input type="text" name="name" id="name" placeholder="administrator"
							tabindex="1">
						<div class="login-center-input-text">用户名</div>
					</div>
				</div>
				<div class="login-center clearfix">
					<div class="login-center-img">
						<img src="../static/login/images/password.png">
					</div>
					<div class="login-center-input">
						<input type="password" name="password" id="password"
							placeholder="请输入您的密码" tabindex="2">
						<div class="login-center-input-text">密码</div>
					</div>
				</div>
				<div class="login-center clearfix">
					<div class="login-center-img">
						<img src="../static/login/images/code.png">
					</div>
					<div class="login-center-input">
						<div class="layui-col-xs7">
							<input type="text" name="code" id="code" placeholder="请输入验证码"
								tabindex="2" class="code-input">
							<div class="login-center-input-text">验证码</div>
						</div>
						<div class="layui-col-xs5">
							<div style="margin-left: 10px;">
								<canvas id="canvas" width="100" height="29" class="code-canvas"></canvas>
							</div>
						</div>
					</div>
				</div>
				<div style="text-align: center">
					<input type="submit" class="login-button" value="登录" />
				</div>
			</form>
		</div>
		<div class="sk-rotating-plane"></div>
		<canvas class="particles-js-canvas-el" width="1147" height="952"
			style="width: 100%; height: 100%;"></canvas>
	</div>

	<!-- scripts -->
	<script src="../static/login/js/particles.min.js"></script>
	<script src="../static/login/js/app.js"></script>
</body>
</html>