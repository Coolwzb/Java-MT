<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>友情链接</title>
<link rel="stylesheet" href="../static/layui/css/layui.css" media="all">
<script type="text/javascript" src="../static/js/jquery-1.12.4.min.js"></script>
<link href="../static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="../static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../static/layui/layui.js"></script>
<script type="text/javascript">
	//定义全局当前页
	var pageNum, pages;

	//================================分页查询==========================================================

	$(function() {
		to_page(1);
	});

	//ajax公共方法
	function to_page(pn) {
		$.ajax({
			url : "linkSelect",
			data : "pn=" + pn,
			type : "post",
			success : function(msg) {
				//解析并显示数据
				build_link_table(msg);
				//解析并显示分页信息
				build_page_info(msg);
				//解析并显示分页条信息
				build_page_nav(msg);
			},
			error : function() {

			}
		});
	}

	//解析并显示链接数据
	function build_link_table(msg) {
		//清空table
		$("#link_table tbody").empty();

		var list = msg.map.pageInfo.list;

		$
				.each(
						list,
						function(index, link) {
							var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
							var id = $("<td></td>").append(link.id);
							var linkname = $("<td></td>").append(link.linkname)
							var linkurl = $("<td></td>").append(link.linkurl)
							var urlname = $("<td></td>").append(link.urlname)

							var deleteBtn = $("<button></button>").addClass(
									"btn btn-danger btn-sm delete_btn").append(
									$("<span></span>").addClass(
											"glyphicon glyphicon-trash"))
									.append("删除");
							//为删除按钮添加一个自定义属性,来存入当前数据的id
							deleteBtn.attr("delete_id", link.id);

							var btnTd = $("<td></td>").append(deleteBtn);

							$("<tr></tr>").append(checkBoxTd).append(id)
									.append(linkname).append(linkurl).append(urlname).append(
											btnTd)
									.appendTo("#link_table tbody");
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

	//==========================================添加按钮================================================================================

	function reset_form(ele) {
		$(ele)[0].reset();
		$(ele).find("*").removeClass("has-success has-error");
		$(ele).find(".help-block").text("");
	}

	$(document).on("click", "#link_insert_modal_btn", function() {
		reset_form("#insert_modal form");
		$("#insert_modal").modal({
			backdrop : "static"
		});
	});

	//==========================================insert_modal模态框添加按钮================================================================
	$(document).on("click", "#link_insert_btn", function() {
		$.ajax({
			url : "linkInsert",
			data : $("#insert_modal form").serialize(),
			type : "post",
			success : function(msg) {
				if (msg.code == 100) {
					$("#insert_modal").modal("hide");
					to_page(pages+1);
				}

			},
			error : function() {

			}
		});

	});

	//==========================================单个删除按钮================================================================
	$(document).on("click", ".delete_btn", function() {
		var id = $(this).attr("delete_id");
		var linkname = $(this).parents("tr").find("td:eq(2)").text();

		if (confirm("确定删除" + linkname + "吗?")) {
			//发送ajax请求删除
			$.ajax({
				url : "linkDeleteById",
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
</head>
<body>


	<!-- ===========================================添加模态框================================================================================ -->
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
					<legend>添加</legend>
				</fieldset>
				<form class="layui-form" action="">
					<div class="layui-form-item">
						<label class="layui-form-label">名称</label>
						<div class="layui-input-block">
							<input type="text" name="linkname" lay-verify="linkname"
								autocomplete="off" placeholder="请输入名称" class="layui-input" style="width: 500px">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">地址</label>
						<div class="layui-input-block">
							<input type="text" name="linkurl" lay-verify="linkurl"
								autocomplete="off" placeholder="请输入url" class="layui-input" style="width: 500px">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">简介</label>
						<div class="layui-input-block">
							<input type="text" name="urlname" lay-verify="linkurl"
								autocomplete="off" placeholder="请输入简介" class="layui-input" style="width: 500px">
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button type="button" class="layui-btn layui-btn-normal"
								data-dismiss="modal">关闭</button>
							<button class="layui-btn" lay-submit lay-filter="formDemo"
								id="link_insert_btn">添加</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>


	<!-- ===========================================Container================================================================================ -->
	<br>
	<div class="row">
		<div class="col-md-1">
			<button class="layui-btn" id="link_insert_modal_btn">添加</button>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<table class="table table-bordered" id="link_table"
				style="text-align: center">
				<thead>
					<tr>
						<th style="text-align: center"><input type="checkbox"
							id="check_all" /></th>
						<th style="text-align: center">ID</th>
						<th style="text-align: center">友情链接名称</th>
						<th style="text-align: center">友情链接地址</th>
						<th style="text-align: center">链接简介</th>
						<th style="text-align: center">操作</th>
					</tr>
				</thead>

				<tbody>
				</tbody>

			</table>
		</div>
	</div>

	<div class="row">
		<div class="col-md-4" id="page_info"></div>

		<div class="col-md-4" id="page_nav"></div>
	</div>
</body>
</html>