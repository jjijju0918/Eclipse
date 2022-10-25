<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<%! String greeting = "주문 취소";%>
	
	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3">
				<%= greeting %>
			</h1>		
		</div>
	</div>
	
	<div class = "container">
		<h2 class="alert alert-danger">주문이 취소되었습니다.</h2>
	</div>
	
	<div class = "container">
		<a href="Products.jsp" class="btn btn-secondary">&raquo; 상품 목록</a>
	</div>
	
