<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "newmembership.NewmemberDAO" %>
<%@ page import = "newmembership.NewmemberDTO" %>

<%
	String userId = request.getParameter("user_id");
	String userPwd = request.getParameter("user_pw");
	
	NewmemberDAO dao = new NewmemberDAO();
	NewmemberDTO newmemberDTO = dao.getNewmemberDTO(userId, userPwd);
	dao.close();
	
	if(newmemberDTO.getId() != null){
		session.setAttribute("user", newmemberDTO);
		response.sendRedirect("LoginForm.jsp");
	}else{
		request.setAttribute("LoginErrMsg", "로그인오류입니다");
		request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
	}
%>
