<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 입력 값 DB 저장하기</title>
</head>
<body>
	<form method="post" action="insert_process.jsp">
		<p>아이디 : <input type="text" name="id">
		<p>비밀번호 : <input type="text" name="passwd">
		<p>이름 : <input type="text" name="name">
		<p><input type="submit" value="전송">
	</form>
</body>
</html>