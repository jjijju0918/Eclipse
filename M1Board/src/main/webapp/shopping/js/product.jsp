<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "com.dto.Product" %>
<%@ page import = "com.dao.ProductRepository" %>
<%@ page import = "java.sql.*" %>
<%@page import = "java.text.DecimalFormat" %>

<!DOCTYPE html>

<%
	request.setCharacterEncoding("UTF-8");
	DecimalFormat dFormat = new DecimalFormat("###,###");
%>
<html>
<style>
		.prewrap{
			width: 550px;
			font-size: 15px;
			overflow-wrap: anywhere;
		}
		img{
			width: 300px;
			height:300px; 
			margin-top: 10px;
		}
</style>
<link rel = "stylesheet" href= "http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >

  <%if(session.getAttribute("user") == null){ %>
		<script type = "text/javascript">
	 //장바구니 추가 핸들러함수
	 	function addToCart(){
	 		if(confirm("로그인 후 이용해주세요.")){
			}
	 }
	 	</script>
	 	<%} else {%>	
	 	
	 	<script type = "text/javascript">
	 	function addToCart(){
	 		if(confirm("해당 상품을 장바구니에 추가하겠습니까?")){
	 			document.addForm.submit();
	 			confirm("상품이 추가되었습니다.")
	 		} else {document.addForm.reset();}
	 	}
	 	</script> 
	 	<%}%>

	<body>
   		
   		   		<%
					Connection conn = null;
		
					String url = "jdbc:mysql://localhost:3306/jspWebMarket";
					String user = "root";
					String password = "1234";
		
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection(url, user, password);
   					
   				%>
   				
   				<% 
					String productid = request.getParameter("id");
					
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = "select * from product where productID=?";
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, productid);
					
					rs = pstmt.executeQuery();
					
					if(rs.next()){
			
				%>
				
		
	 <div class = "container">
	 	<div class="row">
	 		<div class= "col-md-5" style="text-align: center;">
	 			<img alt="이미지" src="resources/images/<%=rs.getString("filename") %>" name="imgs">
	 		</div>
	 		<div class = "col-md-6">
	 			<h1 style="font-weight: bold; "><%=rs.getString("pname") %></h1>
	 			<p class="prewrap" style="margin-bottom: 20px;"><%=rs.getString("description") %>
	 			<p><b style=" font-size: 20px;" >상품코드</b> : <span class="badge badge-danger"> <%=rs.getString("productID")%> </span></p>
	 			<p><b style=" font-size: 20px;">제조사</b> : <%=rs.getString("maufacture") %>
	 			<p><b style=" font-size: 20px;">분류</b>: <%=rs.getString("category") %>
	 			<p><b style=" font-size: 20px;">재고수</b>: <%=rs.getString("UnitsInStock") %>
	 			<h2><%=dFormat.format(Integer.parseInt(rs.getString("unitPrice"))) %>원</h2>
	 			
	 			<p> <form name="addForm" action="./addCart.jsp?id=<%=rs.getString("productID")%>" method = "post">
	 					<a href="#" class="btn btn-outline-dark" onclick="addToCart()" style="padding: 6px 80px; margin-top: 50px;" > 상품주문 &raquo; </a>
	 			</form>
	 		</div>
	 		<% 
					}
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
	 		
	 		%>
	 	</div>
	 </div>
	</body>
</html>