<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "model1.board.BoardDAO" %>
<%@ page import="model1.board.BoardDTO" %>    
<%@ page import="model1.board.BoardDAO" %>  
<%@ page import = "java.io.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>수정하기</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("utf-8");

			String num = request.getParameter("num");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			BoardDAO dao = new BoardDAO();
			int result = dao.update(num, title, content);
			dao.close();
			
			response.sendRedirect("List.jsp");
		%>

	</body>
</html>