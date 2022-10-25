<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel = "stylesheet" href= "http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
		<title>글쓰기</title>
	</head>
	<body>
	<jsp:include page="Link.jsp"/>
	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3"><b>글쓰기-(Write)</b></h1>
		</div> 
   	</div>
	<div class = "container">
		<div class="row">
			<form  action="WriteAction.jsp" class="form-horizontal" method="post">
				<table class = "table table-striped" style = "text-align: center; border:1px solid #dddddd; width: 900px;" >
					<thead>
						<tr>
							<th colspan="2" style="background-color : #D9E5FF; text-align:center;">게시판 글쓰기 양식 </th>
					</thead>
					<tbody>
						<tr>
							<td> <input type="text" class="form-control" placeholder="글제목" name="title" maxlength="50"></td>
						</tr>
						<tr>
							<td> <textarea class = "form-control" placeholder="글내용" name = "content" maxlength = "2000" style="height:350px; resize: none;"></textarea></td>	
						</tr>
						
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary " value="글쓰기 등록" style="margin-left: 675px "/>
				<input type="button" class="btn btn-primary " value="취소" onclick="history.back()"/>
			</form>
			
		</div>
	</div>
	</body>
</html>