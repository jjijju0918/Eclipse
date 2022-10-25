<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>	
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<nav class = " navbar-dark bg-info">
	<div class = "container">
		<div class="d-flex justify-content-between"> 
		<div class = "navbar-header">
			<a class = "navbar-brand" href = "List.jsp">JSP웹게시판 </a>
		</div>
		
		<!-- 하단에 폰트색바꾸기 -->
		<font color = "white">
			<%if (session.getAttribute("user")==null){%>
				<a href="LoginForm.jsp"  class = "navbar-brand">로그인</a>
			<% }else{ %>
				<a href="Logout.jsp"  class = "navbar-brand">로그아웃</a>
				<a href="information.jsp" class ="navbar-brand">정보변경</a>
			<% } %>
			<a href="List.jsp"  class = "navbar-brand">게시판</a>
		</font>
	</div>
	</div>
</nav>