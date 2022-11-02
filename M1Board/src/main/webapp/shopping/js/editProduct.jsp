<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.text.DecimalFormat" %>
<%@ page import = "com.dto.Product" %>
<%@ page import= "java.sql.*" %>

<%
	request.setCharacterEncoding("UTF-8");
	String edit = request.getParameter("edit"); //메뉴 수정 클릭시 값받음
	DecimalFormat dFormat = new DecimalFormat("###,###");
%>
<!DOCTYPE html>
<html>	
<jsp:useBean id = "productDAO" class = "com.dao.ProductRepository" scope="session"/> 
<html>
	<head>
		<link rel = "stylesheet" 
			href= "http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
		<title>상품수정</title>
		<style type="text/css">
			 .prewrap {
            	width: 330px;
            	height: 40px;
            	overflow:hidden;
            	word-break: break-word;
            	text-overflow:ellipsis;
            	font-size: 15px;
            	display: -webkit-box;
            	-webkit-line-clamp: 2;
            	-webkit-box-orient: vertical;
           }
		
		</style>
	</head>	
	<body>
		<jsp:include page="Link.jsp"/>
		<div class = "jumbotron">
			<div class = "container">
				<h1 class = "display-3"><b>상품수정</b></h1>
			</div> 
   		</div>
   		<div class="container">
   			<div class = "row" align = "center">
   				
   		<%
					Connection conn = null;
		
					String url = "jdbc:mysql://localhost:3306/jspWebMarket";
					String user = "root";
					String password = "1234";
		
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection(url, user, password);
   		
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = "select * from product";
					
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					
					while(rs.next()){
			
				%>
   		
   		<div class= "col-md-4" style="margin-bottom: 50px;">
   			<img alt="이미지" src="resources/images/<%=rs.getString("filename") %>"  style="width: 200px; height:200px; margin-top: 10px;">
   			<h3 style="font-weight: bold;"><%=rs.getString("pname") %></h3>
			<p class="prewrap"><%=rs.getString("description") %></p>
			<p><%=dFormat.format(Integer.parseInt(rs.getString("unitPrice"))) %>원</p>
   			<p><%
   				if(edit.equals("update")){
   			%>	<a href="./updateProduct.jsp?id=<%=rs.getString("productID") %>" class="btn btn-success" >수정&raquo;</a>
			
			<%
   				} else if(edit.equals("delete")){
		%> 	
				<a href="#"onclick="deleteConfirm('<%=rs.getString("productID")%>')" class="btn btn-danger" >삭제&raquo;</a>
				<%
   				}
			%>
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
   		
   		<script type="text/javascript">
   			function deleteConfirm(id){
   				if(confirm("해당 상품을 삭제합니다!") == true){
   					console.log(id);
   					location.href="./deleteProduct.jsp?id="+id;
   				} else return;
   			}
   		
   		</script>
	</body>
</html>