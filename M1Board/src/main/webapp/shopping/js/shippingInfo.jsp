<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel = "stylesheet" 
			href= "http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
		<title>배송 정보</title>
	</head>
	<body>
		<jsp:include page="Link.jsp"/>
		
		<div class = "jumbotron">
			<div class = "container">
				<h1 class = "display-3">배송 정보</h1>
			</div>
   		</div>
	<div class="container">
			<form action="./processShippingInfo.jsp" class ="form-horizontal" method="post">
				<input type = "hidden" name = "cartid" value="<%=request.getParameter("cartid")%>"/>
				
				<div class="form-group row">
					<lebel class="col-sm-2">성명</lebel>
					<div class="col-sm-3">
						<input type = "text" name = "name" class="form-control" placeholder = "성명"/>
					</div>
				</div>
				
				<div class="form-group row">
					<lebel class="col-sm-2">배송일</lebel>
					<div class="col-sm-3">
						<input type = "text" name = "shoppingDate" class="form-control" placeholder = "년도/월/일"/>
					</div>
				</div>
				
				<div class="form-group row">
					<lebel class="col-sm-2">국가명</lebel>
					<div class="col-sm-3">
						<input type = "text" name = "countyu" class="form-control" placeholder = "국가명"/>
					</div>
				</div>
				
				<div class="form-group row">
					<lebel class="col-sm-2">우편번호</lebel>
					<div class="col-sm-3">
						<input type = "text" name = "zipCode" class="form-control" placeholder = "우편번호"/>
					</div>
				</div>
				
				<div class="form-group row">
					<lebel class="col-sm-2">주소</lebel>
					<div class="col-sm-3">
						<input type = "text" name = "addressName" class="form-control" placeholder = "주소"/>
					</div>
				</div>
				
				<div class="form-group row">
					<div class="col-sm-offset2 col-sm-10">
						<a href="./cart.jsp?cartid=<%=request.getParameter("cartid")%>" class="btn btn-secondary" role="button">이전</a>
						<input type ="submit" class="btn btn-primary" value="등록"/>
						<a href="checkOutCancelled.jsp" class="btn btn-secondary">취소</a>
					</div>
				</div>
			</form>
		</div>
		
		<jsp:include page="footer.jsp"/>
	

	</div>
</html>