<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*" %>
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
						sql = "delete from product where productID=?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, productid);
						pstmt.executeUpdate();
					} else {
						out.println("일치하는 상품이 없습니다.");
					}
					
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
					
					response.sendRedirect("editProduct.jsp?edit=delete");
						
						
				%>