<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "newmembership.NewmemberDAO" %>
<%@ page import = "newmembership.NewmemberDTO" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>탈퇴하기</title>
	</head>
	<body>
	<% 
		request.setCharacterEncoding("utf-8");
		String userId = request.getParameter("user");
		NewmemberDTO upmember = (NewmemberDTO) session.getAttribute("user");
		NewmemberDAO dao = new NewmemberDAO();
		
		int succ = dao.Delete(upmember.getId());
		if(succ == 1){
			session.invalidate();
	%>
	<script type="text/javascript">
		alert("탈퇴완료!! 로그인화면으로 이동합니다.");
		location.href = 'LoginForm.jsp';
	</script>
	<%
		}else{
	%>
	<script type="text/javascript">
		alert("탈퇴실패했습니다. 다시시도해주세요.");
		history.back();
	</script>
	<%
		}
	%>
	</body>
</html>