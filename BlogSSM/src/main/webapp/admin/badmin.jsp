<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>个人资料</title>
<script type="text/javascript" src="../static/js/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="../static/layui/css/layui.css" media="all">
<link href="../static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="../static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../static/layui/layui.js"></script>
<script>
	//JavaScript代码区域
	layui.use('element', function() {
		var element = layui.element;

	});

	layui
			.use(
					[ 'form', 'layedit', 'laydate' ],
					function() {
						var form = layui.form, layer = layui.layer, layedit = layui.layedit, laydate = layui.laydate;

						//日期
						laydate.render({
							elem : '#date'
						});
						laydate.render({
							elem : '#date1'
						});

						//创建一个编辑器
						var editIndex = layedit.build('LAY_demo_editor');

						//自定义验证规则
						form.verify({
							title : function(value) {
								if (value.length < 5) {
									return '标题至少得5个字符啊';
								}
							},
							pass : [ /^[\S]{6,12}$/, '密码必须6到12位，且不能出现空格' ],
							content : function(value) {
								layedit.sync(editIndex);
							}
						});

						//监听指定开关
						form.on('switch(switchTest)', function(data) {
							layer.msg('开关checked：'
									+ (this.checked ? 'true' : 'false'), {
								offset : '6px'
							});
							layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF',
									data.othis)
						});

						//监听提交
						form.on('submit(demo1)', function(data) {
							layer.alert(JSON.stringify(data.field), {
								title : '最终的提交信息'
							})
							return false;
						});

						//表单取值
						layui.$('#LAY-component-form-getval').on('click',
								function() {
									var data = form.val('example');
									alert(JSON.stringify(data));
								});

					});
</script>
</head>
<body>
	<br>
	<form class="layui-form layui-row">
		<div class="layui-col-md3 layui-col-xs12 user_right">
			<div class="layui-upload-list" style="text-align: center">
				<img src="../static/image/James.jpg"
					class="layui-upload-img layui-circle"
					style="width: 200px; height: 200px">
			</div>
		</div>
		<div class="layui-col-md6 layui-col-xs12 user_left">
			<div class="layui-form-item">
				<label class="layui-form-label">用户名</label>
				<div class="layui-input-block">
					<input type="text" name="title" required lay-verify="required"
						placeholder="administrator" autocomplete="off" disabled
						class="layui-input layui-disabled" style="width: 500px">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">用户组</label>
				<div class="layui-input-block">
					<input type="text" name="titlez" placeholder="超级管理员 "
						autocomplete="off" disabled class="layui-input layui-disabled"
						style="width: 500px">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">姓名</label>
				<div class="layui-input-block">
					<input type="text" name="name" placeholder="LBJ·B "
						autocomplete="off" disabled class="layui-input layui-disabled"
						style="width: 500px">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">单选框</label>
				<div class="layui-input-block">
					<input type="radio" name="sex" value="男" title="男" checked="">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">姓名</label>
				<div class="layui-input-block">
					<input type="tel" name="phone" placeholder="138*****932"
						autocomplete="off" disabled class="layui-input layui-disabled"
						style="width: 500px">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">住址</label>
				<div class="layui-input-block">
					<input type="tel" name="phone" placeholder="广东省梅州市"
						autocomplete="off" disabled class="layui-input layui-disabled"
						style="width: 500px">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">掌握技术</label>
				<div class="layui-input-block userHobby" style="width: 500px">
					<input type="checkbox" name="like[javascript]" title="Java"
						checked> <input type="checkbox" name="like[C#]"
						title="Javascript" checked> <input type="checkbox"
						name="like[php]" title="PHP"> <input type="checkbox"
						name="like[html]" title="HTML(5)" checked> <input
						type="checkbox" name="like[css]" title="CSS(3)" checked>
					<input type="checkbox" name="like[.net]" title=".net"> <input
						type="checkbox" name="like[ASP]" title="ASP"> <input
						type="checkbox" name="like[Angular]" title="Angular"> <input
						type="checkbox" name="like[VUE]" title="VUE"> <input
						type="checkbox" name="like[XML]" title="XML" checked>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">邮箱</label>
				<div class="layui-input-block">
					<input type="tel" name="phone" placeholder="970291791@qq.com"
						autocomplete="off" disabled class="layui-input layui-disabled"
						style="width: 500px">
				</div>
			</div>

			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">个人签名</label>
				<div class="layui-input-block">
					<textarea placeholder="你好，世界。世界上的第一个程序就是Hello World。学新技术，敲好代码。"
						class="layui-textarea" name="desc" style="width: 500px"></textarea>
				</div>
			</div>
		</div>
	</form>
</body>
</html>