<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "newmembership.NewmemberDAO" %>
<%@ page import = "newmembership.NewmemberDTO" %>
<%@ page import = "newmembership.NewmemberVO" %>

<%
	String userId = request.getParameter("user_id");
	String userPwd = request.getParameter("user_pw");
	
	NewmemberDAO dao = new NewmemberDAO(); // NewmemberDAO 객체를 생성 
	NewmemberDTO newmemberDTO = dao.getNewmemberDTO(userId, userPwd); // 만약에 DB에 해당 ID, PW가 있으면 사용자 정보 객체를 반환
	dao.close();
	
	if(newmemberDTO.getId() != null){ // 얘는 DB에 정보가 있다.
		if(newmemberDTO.getId().equals(NewmemberVO.getAdmin_id())){ // 로그인 한 사용자의 ID가 어드민 ID랑 같다면
			session.setAttribute("admin", true);
		}else {
			session.setAttribute("admin", false);
		}
		session.setAttribute("user", newmemberDTO);
		response.sendRedirect("LoginForm.jsp");
	} else {
		request.setAttribute("LoginErrMsg", "로그인오류입니다");
		request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
	}
%>
