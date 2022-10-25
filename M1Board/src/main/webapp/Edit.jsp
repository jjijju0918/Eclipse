<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import = "java.io.*" %>
<%@ page import = "model1.board.BoardDAO" %>
<%@ page import="model1.board.BoardDTO" %>    
<%@ page import="model1.board.BoardDAO" %>  
<%	
	String num = request.getParameter("num");
	BoardDAO dao = new BoardDAO();	
	BoardDTO dto = dao.selectView(num);

	dao.close();
%> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel = "stylesheet" href= "http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
		<title>수정하기</title>
	</head>
	<body>
	<jsp:include page="Link.jsp"/>
	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3"><b>글 수정하기-(Edit)</b></h1>
		</div> 
   	</div>
	<div class = "container">
		<div class="row">
			<form  action="updateAction.jsp"  class="form-horizontal" method="post">
				<table class = "table table-striped" style = "text-align: center; border:1px solid #dddddd; width: 900px; margin-left: auto;"  >
					<thead>
						<tr>
							<th colspan="2" style="background-color : #D9E5FF; text-align:center;"> 글 수정하기 </th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td> <input type="text" class="form-control" placeholder="글제목" maxlength="50" name = "title"
								value = "<%= dto.getTitle() %>"></td>
						</tr>
						<tr>
							<td> 
								<textarea  class = "form-control" placeholder="글내용" name = "content" maxlength = "2000" style="height:350px; resize: none;"><%= dto.getContent()%></textarea>
							</td>
						</tr>
						
					</tbody>
				</table>
				<input type="hidden" name="num" value="<%= dto.getNum() %>"/>
				<input type="submit" class="btn btn-primary pull-right" value="수정하기" />
				<button type="button" onclick="location.href='List.jsp';"  class="btn btn-primary" >목록보기</button>
			</form>
			
		</div>
	</div>
	</body>
</html>