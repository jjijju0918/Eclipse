<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 입력 값 DB 저장하기</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<%
		request.setCharacterEncoding("utf-8");
	//사용자가 입력한 내용을 가져와서 변수에 저장
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
		
		Statement stmt = null;
		
		try{
			String sql="insert into member values('" + id + "','"+
						passwd + "','" + name + "')";
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			out.println("member 테이블 삽입성공");
		}catch(SQLException ex){
			out.println("삽입실패<br>");
			out.println("SQLException : "+ex.getMessage());
		}finally{
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}
	%>
</body>
</html>