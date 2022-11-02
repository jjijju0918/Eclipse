<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="model1.board.BoardDTO" %>    
<%@ page import="model1.board.BoardDAO" %>   
<%@ page import ="newmembership.NewmemberDTO" %>
   
<%
	String num = request.getParameter("num");
	BoardDAO dao = new BoardDAO();
	dao.updateVisitCount(num); //조회수 +1
	 
	BoardDTO dto = dao.selectView(num);
	dao.close(); 
%>   
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 게시판</title>
<link rel = "stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
<style type="text/css">
	table {
		width:100%;
  		border-collapse: separate;
  		border-spacing: 0 10px;
	}



</style>
</head>
<body>
<jsp:include page="Link.jsp"/>

	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3"><b>회원게시판-상세보기(view)</b></h1>
		</div> 
   	</div>
   	<%if(session.getAttribute("user") == null){ %>
	<form name="writeFrm" method="get" class="form-horizontal">
		<input type="hidden" name="num" value="<%=num %>"/>
	<table class = "table table-striped" style = "text-align: center; border:1px solid #dddddd; width: 90%; margin-left: 50px; table-layout: fixed;">
		<tr>
			<td>번호</td>
			<td><%=dto.getNum() %></td>
			<td>작성자</td>
			<td><%=dto.getName() %></td>
		</tr>
		<tr>
			<td>작성일</td>
			<td><%=dto.getPostdate() %></td>
			<td>조회수</td>
			<td><%=dto.getVisitcount() %></td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3"><%=dto.getTitle() %></td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3"  >
				<%= dto.getContent().replace("\r\n", "<br/>") %></td>
		</tr>
		<tr>
			<td colspan="4" align="center">
			<button type="button" onclick="location.href='List.jsp';" class="btn btn-primary ">목록보기</button>
		<tr>
		</table>
	</form>
		<%} else {%>
		<form name="writeFrm" method="get" class="form-horizontal">
			<input type="hidden" name="num" value="<%=num %>"/>
			<table class = "table table-striped" style = "text-align: center; border:1px solid #dddddd; width: 90%; margin-left: 50px; table-layout: fixed;">
		<tr>
			<td>번호</td>
			<td><%=dto.getNum() %></td>
			<td>작성자</td>
			<td><%=dto.getName() %></td>
		</tr>
		<tr>
			<td>작성일</td>
			<td><%=dto.getPostdate() %></td>
			<td>조회수</td>
			<td><%=dto.getVisitcount() %></td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3"><%=dto.getTitle() %></td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3"  >
				<%= dto.getContent().replace("\r\n", "<br/>") %></td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<%
				NewmemberDTO user = (NewmemberDTO) session.getAttribute("user");
				if(user != null && dto.getId().equals(user.getId()) || (Boolean)session.getAttribute("admin")){
				%>
				<%if(user != null && dto.getId().equals(user.getId())){%>
					<button type="button" onclick="location.href='Edit.jsp?num=<%=dto.getNum() %>';" class="btn btn-primary ">수정하기</button>
					<%} %>
					<button type="button" onclick="deletePost()" class="btn btn-primary ">삭제하기</button>
				<%
				}
				%>
				<button type="button" onclick="location.href='List.jsp';" class="btn btn-primary ">목록보기</button>
				</td>
		</tr>
		<%} %>	
		</table>
	</form>
<script>
	function deletePost(){
		var confirmed = confirm("정말로 삭제하겠습니까?");
		console.log(confirmed)
		if(confirmed){
			var form = document.writeFrm1;
			form.method ="post";
			form.action="DeleteProcess.jsp";
			form.submit();
		}
	}
</script>

</body>
</html>
