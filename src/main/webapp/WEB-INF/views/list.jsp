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
  				<button class="btn btn-primary">新增</button>
  				<button class="btn btn-danger">删除</button>
  			</div>
  		</div>
  		<!-- 显示表格数据 -->
  		<div class="row">
  			<div class="col-md-12">
  				<table class="table table-hover">
  					<tr>
  						<th>#</th>
  						<th>empName</th>
  						<th>gender</th>
  						<th>email</th>
  						<th>deptName</th>
  						<th>操作</th>
  					</tr>
  					<c:forEach items="${pageInfo.list }" var="emp">
  						<tr>
	  						<th>${emp.empId }</th>
	  						<th>${emp.empName }</th>
	  						<th>${emp.gender=="M"?"男":"女" }</th>
	  						<th>${emp.email }</th>
	  						<th>${emp.department.deptName}</th>
	  						<th>
	  							<button class="btn btn-primary btn-sm">
		  							<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
		  							编辑
	  							</button>
	  							<button class="btn btn-danger btn-sm">
		  							<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
		  							删除
	  							</button>
	  						</th>
  						</tr>
  					</c:forEach>
  					
  				</table>
  			</div>
  		</div>
  		<!-- 显示分页信息 -->
  		<div class="row">
  			<!-- 分页文字信息 -->
  			<div class="col-md-6">
  				当前${pageInfo.pageNum }页,总${pageInfo.pages }页,总${pageInfo.total }条记录
  			</div>
  			<!-- 分页条信息 -->
  			<div class="col-md-6">
  				<nav aria-label="Page navigation">
				  <ul class="pagination">
				  <li><a href="${path }/ssm-crud/emps?pn=1">首页</a></li>
				  <!-- 判断是否有上一页，以便显示点击按钮 -->
				  <c:if test="${pageInfo.hasPreviousPage }">
				  	<li>	
				      <a href="${path }/ssm-crud/emps?pn=${pageInfo.pageNum-1 }" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				  </c:if>
				  	<!-- 遍历页码 -->
					<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
						<c:if test="${page_Num == pageInfo.pageNum }">
							<li class="active"><a href="#">${page_Num }</a></li>
						</c:if>
						<c:if test="${page_Num != pageInfo.pageNum }">
							<li><a href="${path }/ssm-crud/emps?pn=${page_Num }">${page_Num }</a></li>
						</c:if>
					</c:forEach>	    
				    <!-- 判断是否有下一页 -->
				    <c:if test="${pageInfo.hasNextPage }">
				    <li>
				      <a href="${path }/ssm-crud/emps?pn=${pageInfo.pageNum+1 }" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				    </c:if>
				    
				    <li><a href="${path }/ssm-crud/emps?pn=${pageInfo.pages }">末页</a></li>
				  </ul>
				</nav>
  			</div>
  			
  		</div>
  	</div>
  </body>
</html>
