<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "newmembership.NewmemberDAO" %>
<%@ page import = "newmembership.NewmemberDTO" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>정보 변경 pro</title>
	</head>
	<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String number = request.getParameter("number");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String email_domain = request.getParameter("email_domain");
		String email_click = request.getParameter("email_click");
		String birth_1 = request.getParameter("birth_yy");
		String birth_2 = request.getParameter("birth_mm");
		String birth_3 = request.getParameter("birth_dd");
		String birth = birth_1 + birth_2 + birth_3;
		
		if(email_domain.equals("")){
			email = email + "@" + email_click;
		}else{
			email = email + "@" + email_domain;
		}

		NewmemberDTO upmember = (NewmemberDTO) session.getAttribute("user");
		NewmemberDAO dao = new NewmemberDAO();	
		dao.updatemember(id, pass, name, gender, birth, email, number, address);
		session.invalidate();
		
		%>
			<script type="text/javascript">
			alert("회원수정완료!! 다시 로그인해주세요.");
			location.href = 'LoginForm.jsp';
			</script>
	
	</body>
</html>