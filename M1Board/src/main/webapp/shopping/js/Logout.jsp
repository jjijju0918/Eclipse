<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그아웃 처리</title>
	</head>
	<body>
	<%
			// 로그아웃 메시지창 및 로그아웃 화면 나오게 하기
		session.invalidate();//세션의 모든 속성 제거
		
		response.sendRedirect("List.jsp");
	
	%>
	</body>
</html>