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
	tr.space {
		/*width:100%;
  		border-collapse: separate;
  		border-spacing: 0 500px;
  		border-bottom: 50px solid #ddd;*/
	}
	.table-striped {
		text-align: center;
		border:1px solid #dddddd; 
		margin-left: 300px; 
		table-layout: fixed;
		cellpadding:0; 
		cellspacing:0;
		font-size: 20px;
		font-weight: bold;
		
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
	<form name="writeFrm" method="get" class="form-horizontal" >
		<input type="hidden" name="num" value="<%=num %>"/>
	<table class = "table table-striped" style = "width: 70%; ">
		<tr>
			<td><div style="margin:20px">번호</div></td>
			<td><div style="margin:20px"><%=dto.getNum() %></div></td>
			<td><div style="margin:20px">작성자</div></td>
			<td><div style="margin:20px"><%=dto.getName() %></div></td>
		</tr>
		<tr >
			<td> <div style="margin:20px">작성일</div></td>
			<td><div style="margin:20px"><%=dto.getPostdate() %></div></td>
			<td><div style="margin:20px">조회수</div></td>
			<td><div style="margin:20px"><%=dto.getVisitcount() %></div></td>
		</tr>
		<tr>
			<td><div style="margin:20px">제목</div></td>
			<td colspan="3"><div style="margin:20px"><%=dto.getTitle() %></div></td>
		</tr>
		<tr>
			<td><div style="margin:20px">내용</div></td>
			<td colspan="3"  >
				<div style="margin:20px"><%= dto.getContent().replace("\r\n", "<br/>") %></div></td>
		</tr>
		<tr>
			<td colspan="4" align="center">
			<div style="margin:20px">
			<button type="button" onclick="location.href='List.jsp';" class="btn btn-secondary" style="font-size: 16px; padding: 5px 25px;">목록보기</button>
			</div>
		</tr>
		</table>
	</form>
		<%} else {%>
	<form name="writeFrm" method="get" class="form-horizontal" >
		<input type="hidden" name="num" value="<%=num %>"/>
	<table class = "table table-striped" style = "width: 70%; ">
		<tr>
			<td><div style="margin:20px">번호</div></td>
			<td><div style="margin:20px"><%=dto.getNum() %></div></td>
			<td><div style="margin:20px">작성자</div></td>
			<td><div style="margin:20px"><%=dto.getName() %></div></td>
		</tr>
		<tr >
			<td> <div style="margin:20px">작성일</div></td>
			<td><div style="margin:20px"><%=dto.getPostdate() %></div></td>
			<td><div style="margin:20px">조회수</div></td>
			<td><div style="margin:20px"><%=dto.getVisitcount() %></div></td>
		</tr>
		<tr>
			<td><div style="margin:20px">제목</div></td>
			<td colspan="3"><div style="margin:20px"><%=dto.getTitle() %></div></td>
		</tr>
		<tr>
			<td><div style="margin:20px">내용</div></td>
			<td colspan="3"  >
				<div style="margin:20px"><%= dto.getContent().replace("\r\n", "<br/>") %></div></td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<div style="margin:20px">
				<%
				NewmemberDTO user = (NewmemberDTO) session.getAttribute("user");
				if(user != null && dto.getId().equals(user.getId()) || (Boolean)session.getAttribute("admin")){
				%>
				<%if(user != null && dto.getId().equals(user.getId())){%>
					<button type="button" onclick="location.href='Edit.jsp?num=<%=dto.getNum() %>';" class="btn btn-secondary" style="font-size: 16px; padding: 5px 25px;">수정하기</button>
					<%} %>
					<button type="button" onclick="deletePost()" class="btn btn-secondary" style="font-size: 16px; padding: 5px 25px;">삭제하기</button>
				<%
				}
				%>
				<button type="button" onclick="location.href='List.jsp';" class="btn btn-secondary " style="font-size: 16px; padding: 5px 25px;">목록보기</button>
				</div>
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
