<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href= "http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
<title>Insert title here</title>
</head>
<body>
	<nav class = "navbar navbar-expand navbar-dark bg-info"> 
		<div class = "container">
			<div class = "navbar-header">
				<a class = "navbar-brand" href = "welcome.jsp">Home</a>
			</div>
			
			<div>
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a href="Products.jsp" class="nav-link">상품목록</a>
					<li class="nav-item"><a href="addProduct.jsp" class="nav-link">상품등록</a>
					<li class="nav-item"><a href="editProduct.jsp?edit=update" class="nav-link">상품수정</a>
					<li class="nav-item"><a href="editProduct.jsp?edit=delete" class="nav-link">상품삭제</a>
				</ul>
			</div>
		</div>
	</nav>
	
</body>

</html>