<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "newmembership.NewmemberDAO" %>
<%@ page import = "java.io.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입pro</title>
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
		
		String birth_1 = request.getParameter("birth_yy");
		String birth_2 = request.getParameter("birth_mm");
		String birth_3 = request.getParameter("birth_dd");
		String birth = birth_1 + birth_2 + birth_3;
		
		String email = request.getParameter("email");

		
	
		if (id == null || pass == null || name == null || gender == null || birth == null || 
			email == null || address == null) {
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");	
			
		} else {
			NewmemberDAO dao = new NewmemberDAO();
			int result = dao.join(id, pass, name, gender, birth, email, number, address);
			if(result == 1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
			 	script.println("alert('회원가입에 실패했습니다.')");
				script.println("history.back()"); //이전 페이지로 돌려보냄(join 페이지)
				script.println("</script>"); 
				
			} else if(result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>location.href='LoginForm.jsp';</script>");
			
			} else if(result == 0){
				PrintWriter script = response.getWriter();
				script.println("<script>");
			 	script.println("alert('중복된 아이디가 있습니다.')");
				script.println("history.back()"); //이전 페이지로 돌려보냄(join 페이지)
				script.println("</script>"); 
			}
		}
		
	%>
		
	</body>
</html>