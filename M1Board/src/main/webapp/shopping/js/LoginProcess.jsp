<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "newmembership.NewmemberDAO" %>
<%@ page import = "newmembership.NewmemberDTO" %>
<%@ page import = "membership.MemberDTO" %>
<%@ page import = "membership.MemberDAO" %>

<%
	String userId = request.getParameter("user_id");
	String userPwd = request.getParameter("user_pw");
	String adminId = request.getParameter("uid");
	String adminPwd = request.getParameter("upass");
	
	NewmemberDAO dao = new NewmemberDAO();
	NewmemberDTO newmemberDTO = dao.getNewmemberDTO(userId, userPwd);
	dao.close();
	
	MemberDAO mdao = new MemberDAO();
	MemberDTO memberDTO = mdao.getMemberDTO(adminId,adminPwd);
	
	if(newmemberDTO.getId() != null || memberDTO.getId() != null){
		session.setAttribute("admin", memberDTO);
		session.setAttribute("user", newmemberDTO);
		response.sendRedirect("LoginForm.jsp");
	} else {
		request.setAttribute("LoginErrMsg", "로그인오류입니다");
		request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
	}
%>
