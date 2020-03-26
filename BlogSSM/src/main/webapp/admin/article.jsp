<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>文章管理</title>
<script type="text/javascript" src="../static/js/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="../static/layui/css/layui.css" media="all">
<link href="../static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="../static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../static/layui/layui.js"></script>
<link rel="stylesheet" href="../static/css/blog.css">
<style type="text/css">
table {
	width: 600px;
	table-layout: fixed;
}

td {
	white-space: nowrap;
	overflow: hidden;
	word-break: keep-all;
	text-overflow: ellipsis
}
</style>
<script type="text/javascript">
	//定义全局当前页
	var pageNum, pages;

	//================================分页查询==========================================================

	$(function() {
		to_page(1);
	});

	function to_page(pn) {
		$.ajax({
			url : "blogSelect",
			data : "pn=" + pn,
			type : "post",
			success : function(msg) {
				build_blog_table(msg);
				build_page_info(msg);
				build_page_nav(msg);
			},
			error : function() {

			}
		});
	}

	function build_blog_table(msg) {
		$("#blog_table tbody").empty();

		var list = msg.map.pageInfo.list;

		$
				.each(
						list,
						function(index, blog) {
							var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
							var id = $("<td></td>").append(blog.id);
							var title = $("<td></td>").append(blog.title);
							var author = $("<td></td>").append(blog.author);
							var content = $("<td></td>").append(blog.content);

							var selectBtn = $("<button></button>")
									.addClass(
											"btn btn-success btn-sm select_btn")
									.append(
											$("<span></span>").addClass(
													"glyphicon glyphicon-book"))
									.append("查看");

							selectBtn.attr("select_id", blog.id);
							

							var deleteBtn = $("<button></button>").addClass(
									"btn btn-danger btn-sm delete_btn").append(
									$("<span></span>").addClass(
											"glyphicon glyphicon-trash"))
									.append("删除");

							deleteBtn.attr("delete_id", blog.id);
							

							var btnTd = $("<td></td>").append(selectBtn)
									.append(deleteBtn);

							$("<tr></tr>").append(checkBoxTd).append(id)
									.append(title).append(author).append(
											content).append(btnTd).appendTo(
											"#blog_table tbody");
						});
	}

	//解析并显示分页信息
	function build_page_info(msg) {
		//清空page_info
		$("#page_info").empty();

		$("#page_info").append(
				"当前第" + msg.map.pageInfo.pageNum + "页,一共有"
						+ msg.map.pageInfo.pages + "页,总共有"
						+ msg.map.pageInfo.total + "条数据");

		pageNum = msg.map.pageInfo.pageNum;
		pages = msg.map.pageInfo.pages;
	}

	//解析并显示分页条信息
	function build_page_nav(msg) {
		//清空nav
		$("#page_nav").empty();

		//nav
		var nav = $("<nav></nav>");

		//ul
		var ul = $("<ul></ul>").addClass("pagination");

		//首页
		var firstPageLi = $("<li></li>").append(
				$("<a></a>").append("首页").attr("href", "#"));

		//上一页
		var prePageLi = $("<li></li>").append(
				$("<a></a>").append("&laquo;").attr("href", "#"));

		if (msg.map.pageInfo.hasPreviousPage == false) {
			//禁用首页,上一页
			firstPageLi.addClass("disabled");
			prePageLi.addClass("disabled");
		} else {
			//添加点击事件
			firstPageLi.click(function() {
				to_page(1);
			});

			prePageLi.click(function() {
				to_page(msg.map.pageInfo.pageNum - 1);
			});
		}

		//添加元素
		ul.append(firstPageLi);
		ul.append(prePageLi);

		//--------------------------------------------------------------------------------------------------------------------------------
		//index
		$.each(msg.map.pageInfo.navigatepageNums, function(index, item) {
			var numLi = $("<li></li>").append(
					$("<a></a>").append(item).attr("href", "#"));

			//添加样式
			if (msg.map.pageInfo.pageNum == item) {
				numLi.addClass("active");
			}

			//添加点击事件
			numLi.click(function() {
				to_page(item);
			});

			//添加元素
			ul.append(numLi);
		});

		//--------------------------------------------------------------------------------------------------------------------------------

		//下一页
		var nextPageLi = $("<li></li>").append(
				$("<a></a>").append("&raquo;").attr("href", "#"));
		//末页
		var lastPageLi = $("<li></li>").append(
				$("<a></a>").append("末页").attr("href", "#"));

		if (msg.map.pageInfo.hasNextPage == false) {
			nextPageLi.addClass("disabled");
			lastPageLi.addClass("disabled");
		} else {
			//添加点击事件
			nextPageLi.click(function() {
				to_page(msg.map.pageInfo.pageNum + 1);
			});

			lastPageLi.click(function() {
				to_page(msg.map.pageInfo.pages);
			});
		}

		//添加元素
		ul.append(nextPageLi);
		ul.append(lastPageLi);

		nav.append(ul).appendTo("#page_nav");
	}

	//==========================================单个查看按钮================================================================
	$(document).on("click", ".select_btn", function() {
		var id = $(this).attr("select_id");
		select_blog_by_id(id);

		$("#blog_select_btn").attr("select_id", id);
		//JQuery打开模态框
		$("#select_modal").modal({
			backdrop : "static"
		});

	});

	function select_blog_by_id(id) {
		$.ajax({
			url : "blogSelectById",
			data : "id=" + id,
			type : "post",
			success : function(msg) {
				var blog = msg.map.blog;

				$("#select_title").val(blog.title);
				$("#select_content").val(blog.content);
			},
			error : function() {

			}
		});
	}

	//==========================================模态框查看按钮================================================================
	$(document).on("click", "#blog_select_btn", function() {

		var id = $(this).attr("select_id");

		//发送ajax请求
		$.ajax({
			url : "articleSelect",
			data : "id=" + id,
			type : "post",
			success : function(msg) {
				if (msg.code == 100) {
					//关闭模态框
					$("#select_modal").modal("hide");

					//回到当前页
					to_page(pageNum);
				}
			},
			error : function() {

			}
		});
	});
	
	
	//==========================================评论按钮================================================================
	$(document).on("click","#comment_btn",function(){
		window.location.href = "comment.jsp";
	})
	
	
	//==========================================添加按钮================================================================================

	function reset_form(ele) {
		$(ele)[0].reset();
		$(ele).find("*").removeClass("has-success has-error");
		$(ele).find(".help-block").text("");
	}

	$(document).on("click", "#blog_insert_modal_btn", function() {
		reset_form("#insert_modal form");
		$("#insert_modal").modal({
			backdrop : "static"
		});
	});

	//==========================================insert_modal模态框添加按钮================================================================
	$(document).on("click", "#blog_insert_btn", function() {
		$.ajax({
			url : "blogInsert",
			data : $("#insert_modal form").serialize(),
			type : "post",
			success : function(msg) {
				if (msg.code == 100) {
					$("#insert_modal").modal("hide");
					to_page(pages + 1);
				}

			},
			error : function() {

			}
		});

	});

	//==========================================单个删除按钮================================================================
	$(document).on("click", ".delete_btn", function() {
		var id = $(this).attr("delete_id");
		var title = $(this).parents("tr").find("td:eq(2)").text();

		if (confirm("确定删除" + title + "吗?")) {
			//发送ajax请求删除
			$.ajax({
				url : "blogDeleteById",
				type : "post",
				data : "id=" + id,
				success : function(msg) {
					if (msg.code == 100) {
						//删除成功返回当前页
						to_page(pageNum);
					}
				},
				error : function() {

				}
			});
		}

	});
	

	
</script>

<script>
	layui.use('element', function() {
		var element = layui.element;

		//一些事件监听
		element.on('tab(demo)', function(data) {
			console.log(data);
		});
	});

	layui.use('form', function() {
		var form = layui.form;
		form.render();
	});

	//Demo
	layui.use('form', function() {
		var form = layui.form;

		//监听提交
		form.on('submit(formDemo)', function(data) {
			layer.msg(JSON.stringify(data.field));
			return false;
		});
	});
	
	
	
	
</script>

</head>
<body>
	<!-- ==========================================添加模态框================================================================================= -->
	<div class="modal fade bs-example-modal-lg" id="insert_modal"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<fieldset class="layui-elem-field layui-field-title"
					style="margin-top: 20px;">
					<legend>编写文章</legend>
				</fieldset>
				<form class="layui-form" action="">
					<div class="layui-form-item">
						<label class="layui-form-label">标题</label>
						<div class="layui-input-inline">
							<input type="text" name="title" required lay-verify="required"
								placeholder="请输入标题" autocomplete="off" class="layui-input">
						</div>
						<label class="layui-form-label">作者</label>
						<div class="layui-input-inline">
							<input type="text" name="author" required lay-verify="required"
								placeholder="请输入作者" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">内容</label>
						<div class="layui-input-block" style="width: 800px;">
							<textarea style="width: 500px; height: 200px; padding: 5px;"
								name="content" id="demo" lay-verify="content"
								class="field-content"></textarea>
						</div>
						<script >
						layui.use(['layer','layedit', 'form','jquery'],function(){
					        var form = layui.form,layer = layui.layer;
					        var $ = layui.$;
					        var layedit = layui.layedit;
					        var index = layedit.build('id',{
					        	  tool: ['left', 'center', 'right', '|', 'face']}); //建立编辑器
					        form.verify({
					            content: function(value) {
					                return layedit.sync(index);
					            }
					        });
						})
						</script>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button type="button" class="layui-btn layui-btn-normal"
								data-dismiss="modal">关闭</button>
							<button class="layui-btn" lay-submit lay-filter="formDemo"
								id="blog_insert_btn">发布博客</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>


	<!-- ==========================================查看模态框================================================================================= -->
	<div class="modal fade bs-example-modal-lg" id="select_modal"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<fieldset class="layui-elem-field layui-field-title"
					style="margin-top: 20px;">
					<legend>查看内容</legend>
				</fieldset>
				<form class="layui-form" action="">
				<div class="layui-form-item">
						<label class="layui-form-label">标题</label>
						<div class="layui-input-inline">
							<input type="text" name="title" required lay-verify="required"
								id="select_title"autocomplete="off" class="layui-input">
						</div>
						</div>
					<div class="layui-form-item layui-form-text">
						<label class="layui-form-label">内容</label>
						<div class="layui-input-block">
							<textarea name="content" class="layui-textarea"
								id="select_content" style="height: 300px"></textarea>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
						<button type="button" class="layui-btn layui-bg-green"
								id="comment_btn">评论</button>
								<button type="button" class="layui-btn layui-btn-normal"
								data-dismiss="modal">关闭</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	
	<!-- ==========================================评论模态框================================================================================= -->
	<div class="modal fade bs-example-modal-lg" id="comment_modal"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<fieldset class="layui-elem-field layui-field-title"
					style="margin-top: 20px;">
					<legend>评论文章</legend>
				</fieldset>
				<form class="layui-form" action="">
					<div class="layui-form-item layui-form-text">
						<label class="layui-form-label">内容</label>
						<div class="layui-input-block">
							<textarea name="content" class="layui-textarea"
								id="select_content" style="height: 300px"></textarea>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
								<button type="button" class="layui-btn layui-btn-normal"
								data-dismiss="modal">关闭</button>
								<button type="button" class="layui-btn layui-bg-green"
								id="article_comment_btn">评论</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>


	<!-- ===================================================================================================================================== -->
	<br>
	<div class="row">
		<div class="col-md-1">
			<button class="layui-btn" id="blog_insert_modal_btn">添加文章</button>
		</div>
	</div>

	<table class="layui-table" id="blog_table" style="text-align: center">
		<colgroup>
			<col width="150">
			<col width="200">
			<col>
		</colgroup>
		<thead>
			<tr>
				<th style="text-align: center"><input type="checkbox"
					id="check_all" /></th>
				<th style="text-align: center">文章ID</th>
				<th style="text-align: center">文章标题</th>
				<th style="text-align: center">作者</th>
				<th style="text-align: center">内容</th>
				<th style="text-align: center">操作</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>

	<div class="row">
		<div class="col-md-4" id="page_info"></div>

		<div class="col-md-4" id="page_nav"></div>
	</div>

</body>
</html>