<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>blogTypeManage</title>
<link rel="stylesheet" href="../static/layui/css/layui.css" media="all">
<script type="text/javascript" src="../static/js/jquery-1.12.4.min.js"></script>
<link href="../static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
<script type="text/javascript" src="../static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
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
			url : "blogtypeSelect",
			data : "pn=" + pn,
			type : "post",
			success : function(msg) {
				build_blogtype_table(msg);
				build_page_info(msg);
				build_page_nav(msg);
			},
			error : function() {

			}
		});
	}
	
	function build_blogtype_table(msg) {
		//清空table
		$("#blogtype_table tbody").empty();

		var list = msg.map.pageInfo.list;

		$
				.each(
						list,
						function(index, blogtype) {
							var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
							var id = $("<td></td>").append(blogtype.id);
							var tname = $("<td></td>").append(blogtype.tname);

							var editBtn = $("<button></button>").addClass(
									"btn btn-primary btn-sm edit_btn").append(
									$("<span></span>").addClass(
											"glyphicon glyphicon-pencil"))
									.append("编辑");
							//为编辑按钮添加一个自定义属性,来存入当前数据的id
							editBtn.attr("edit_id", blogtype.id);

							var deleteBtn = $("<button></button>").addClass(
									"btn btn-danger btn-sm delete_btn").append(
									$("<span></span>").addClass(
											"glyphicon glyphicon-trash"))
									.append("删除");
							//为删除按钮添加一个自定义属性,来存入当前数据的id
							deleteBtn.attr("delete_id", blogtype.id);

							var btnTd = $("<td></td>").append(editBtn).append(
									deleteBtn);

							$("<tr></tr>").append(checkBoxTd).append(id).append(tname).append(btnTd).appendTo("#blogtype_table tbody");
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
	
	//==========================================单个编辑按钮================================================================
	$(document).on("click", ".edit_btn", function() {
		var id = $(this).attr("edit_id");
		select_blogtype_by_id(id);

		$("#blogtype_update_btn").attr("edit_id", id);

		//JQuery打开模态框
		$("#update_modal").modal({
			backdrop : "static"
		});
	});

	function select_blogtype_by_id(id) {
		$.ajax({
			url : "blogtypeSelectById",
			data : "id=" + id,
			type : "post",
			success : function(msg) {
				var blogtype = msg.map.blogtype;

				$("#update_tname").val(blogtype.tname);
			},
			error : function() {

			}
		});
	}
	
	//==========================================模态框编辑按钮================================================================
	//编辑点击事件
	$(document).on("click", "#blogtype_update_btn", function() {

		var id = $(this).attr("edit_id");
		var tname = $("#update_tname").val();

		//发送ajax请求编辑类别数据
		$.ajax({
			url : "blogtypeUpdate",
			data : "id=" + id + "&tname=" + tname,
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
	
	//==========================================添加按钮================================================================================

	function reset_form(ele) {
		$(ele)[0].reset();
		$(ele).find("*").removeClass("has-success has-error");
		$(ele).find(".help-block").text("");
	}

	$(document).on("click", "#blogtype_insert_modal_btn", function() {
		reset_form("#insert_modal form");
		$("#insert_modal").modal({
			backdrop : "static"
		});
	});
	
	//==========================================insert_modal模态框添加按钮================================================================
	$(document).on("click", "#blogtype_insert_btn", function() {
		$.ajax({
			url : "blogtypeInsert",
			data : $("#insert_modal form").serialize(),
			type : "post",
			success : function(msg) {
				if (msg.code == 100) {
					$("#insert_modal").modal("hide");
				}else{
					//显示失败信息
					//有哪个字段的错误信息就显示哪个字段
					
					if(undefined!=msg.map.map.name){
						show_validate_msg("#insert_tname","success","");
					}
					
					if(undefined!=msg.map.map.name){
						show_validate_msg("#insert_tname","error",msg.map.map.name);
					}
				}
				
			},
			error : function() {
				
			}
		});
	});
	
	//==========================================单个删除按钮================================================================
	$(document).on("click", ".delete_btn", function() {
		var id = $(this).attr("delete_id");
		var tname = $(this).parents("tr").find("td:eq(2)").text();

		if (confirm("确定删除" + tname + "吗?")) {
			//发送ajax请求删除
			$.ajax({
				url : "blogtypeDeleteById",
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

<!-- ==========================================添加模态框================================================================================= -->
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
							<label for="exampleInputEmail1">类别名称</label> <input type="text"
								class="form-control" id="insert_tname" name="tname"
								placeholder="请输入类别名称">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						id="blogtype_insert_btn">添加</button>
				</div>
			</div>
		</div>
	</div>


<!-- ===========================================编辑模态框================================================================================ -->
	<div class="modal fade" id="update_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">编辑类别</h4>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="exampleInputPassword1">类别名称</label> <input type="text" class="form-control" id="update_tname" name="tname">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						id="blogtype_update_btn">编辑</button>
				</div>
			</div>
		</div>
	</div>
<!-- ===================================================================================================================================== -->
	<br>
	<div class="row">
			<div class="col-md-1">
				<button class="layui-btn" id="blogtype_insert_modal_btn">添加</button>
			</div>
		</div>
	
	<table class="layui-table" id="blogtype_table" style="text-align: center">
  <colgroup>
    <col width="150">
    <col width="200">
    <col>
  </colgroup>
  <thead>
    <tr>
    <th style="text-align: center"><input type="checkbox" id="check_all" /></th>
      <th style="text-align: center">类别标识</th>
      <th style="text-align: center">类别名称</th>
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