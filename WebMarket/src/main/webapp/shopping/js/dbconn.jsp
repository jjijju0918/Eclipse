<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*" %>

<!DOCTYPE html>
<!-- 상품조회,등록,수정,삭제하기(db 연동) -->
<%

			Connection conn = null;
			
			String url = "jdbc:mysql://localhost:3306/jspWebMarket";
			String user = "root";
			String password = "1234";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		


%>