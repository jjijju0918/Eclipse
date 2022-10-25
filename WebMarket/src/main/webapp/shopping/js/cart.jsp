<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import = "java.text.DecimalFormat" %>
<%@ page import ="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	// 세션의 고유 아이디를 가져온다.
	String cartId = session.getId();
	request.setCharacterEncoding("UTF-8");
	DecimalFormat dFormat = new DecimalFormat("###,###");
%>
<!DOCTYPE html>
<html>
	<head>
		<link rel = "stylesheet" 
			href= "http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
		<title>장바구니</title>
	</head>
	<body>
		<jsp:include page="menu.jsp"/>
		
		<div class = "jumbotron">
			<div class = "container">
				<h1 class = "display-3">장바구니</h1>
			</div>
   		</div>	
   		
		<div class="container">
			<div class="row">
				<table width="100%">
					<tr>
						<td align="left">
						<a href="deleteCart.jsp?cartId=<%=cartId%>" class="btn btn-danger">삭제하기</a> <!-- 임시페이지 -->
						</td>
						<td align="right">
						<a href="shippingInfo.jsp?cartid=<%=cartId %>" class="btn btn-success">주문하기</a>
					</td>
				</tr>
			</table> 
		</div>
		<div style="padding-top:50px;">
			<table class="table table-hover">
				<tr>
					<th>상품</th>
					<th>가격</th>
					<th>수량</th>
					<th>소계</th>
					<th>비고</th>
				</tr>
				<%@ include file="dbconn.jsp"%>
				
				<%
				
				ArrayList<Product> cartList  = (ArrayList<Product>)session.getAttribute("cartlist");
				
				if(cartList  == null){
					cartList  = new ArrayList<Product>();
				}
				
				int sum = 0;
				for(int i=0; i<cartList.size();i++){
					Product product = cartList.get(i);
					
					int total = product.getUnitPrice() * product.getQuantity();
					sum += total;
			
				%>
					<tr>
						<td><%=product.getProductID()%> - <%=product.getPname()%></td>
						<td><%=dFormat.format(product.getUnitPrice())%></td>
						<td><%=product.getQuantity()%></td>
						<td><%=dFormat.format(total)%></td>  
						<td><a href="removeCart.jsp?cartId=<%=product.getProductID()%>" class="btn btn-danger">삭제</a></td>
					</tr>
				<%
				}
					
					
			%>
		
				<tr>
					<th></th>
					<th></th>
					<th>총액</th>
					<th><%=dFormat.format(sum)%></th>
					<th></th>
				</tr>
			</table>
			<a href="Products.jsp" class="btn btn-secondary">&raquo; 쇼핑 계속하기</a>
		</div>
		<hr/>
	</div>
		<jsp:include page="footer.jsp"/>
	</body>
</html>