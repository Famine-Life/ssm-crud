<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>员工列表</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<!-- 引入jquery -->
	<script type="text/javascript" src="${path}/ssm-crud/static/js/jquery-1.12.4.js"></script>
	<!-- 引入css、js -->
	<link href="${path}/ssm-crud/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="${path}/ssm-crud/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
  </head>
  
  <body>
  	<!-- 员工修改的模态框 -->
	<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">员工添加</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
			  <div class="form-group">
			    <label class="col-sm-2 control-label">empName</label>
			    <div class="col-sm-10">
			      <p class="form-control-static" id="empName_update_static"></p>
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">email</label>
			    <div class="col-sm-10">
			      <input type="text" name="email" class="form-control" id="email_update_input" placeholder="xanwidtf@foxmail.com">
			    	<span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">gender</label>
			    <div class="col-sm-10">
			    	<label class="radio-inline">
				  		<input type="radio" name="gender" id="gender1_update_input" value="M" checked="true"> 男
					</label>
					<label class="radio-inline">
					    <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
					</label>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">deptName</label>
			    <div class="col-sm-4">
			    	<!-- 提交部门id即可 -->
			    	<select class="form-control" name="dId">
					</select>
			    </div>
			  </div>
			  
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
	      </div>
	    </div>
	  </div>
	</div>
  	
  	
	<!-- 员工添加的模态框 -->
	<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">员工添加</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
			  <div class="form-group">
			    <label class="col-sm-2 control-label">empName</label>
			    <div class="col-sm-10">
			      <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="empName">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">email</label>
			    <div class="col-sm-10">
			      <input type="text" name="email" class="form-control" id="email_add_input" placeholder="xanwidtf@foxmail.com">
			    	<span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">gender</label>
			    <div class="col-sm-10">
			    	<label class="radio-inline">
				  		<input type="radio" name="gender" id="gender1_add_input" value="M" checked="true"> 男
					</label>
					<label class="radio-inline">
					    <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
					</label>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">deptName</label>
			    <div class="col-sm-4">
			    	<!-- 提交部门id即可 -->
			    	<select class="form-control" name="dId">
					</select>
			    </div>
			  </div>
			  
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
	      </div>
	    </div>
	  </div>
	</div>
  	
  	<div class="container">
  		<!-- 标题 -->
  		<div class="row">
  			<div class="col-md-12">
  				<h1>SSM-CRUD</h1>
  			</div>
  		</div>
  		<!-- 按钮 -->
  		<div class="row">
  			<div class="col-md-4 col-md-offset-8">
  				<button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
  				<button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
  			</div>
  		</div>
  		<!-- 显示表格数据 -->
  		<div class="row">
  			<div class="col-md-12">
  				<table class="table table-hover" id="emps_table">
  					<thead>
  						<tr>
  							<th>
  								<input type="checkbox" id="check_all">
  							</th>
	  						<th>#</th>
	  						<th>empName</th>
	  						<th>gender</th>
	  						<th>email</th>
	  						<th>deptName</th>
	  						<th>操作</th>
  						</tr>
  					</thead>
  					<tbody>
  					
  					</tbody>
  				</table>
  			</div>
  		</div>
  		<!-- 显示分页信息 -->
  		<div class="row">
  			<!-- 分页文字信息 -->
  			<div class="col-md-6" id="page_info_area">
  				
  			</div>
  			<!-- 分页条信息 -->
  			<div class="col-md-6" id="page_nav_area">
  			
  			</div>
  			
  		</div>
  	</div>
  	<script type="text/javascript">
  		
  		/**
		 * ssm-crud
		 * author:https://github.com/famine-life
		 * Date:2018-11-29
		 */
  		
  		//总记录数
  		var totalRecord;
  		//当前页
  		var currentPage;
  		
  		//1.页面加载完成以后，直接去发送一个ajax请求，要到分页数据
  		$(function(){
  			//去首页
  			to_page(1);
  		});
  		
  		function to_page(pn){
  			$.ajax({
  				url:"${path}/ssm-crud/emps",
  				data:"pn="+pn,
  				type:"GET",
  				success:function(result){
  					//console.log(result);
  					//1.解析并显示员工数据
  					build_emps_table(result);
  					//2.解析并显示分页信息
  					build_page_info(result);
  					//3.解析显示分页数据
  					build_page_nav(result);
  					
  				}
  			
  			});
  		}
  		
  		//构建信息表格
  		function build_emps_table(result){
  			//清空table表格
  			$("#emps_table tbody").empty();
  		
  			var emps = result.extend.pageInfo.list;
  			$.each(emps,function(index,item){
  				//alert(item.empName);
  				var checkBoxTd = $("<td><input type='checkbox' class='check_item'></td>");
  				var emIdTd = $("<td></td>").append(item.empId);
  				var empNameTd = $("<td></td>").append(item.empName);
  				var genderTd = $("<td></td>").append(item.gender=='M'?'男':'女');
  				var mailTd = $("<td></td>").append(item.email);
  				var deptNameTd = $("<td></td>").append(item.department.deptName);
  				/**
  				<button class="btn btn-primary btn-sm">
		  							<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
		  							编辑
	  							</button>
  				**/
  				var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
  								.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
  				//为编辑按钮添加一个自定义的属性，表示当前员工id
  				editBtn.attr("edit-id",item.empId);
  				var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
  								.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
  				//为删除按钮添加一个自定义属性来表示当前删除的员工id
  				delBtn.attr("del-id",item.empId);
  				
  				var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
  				//append方法执行完成以后还是返回原来的元素
  				$("<tr></tr>").append(checkBoxTd)
  						.append(emIdTd)
  						.append(empNameTd)
  						.append(genderTd)
  						.append(mailTd)
  						.append(deptNameTd)
  						.append(btnTd)
  						.appendTo("#emps_table tbody");
  				
  			});
  		}
  		//解析显示分页信息
  		function build_page_info(result){
  		//清空table表格
  			$("#page_info_area").empty();
  			$("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页,总"+
  								result.extend.pageInfo.pages+"页,总"+
  								result.extend.pageInfo.total+"条记录");
  			totalRecord = result.extend.pageInfo.total;
  			//将当前页存于全局变量，后面要用
  			currentPage = result.extend.pageInfo.pageNum;
  		}
  		
  		//解析显示分页条,点击分页要能去下一页
  		function build_page_nav(result){
  			
  			//清空#page_nav_area
  			$("#page_nav_area").empty();
  			
  			var ul = $("<ul></ul>").addClass("pagination");
  			
  			//构建元素
  			var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
  			var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
  			if(result.extend.pageInfo.hasPreviousPage == false){
  				firstPageLi.addClass("disabled");
  				prePageLi.addClass("disabled");
  			}else{
  				//为元素添加点击翻页
	  			firstPageLi.click(function(){
	  				to_page(1);
	  			})
	  			prePageLi.click(function(){
	  				to_page(result.extend.pageInfo.pageNum-1);
	  			})
  			}
  			
  			
  			var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
  			var laststPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
  			if(result.extend.pageInfo.hasNextPage == false){
  				nextPageLi.addClass("disabled");
  				laststPageLi.addClass("disabled");
  			}else{
  				//为元素添加点击翻页
	  			nextPageLi.click(function(){
	  				to_page(result.extend.pageInfo.pageNum+1);
	  			})
	  			laststPageLi.click(function(){
	  				to_page(result.extend.pageInfo.pages);
	  			})
  			}
  			
  			//添加首页和前一页的显示
  			ul.append(firstPageLi).append(prePageLi);
  			
  			//1,2,..5遍历给ul中添加页码提示
  			$.each(result.extend.pageInfo.navigatepageNums,function(index,item){
  				
  				var numLi = $("<li></li>").append($("<a></a>").append(item));
  				if(result.extend.pageInfo.pageNum == item){
  					numLi.addClass("active");
  				}
  				numLi.click(function(){
  					to_page(item);
  				})
  				
  				ul.append(numLi);
  				
  			})
  			//添加下一页和末页的提示
  			ul.append(nextPageLi).append(laststPageLi);
  			//把ul加入到nav
  			var navEle = $("<nav></nav>").append(ul);
  			navEle.appendTo("#page_nav_area");
  			
  		}
  		
  		//清空表单样式及内容
  		function reset_form(ele){
  			$(ele)[0].reset();
  			//清空表单样式
  			$(ele).find("*").removeClass("has-error has-success");
  			$(ele).find(".help-block").text("");
  		}
  		
  		//点击新增弹出模态框，
  		$("#emp_add_modal_btn").click(function(){
  			//清楚表单数据（表单重置）
  			reset_form("#empAddModal form");
  			//发送ajax请求，查出部门信息，显示在下拉列表中
  			getDepts("#empAddModal select");
  			
  			//弹出模态框
  			$("#empAddModal").modal({
  				backdrop:"static"
  			});
  		});
  		
  		//查出所有的部门信息并显示在下拉列表中
  		function getDepts(ele){
  			//清空下拉列表
  			$(ele).empty();
  			$.ajax({
  				url:"${path}/ssm-crud/depts",
  				type:"GET",
  				success:function(result){
  					//{"code":100,"msg":"处理成功",
  					//"extend":{"depts":[{"deptId":1,"deptName":"开发部"},{"deptId":2,"deptName":"测试部"}]}}
  					//console.log(result);
  				
  					//显示部门信息在下拉列表中
  					//$("#empAddModal select").append("");
  					$.each(result.extend.depts,function(){
  						var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId);
  						optionEle.appendTo(ele);
  					});
  				}
  			});
  		}
  		
  		//校验表单数据
  		function validate_add_form(){
  			//1.拿到要检验的数据，使用正则表达式
  			var empName = $("#empName_add_input").val();
  			var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;  //用户名的校验，允许中文，规定区分大小写
  			if(!regName.test(empName)){
  				//alert("用户名为2-5位中文或者6-16位英文和数字的组合");
  				
  				show_validate_msg("#empName_add_input","error","用户名为2-5位中文或者6-16位英文和数字的组合");
  				
  				return false;
  			}else{
  				show_validate_msg("#empName_add_input","success","")
  			}
  			
  			//2.校验邮箱
  			var eamil = $("#email_add_input").val();
  			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
  			if(!regEmail.test(eamil)){
  				//alert("邮箱格式不正确");
  				//应该清空元素之前的样式
  				show_validate_msg("#email_add_input","error","邮箱格式不正确");
  				return false;
  			}else{
  				show_validate_msg("#email_add_input","success","");
  			}
  			return true;
  		}
  		
  		//显示检验结果的提示信息
  		function show_validate_msg(ele,status,msg){
  			//清楚当前元素的校验状态
  			$(ele).parent().removeClass("has-success has-error");
  			$(ele).next("span").text("");
  			if("success"==status){
  				$(ele).parent().addClass("has-success");
  				$(ele).next("span").text(msg);
  				
  			}else if("error" == status){
  				$(ele).parent().addClass("has-error");
  				$(ele).next("span").text(msg);
  				
  			}
  		}
  		
  		//ajax校验用户名是否可用
  		$("#empName_add_input").change(function(){
  			//发送ajax请求校验用户名是否可用
  			var empName = this.value;
  			$.ajax({
  				url:"${path}/ssm-crud/checkuser",
  				data:"empName="+empName,
  				type:"POST",
  				success:function(result){
  					if(result.code=="100"){
  						show_validate_msg("#empName_add_input","success","用户名可用");
  						$("#emp_save_btn").attr("ajax-va","success");
  					}else{
  						show_validate_msg("#empName_add_input","error",result.extend.va_msg);
  						$("#emp_save_btn").attr("ajax-va","error");
  					}	
  				}
  			});
  			
  		});
  		
  		//点击保存，保存员工
  		$("#emp_save_btn").click(function(){
  			//1.模态框中填写的表单数据提交给服务器进行保存
  			//先对要提交给服务器的数据进行校验
  			if(!validate_add_form()){
  				return false;
  			}
  			
  			//1.判断之前的ajax用户名是否成功,如果失败，阻止保存操作
  			if($(this).attr("ajax-va")=="error"){
  				return false;
  			}
  			//2.发送ajax请求保存员工
  		 	$.ajax({
  				url:"${path}/ssm-crud/emp",
  				type:"POST",
  				data:$("#empAddModal form").serialize(),
  				success:function(result){
  					//alert(result.msg);	//弹出提示框
  					
  					if(result.code == 100){
  						//员工保存成功，
	  					//1.关闭模态框
	  					$("#empAddModal").modal("hide")
	  					//2.来到最后一页,显示刚才保存的数据
	  					//发送ajax请求显示最后一页数据即可
	  					to_page(totalRecord);
  					}else{
  						//显示失败信息
  						//console.log(result);
  						//有哪个字段的错误信息就显示哪个字段信息
  						if(undefined != result.extend.errorFields.email){
  							//显示邮箱错误信息系
  							show_validate_msg("#email_add_input","error",result.extend.errorFields.email);
  						}
  						if(undefined != result.extend.errorFields.empName){
  							//显示员工名字错误信息
  							show_validate_msg("#empName_add_input","error",result.extend.errorFields.empName);
  						}
  					}
  					
  					
  					
  				}
  			}); 
  			
  		});
  		
  		//不可以直接用onclick, 按钮还没创建
  		//点击修改，修改员工信息
  		$(document).on("click",".edit_btn",function(){
  			//alert("edit");
  			
  			//1.查出部门信息，并显示
  			//发送ajax请求，查出部门信息，显示在下拉列表中
  			getDepts("#empUpdateModal select");
  			
  			//2.查出员工信息，显示员工信息
  			getEmp($(this).attr("edit-id"));
  			
  			//3.把员工的id传递给模态框的更新按钮
  			$("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));
  			
  		  	//弹出模态框
  			$("#empUpdateModal").modal({
  				backdrop:"static"
  			});
  		})
  		
  		//为更新方法，添加查询员工信息的方法
  		function getEmp(id){
  			$.ajax({
  				//0.查出员工信息
  				url:"${path}/ssm-crud/emp/"+id,
  				tyupe:"GET",
  				success:function(result){
  					//console.log(result);
  					var empDate = result.extend.emp;
  					$("#empName_update_static").text(empDate.empName);
  					$("#email_update_input").val(empDate.email);
  					$("#empUpdateModal input[name=gender]").val([empDate.gender]);
  					$("#empUpdateModal select").val([empDate.dId])
  					
  				}
  			})
  		}
  		
  		//点击更新,更新员工信息
  		$("#emp_update_btn").click(function(){
  			//1.校验邮箱
  			var eamil = $("#email_update_input").val();
  			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
  			if(!regEmail.test(eamil)){
  				show_validate_msg("#email_add_input","error","邮箱格式不正确");
  				return false;
  			}else{
  				show_validate_msg("#email_add_input","success","");
  			}
  			
  			//2.发送ajax请求保存员工的更新
  			$.ajax({
  				url:"${path}/ssm-crud/emp/"+$(this).attr("edit-id"),
  				type:"PUT",
  				data:$("#empUpdateModal form").serialize(),
  				success:function(result){
  					//alert(result.msg);
  					//1.关闭模态框
  					$("#empUpdateModal").modal("hide");
  					//2.回到本页面
  					to_page(currentPage);
  				
  				}
  			})
  			
  		})
  		
  		
  		$(document).on("click",".delete_btn",function(){
  			//1.弹出确认删除对话框
  			var empName = $(this).parents("tr").find("td:eq(2)").text();
  			var empId = $(this).attr("del-id");
  			if(confirm("确认删除【"+empName+"】吗？")){
  				//确认，发送ajax请求删除即可
  				$.ajax({
  					url:"${path}/ssm-crud/emp/"+empId,
  					type:"DELETE",
  					success:function(result){
  						alert(result.msg);
  						//console.log("当前页数",currentPage);
  						to_page(currentPage);
  					}
  				})
  			
  			}
  			
  		})
		  		
  		//完成全选按钮
  		$("#check_all").click(function(){
  			//alert($(this).prop("checked"))
  			//可以简单的理解为，点击全选按钮，把列表的选择按钮选择状态和全选按钮一致
  			$(".check_item").prop("checked",$(this).prop("checked"));
  			
  		})
  		
  		//如果列表被全部勾上，把全选按钮也打钩
  		$(document).on("click",".check_item",function(){
  			//判断当前选择中的元素是不是5个
  			var flag = $(".check_item:checked").length==$(".check_item").length
  			$("#check_all").prop("checked",flag);
  		})
  		
  		//点击全部删除，就批量删除
  		$("#emp_delete_all_btn").click(function(){
  			var empNames = "";
  			var del_idstr = "";
  			$.each($(".check_item:checked"),function(){
  				empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
  				//组装员工id字符串
  				del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"-";
  			});
  			//去除empNames最后的逗号
  			empNames = empNames.substring(0,empNames.length-1);
  			//去除del_idstr最后的-号
  			del_idstr = del_idstr.substring(0,del_idstr.length-1);
  			if(confirm("确认删除【"+empNames+"】吗？")){
  				//发送ajax请求删除
  				$.ajax({
  					url:"${path}/ssm-crud/emp/"+del_idstr,
  					type:"DELETE",
  					success:function(result){
  						alert(result.msg);
  						//回到当前页面
  						to_page(currentPage);
  						
  					}
  				
  				})
  				
  			}
  			
  		})
  		
  	</script>
  </body>
</html>
