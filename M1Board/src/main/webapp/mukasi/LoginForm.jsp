<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "newmembership.NewmemberDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet" href= "http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
<title>로그인</title>
</head>

<body>

	<jsp:include page="Link.jsp"/>
	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3"><b>로그인(LoginForm)</b></h1>
		</div> 
   	</div>
	<span style="color: red ; font-size:1.2em;">
		<%= request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg") %>	
	</span>
	<%
		if(session.getAttribute("user") == null){
	%>
	<script>
	function validateForm(form){
		if(!form.user_id.value){
			alert("아이디를 입력하세요.");
			return false;
		}
		if(form.user_pw.value==""){
			alert("패스워드를 입력하세요.");
			return false;
		}
	}
	</script> <!-- 로그인 위치조정하기 -->
		<div class="container">
			<div class="col-lg-4"></div>
			<div class="col-lg-4">
				<div style="padding-top:50px;">
					<form action="LoginProcess.jsp" method="post" name="LoginFrm" onsubmit="return validateForm(this);" >
						<h3 style = "text-align:center;">Please sign in </h3>
						<div class = "form-group">
							<input type="text" name="user_id" class = "form-control" placeholder="ID" maxlength = "20"/>
						</div>
						<div class= "form-grup">
							<input type="password" name="user_pw" class = "form-control" placeholder="Password" maxlength = "20"/> <br>
							<input type="submit" class="btn btn-success form-control" value="로그인하기" />
						</div>
						<br>
					</form>
					<input type="submit" class="btn btn-primary form-control" value="회원가입" onclick ="location.href='newmembers.jsp'"/> 
				</div>
			</div>
		</div>
	
	<%
		}else{
			%>
				<%NewmemberDTO user = (NewmemberDTO) session.getAttribute("user"); %>
				<%= user.getName() %>회원님, 로그인했습니다.<br/>
				<a href="Logout.jsp">로그아웃</a>
		<% 		
		}
	%>
</body>
</html>
