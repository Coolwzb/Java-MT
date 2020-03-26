<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>信息管理</title>
<script type="text/javascript" src="../static/js/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="../static/layui/css/layui.css" media="all">
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
			url : "bloggerSelect",
			data : "pn=" + pn,
			type : "post",
			success : function(msg) {
				//解析并显示博主数据
				build_blogger_table(msg);
				//解析并显示分页信息
				build_page_info(msg);
				//解析并显示分页条信息
				build_page_nav(msg);
			},
			error : function() {

			}
		});
	}

	//解析并显示博主数据
	function build_blogger_table(msg) {
		//清空table
		$("#blogger_table tbody").empty();

		var list = msg.map.pageInfo.list;

		$
				.each(
						list,
						function(index, blogger) {
							var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
							var id = $("<td></td>").append(blogger.id);
							var name = $("<td></td>").append(blogger.name);
							var password = $("<td></td>").append(
									blogger.password);

							var editBtn = $("<button></button>").addClass(
									"btn btn-primary btn-sm edit_btn").append(
									$("<span></span>").addClass(
											"glyphicon glyphicon-pencil"))
									.append("编辑");
							//为编辑按钮添加一个自定义属性,来存入当前数据的id
							editBtn.attr("edit_id", blogger.id);

							var deleteBtn = $("<button></button>").addClass(
									"btn btn-danger btn-sm delete_btn").append(
									$("<span></span>").addClass(
											"glyphicon glyphicon-trash"))
									.append("删除");
							//为删除按钮添加一个自定义属性,来存入当前数据的id
							deleteBtn.attr("delete_id", blogger.id);

							var btnTd = $("<td></td>").append(editBtn).append(
									deleteBtn);

							$("<tr></tr>").append(checkBoxTd).append(id)
									.append(name).append(password)
									.append(btnTd).appendTo(
											"#blogger_table tbody");
						});
	}

	//解析并显示分页信息
	function build_page_info(msg) {
		//清空page_info
		$("#page_info").empty();

		$("#page_info").append(
				"当前第" + msg.map.pageInfo.pageNum + "页,一共有"
						+ msg.map.pageInfo.pages + "页,一共有"
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

	//==========================================新增按钮================================================================================

	//清空表单样式及内容
	function reset_form(ele) {
		//清除input输入内容
		$(ele)[0].reset();
		//清除父div容器内容
		$(ele).find("*").removeClass("has-success has-error");
		//清空span内容
		$(ele).find(".help-block").text("");
	}

	$(document).on("click", "#blogger_insert_modal_btn", function() {
		//再次打开模态框,清除表单所有数据(内容,样式)
		reset_form("#insert_modal form");
		//JQuery调用模态框
		$("#insert_modal").modal({
			backdrop : "static"
		});
	});

	//==========================================正则表达式================================================================
	function validate_add_form() {
		//校验账号
		var insert_name = $("#insert_name").val();
		//用户名可以是2-5位中文或6-19位英文和数字的组合 
		var reg = /(^[a-zA-Z0-9_-]{6,19}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
		if (reg.test(insert_name)) {
			show_validate_msg("#insert_name", "success", "");
		} else {
			show_validate_msg("#insert_name", "error",
					"用户名必须是2-5位中文或6-19位英文和数字的组合");
			return false;
		}

		//校验密码
		var insert_password = $("#insert_password").val();
		//6-19位英文和数字的组合
		var reg = /(^[a-zA-Z0-9_-]{6,19}$)/;
		if (reg.test(insert_password)) {
			show_validate_msg("#insert_password", "success", "");
		} else {
			show_validate_msg("#insert_password", "error", "密码必须是6-19位英文和数字的组合");
			return false;
		}

		//校验成功返回true
		return true;
	}

	//显示校验结果提示信息
	function show_validate_msg(ele, status, msg) {
		//清空当前元素的检验状态
		$(ele).parent().removeClass("has-success has-error");

		if ("success" == status) {
			//让父容器变色
			$(ele).parent().addClass("has-success");
			//给span赋值错误信息
			$(ele).next("span").text(msg);
		} else if ("error" == status) {
			$(ele).parent().addClass("has-error");
			$(ele).next("span").text(msg);

		}
	}

	//用户名是否已被占用
	$(document).on("change", "#insert_name", function() {
		var insert_name = this.value;

		//发送ajax请求检验用户名是否已经被占用
		$.ajax({
			url : "bloggerSelectByName",
			data : "name=" + insert_name,
			type : "post",
			success : function(msg) {
				if (msg.code == 100) {
					//显示返回信息
					show_validate_msg("#insert_name", "success", msg.map.msg);
					//通过attr赋值属性
					$("#blogger_insert_btn").attr("ajax-va", "success");
				} else {
					show_validate_msg("#insert_name", "error", msg.map.msg);
					$("#blogger_insert_btn").attr("ajax-va", "error");
				}
			},
			error : function() {

			}
		});
	});

	//==========================================insert_modal模态框添加按钮================================================================
	$(document).on(
			"click",
			"#blogger_insert_btn",
			function() {
				//正则表达式进行校验
				if (validate_add_form()) {
				} else {
					return;
				}

				//用户名是否是否已被占用
				if ($(this).attr("ajax-va") == "error") {
					alert("用户名已存在");
					return;
				}

				$
						.ajax({
							url : "bloggerInsert",
							data : $("#insert_modal form").serialize(),
							type : "post",
							success : function(msg) {
								if (msg.code == 100) {
									//1.关闭模态框 
									$("#insert_modal").modal("hide");
									//2.来到最后一页,显示刚才保存好的数据
									to_page(pages);
								} else {
									//显示失败信息
									//有哪个字段的错误信息就显示哪个字段
									if (undefined == msg.map.map.name) {
										show_validate_msg("#insert_name",
												"success", "");
									}
									if (undefined == msg.map.map.password) {
										show_validate_msg("#insert_password",
												"success", "");
									}

									if (undefined != msg.map.map.name) {
										show_validate_msg("#insert_name",
												"error", msg.map.map.name);
									}
									if (undefined != msg.map.map.password) {
										show_validate_msg("#insert_password",
												"error", msg.map.map.password);
									}
								}
							},
							error : function() {

							}
						});
			});

	//==========================================单个编辑按钮================================================================
	$(document).on("click", ".edit_btn", function() {
		var id = $(this).attr("edit_id");
		select_blogger_by_id(id);

		$("#blogger_update_btn").attr("edit_id", id);

		//JQuery打开模态框
		$("#update_modal").modal({
			backdrop : "static"
		});
	});

	function select_blogger_by_id(id) {
		$.ajax({
			url : "bloggerSelectById",
			data : "id=" + id,
			type : "post",
			success : function(msg) {
				var blogger = msg.map.blogger;

				//静态控件p标签赋值
				$("#update_name_static").text(blogger.name);
				//文本框password赋值
				$("#update_password").val(blogger.password);
			},
			error : function() {

			}
		});
	}

	//==========================================模态框编辑按钮================================================================
	//编辑点击事件
	$(document).on("click", "#blogger_update_btn", function() {

		var id = $(this).attr("edit_id");
		var password = $("#update_password").val();

		//发送ajax请求编辑博主数据
		$.ajax({
			url : "bloggerUpdate",
			data : "id=" + id + "&password=" + password,
			type : "post",
			success : function(msg) {
				if (msg.code == 100) {
					//关闭模态框
					$("#update_modal").modal("hide");

					//回到当前页
					to_page(pageNum);
				}
			},
			error : function() {

			}
		});
	});

	//==========================================单个删除按钮================================================================
	$(document).on("click", ".delete_btn", function() {
		var id = $(this).attr("delete_id");
		var name = $(this).parents("tr").find("td:eq(2)").text();

		if (confirm("确定删除" + name + "吗?")) {
			//发送ajax请求删除
			$.ajax({
				url : "bloggerDeleteById",
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

	//==========================================多个删除按钮================================================================

	$(document).on("click", "#check_all", function() {
		//使用prop获取dom原生的值
		//使用attr获取自定义属性的值
		$(".check_item").prop("checked", $(this).prop("checked"));
	});

	//列表checkbox选满以后,全选按钮要变为选中状态,未选满全选按钮变为未选中状态
	$(document).on("click", ".check_item", function() {
		//判断当前元素是不是5个就可以了
		var flag = $(".check_item:checked").length == $(".check_item").length;
		$("#check_all").prop("checked", flag);
	});

	//批量删除事件
	$(document).on("click", "#blogger_delete_all_btn", function() {
		var ids = "";
		var names = "";

		//循环遍历选中的checkbox把ID,名字拿出来
		$.each($(".check_item:checked"), function(index, item) {
			ids += $(this).parents("tr").find("td:eq(1)").text() + "-";
			names += $(this).parents("tr").find("td:eq(2)").text() + "-";
		});

		//去除ids后面多余的那个杠
		ids = ids.substring(0, ids.length - 1);
		//去除names后面多余的那个杠
		names = names.substring(0, names.length - 1);

		if (confirm("你确定要删除" + names + "吗?")) {
			//发送ajax请求进行删除
			$.ajax({
				url : "bloggerDeleteByCheckbox",
				data : "ids=" + ids,
				type : "post",
				success : function() {
					//回到当前页
					to_page(pageNum);
				},
				error : function() {

				}
			});
		}
	});
</script>
</head>
<body>

	<!-- ===========================================添加按钮模态框================================================================================ -->
	<div class="modal fade" id="insert_modal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加</h4>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="exampleInputEmail1">用户名</label> <input type="text"
								class="form-control" id="insert_name" name="name"
								placeholder="请输入用户名">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">密码</label> <input type="text"
								class="form-control" id="insert_password" name="password"
								placeholder="请输入密码">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						id="blogger_insert_btn">添加</button>
				</div>
			</div>
		</div>
	</div>

	<!-- ===========================================编辑模态框================================================================================ -->
	<div class="modal fade" id="update_modal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel"
						style="text-align: center">编辑</h4>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="exampleInputEmail1">用户名</label>
							<p class="form-control-static" id="update_name_static"></p>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">密码</label> <input type="text"
								class="form-control" id="update_password" name="password"
								placeholder="请输入密码">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						id="blogger_update_btn">编辑</button>
				</div>
			</div>
		</div>
	</div>


	<!-- ===========================================Container================================================================================ -->

	<br>
	<div class="layui-col-xs2">
		<button class="layui-btn" id="blogger_insert_modal_btn">添加</button>
		<button class="layui-btn layui-btn-danger" id="blogger_delete_all_btn">批量删除</button>
	</div>
	<hr>

	<table class="layui-table" id="blogger_table"
		style="text-align: center">
		<colgroup>
			<col width="150">
			<col width="200">
			<col>
		</colgroup>
		<thead>
			<tr>
				<th style="text-align: center"><input type="checkbox"
					id="check_all" /></th>
				<th style="text-align: center">ID</th>
				<th style="text-align: center">用户名</th>
				<th style="text-align: center">密码</th>
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