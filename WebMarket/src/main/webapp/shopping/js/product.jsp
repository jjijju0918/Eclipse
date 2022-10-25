<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<head>
		<link rel = "stylesheet" 
		href= "http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
	</head>
	<body>
	
		<jsp:include page="menu.jsp"/>
		<%!String gteering = "상세정보"; %>
		<div class = "jumbotron">
			<div class = "container">
				<h1 class = "display-3">상품 정보</h1>
			</div> 
   		</div>
   		
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
	 		<div class= "col-md-5">
	 			<img alt="이미지" src="resources/images/<%=rs.getString("filename") %>" style="width:50%">
	 		</div>
	 		<div class = "col-md-6">
	 			<h3><%=rs.getString("pname") %></h3>
	 			<p><%=rs.getString("description") %>
	 			<p><b>상품코드</b> : <span class="badge badge-danger"> <%=rs.getString("productID")%> </span></p>
	 			<p><b>제조사:</b> : <%=rs.getString("maufacture") %>
	 			<p><b>분류</b>: <%=rs.getString("category") %>
	 			<p><b>재고수</b>: <%=rs.getString("UnitsInStock") %>
	 			<h3><%=dFormat.format(Integer.parseInt(rs.getString("unitPrice"))) %>원</h3>
	 			
	 			<p> <form name="addForm" action="./addCart.jsp?id=<%=rs.getString("productID")%>" method = "post">
	 		
	 			<a href="#" class = "btn btn-info" style="background-color: #337ab7" onclick="addToCart()" > 상품주문 &raquo; </a>
	 			<a href="./cart.jsp?" class = "btn btn-warning">장바구니 &raquo; </a>
	 			<a href="./Products.jsp" class = "btn btn-secondary">상품목록 &raquo; </a>

	 			</form>
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
	 
	 <script type = "text/javascript">
	 //장바구니 추가 핸들러함수
	 	function addToCart(){
	 		if(confirm("해당 상품을 장바구니에 추가하겠습니까?")){
	 			document.addForm.submit();
	 			confirm("상품이 추가되었습니다.")
	 		} else {document.addForm.reset();}
	 	}
	 
	 </script>
	</body>
</html>