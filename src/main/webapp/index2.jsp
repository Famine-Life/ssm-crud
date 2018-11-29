<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:forward page="/emps"></jsp:forward>


<%-- <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>index.jsp</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- 引入jquery -->
	<script type="text/javascript" src="static/js/jquery-1.12.4.js"></script>
	<!-- 引入css、js -->
	<link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	
  </head>
  
  <body>
  	<button type="button" class="btn btn-success">按钮</button>
  	
  </body>
</html>
 --%>