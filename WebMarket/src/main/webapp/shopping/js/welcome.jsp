<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import="java.util.Locale" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("hh:mm a",Locale.ENGLISH);
%>
<!DOCTYPE html>
<jsp:useBean id = "productDAO" class = "com.dao.ProductRepository" scope="session"/> 
<html>
	<head>
		<link rel = "stylesheet" 
			href= "http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
		<title>상품등록</title>
	</head>	
	<body>
		<jsp:include page="menu.jsp"/>
		<div class = "jumbotron">
			<div class = "container">
				<h1 class = "display-3">웹 쇼핑몰에 오신 것을 환영합니다</h1>
			</div> 
   		</div>
  <%! 
      String tagline = "Welcome to Web Market!";
   %>
   <div class = "container">
   		<div class = "text-center">
   			<h5>
   				<%= tagline %>
   			</h5>
   			<h6>
   				현재 접속 시각 : <%= sf.format(nowTime) %>
   			</h6>
   		</div>
   		<hr>
   </div>
 
</body>
</html>