<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "newmembership.NewmemberDTO" %>
<%@ page import = "membership.MemberDTO" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import="java.util.Locale" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("hh:mm a",Locale.ENGLISH);
%>
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
			<h1 class = "display-3"><b>웹 쇼핑몰에 오신 것을 환영합니다(LoginForm)</b></h1>
		</div> 
   	</div>
	<span style="color: red ; font-size:1.2em;">
		<%= request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg") %>	
	</span>
	<%
		if(session.getAttribute("user") == null || session.getAttribute("admin") == null){
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
				<% MemberDTO admin = (MemberDTO)session.getAttribute("admin"); %>

   				<%! 
      				String tagline = "Welcome to Web Market!";
   				%>
   				
   				<div class = "container">
   					<div class = "text-center">
   						<h5><%= tagline %></h5>
   						<h6>현재 접속 시각 : <%= sf.format(nowTime) %></h6>
   						<h3><%= user.getName() %><%= admin.getName() %>회원님, 로그인했습니다.<br/></h3>
   					</div>
   					<hr>
   				</div>	
   				
   						
		<% 		
		} 
	%>
</body>
</html>
