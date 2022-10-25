<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.dto.Product" %>
<%@ page import = "com.dao.ProductRepository" %>
<%@ page import= "com.oreilly.servlet.*" %>
<%@ page import = "com.oreilly.servlet.multipart.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.io.*" %>
<%@ page import ="java.sql.*" %>

<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<jsp:useBean id = "productDAO" class = "com.dao.ProductRepository" scope="session"/> 
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		
		<% 
			request.setCharacterEncoding("UTF-8");
		
			String filename="";
			String realFolder = "D:\\gg\\eclipse_pro\\WebMarket\\src\\main\\webapp\\shopping\\js\\resources\\images";
			
			MultipartRequest multi = new MultipartRequest(request,realFolder,5*1024*1024,"utf-8",new DefaultFileRenamePolicy());
			
			String productid = multi.getParameter("ProductID"); // 상품코드
			String name = multi.getParameter("name"); // 상품명
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
			String sql = "insert into product values(?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,productid);
			pstmt.setString(2,name);
			pstmt.setInt(3, unitPrice);
			pstmt.setString(4,description);
			pstmt.setString(5, maufacture);
			pstmt.setString(6, category);
			pstmt.setInt(7, unitsInStock);
			pstmt.setString(8, condition);
			pstmt.setString(9, fName);
			
			pstmt.executeUpdate();
			System.out.println("상품 등록 완료");
			
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
			
			response.sendRedirect("Products.jsp");
		%>		
	</body>
</html>