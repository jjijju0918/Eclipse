<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import= "com.oreilly.servlet.*" %>
<%@ page import = "com.oreilly.servlet.multipart.*" %>
		<%

			Connection conn = null;
			
			String url = "jdbc:mysql://localhost:3306/jspWebMarket";
			String user = "root";
			String password = "1234";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		%>
		
		<% 
			request.setCharacterEncoding("UTF-8");
			
			String filename="";
			String realFolder = "C:\\Users\\YJ\\git\\repository2\\M1Board\\src\\main\\webapp\\shopping\\js\\resources\\images";
			
			MultipartRequest multi = new MultipartRequest(request,realFolder,5*1024*1024,"utf-8",new DefaultFileRenamePolicy());
			
			String productid = multi.getParameter("ProductID"); // 상품코드
			String name = multi.getParameter("pname"); // 상품명
			int unitPrice = Integer.parseInt(multi.getParameter("unitPrice")); //상품가격
			String description = multi.getParameter("comment"); //설명;
			String maufacture = multi.getParameter("maufacture"); //제조사
			String category = multi.getParameter("category"); //분류
			int unitsInStock = Integer.parseInt(multi.getParameter("unitsInStock")); //재고수
			String condition = multi.getParameter("condition");
			
			
			Enumeration<?> files = multi.getFileNames();
			String fname = (String) files.nextElement();
			String fName = multi.getOriginalFileName(fname);
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from product where productID = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productid);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if(fName != null){
					sql = "update product set pname = ?, unitPrice=? , description = ?, maufacture = ?,"
							+ "category=? , unitsInStock=?, conditions = ?,  filename = ? where productID = ?";
					pstmt= conn.prepareStatement(sql);
					pstmt.setString(1,name);
					pstmt.setInt(2, unitPrice);
					pstmt.setString(3, description);
					pstmt.setString(4, maufacture);
					pstmt.setString(5, category);
					pstmt.setInt(6, unitsInStock);
					pstmt.setString(7, condition);
					pstmt.setString(8, fName);
					pstmt.setString(9,productid);
					pstmt.executeUpdate();
				}
				else {
					sql =  "update product set pname = ?, unitPrice=? , description = ?, maufacture = ?,"
							+ "category=? , unitsInStock=?, conditions = ? where productID = ?";
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1,name);
					pstmt.setInt(2, unitPrice);
					pstmt.setString(3, description);
					pstmt.setString(4, maufacture);
					pstmt.setString(5, category);
					pstmt.setInt(6, unitsInStock);
					pstmt.setString(7, condition);
					pstmt.setString(8,productid);
					pstmt.executeUpdate();
				}
			}
			
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
			
			response.sendRedirect("editProduct.jsp?edit=update");
%>
