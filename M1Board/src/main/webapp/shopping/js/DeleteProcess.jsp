<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "model1.board.BoardDAO" %>
<%@ page import = "java.io.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>삭제하기</title>
	</head>
	<body>
	<%
		String num = request.getParameter("num");
		
		BoardDAO bbsDAO = new BoardDAO();
		int result = bbsDAO.delete(num);
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글 삭제에 실패했습니다.')");
			script.println("history.back()");
			script.println("</script>");
			} else {
				if(result >= 0){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('성공적으로 삭제하였습니다.')");
					script.println("location.href = 'List.jsp'");
					script.println("</script>");
		}
	}
		%>	
	
<script type="text/javascript">
	alert("게시글 삭제 완료!");
	location.href='List.jsp'
</script>

	</body>
</html>