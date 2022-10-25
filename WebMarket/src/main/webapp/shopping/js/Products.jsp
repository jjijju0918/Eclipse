<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import= "java.util.ArrayList" %>
<%@ page import= "com.dto.Product" %>
<%@ page import ="java.sql.*" %>
<%@page import = "java.text.DecimalFormat" %>
<%
	request.setCharacterEncoding("UTF-8");
	DecimalFormat dFormat = new DecimalFormat("###,###");
%>
<!DOCTYPE html>
<jsp:useBean id = "productDAO" class = "com.dao.ProductRepository" scope="session"/> 
<html>
	<head>
		<link rel = "stylesheet" 
			href= "http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
		<title>상품목록</title>
	</head>
	<body>
		<jsp:include page="menu.jsp"/>
		<div class = "jumbotron">
			<div class = "container">
				<h1 class = "display-3">상품목록</h1>
			</div> 
   		</div>
   		<%
   			ArrayList<Product> listProducts = productDAO.getAllProducts();
   		%>
   		<c:set var="listOfProducts" value="<%=listProducts%>" />
		<div class="container">
			<div class="row" align="center">
				<%@ include file="dbconn.jsp"%>
				<%
					
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = "select * from product";
					
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
			
				%>
				<div class="col-md-4">
						<img alt="이미지" src="resources/images/<%=rs.getString("filename") %>" style="width:50%">
						<h3><%=rs.getString("pname")%></h3>
						<p><%=rs.getString("description") %></p>
						<p><%=dFormat.format(Integer.parseInt(rs.getString("unitPrice"))) %>원</p>
						<p><a href="./product.jsp?id=<%=rs.getString("productID")%>"class = "btn btn-secondary">상세정보 &raquo;></a>	
				</div>
				<%
				}
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				%>
			</div>
			<hr>
		</div>
		<jsp:include page="footer.jsp"/>
	</body>
</html>