<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "model1.board.BoardDAO" %>
<%@ page import = "newmembership.NewmemberDAO" %>
<%@ page import = "newmembership.NewmemberDTO" %>
<%@ page import = "java.io.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id = "bbs" class = "model1.board.BoardDTO" scope="page"/>
<jsp:setProperty name = "bbs" property="title"/>
<jsp:setProperty name = "bbs" property="content"/>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>글쓰기</title>
	</head>
	<body>
		<% 
		NewmemberDTO user = (NewmemberDTO) session.getAttribute("user");
		if(bbs.getTitle() == null || bbs.getContent() == null ){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('제목이나 내용을 확인하세요!')");
			script.println("history.back()"); 
			script.println("</script>");
		} else{
			BoardDAO bbsDAO = new BoardDAO();
			int result = bbsDAO.Write(bbs.getTitle(), bbs.getContent(),user.getId()); 
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기에 실패했습니다.')");
				script.println("history.back()"); //이전 페이지로 돌려보냄(join 페이지)
				script.println("</script>"); 
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'List.jsp'"); //회원가입이 된경우 => main.jsp 페이지로 이동
				script.println("</script>");
			}
		}
		%>
	</body>
</html>