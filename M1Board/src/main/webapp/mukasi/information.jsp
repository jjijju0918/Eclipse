<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "newmembership.NewmemberDAO" %>
<%@ page import = "newmembership.NewmemberDTO" %>
<%@ page import = "java.util.Arrays" %>
<%
String userId = request.getParameter("user");

NewmemberDAO dao = new NewmemberDAO();
NewmemberDTO newmemberDTO = dao.getupdateuser(userId);
dao.close();
NewmemberDTO upmember = (NewmemberDTO) session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>정보변경 및 탈퇴</title>
		<link rel = "stylesheet" href= "http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
	</head>
	<body>
	<jsp:include page="Link.jsp"/>
	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3"><b>정보변경(information)</b></h1>
		</div> 
   	</div>
   	   	<script>
   	function UPcheckAdd(){   		
   		let pass = document.upmember.pass;
		
		if(pass.value == ""){
			alert("비밀번호를입력해주세요.");
			pass.focus();
		} else if (document.upmember.passCheck.value != pass.value) {
			alert("비밀번호와 비밀번호 확인란이 일치하지 않습니다. 다시 입력해주세요.");
			document.upmember.passCheck.focus();
		}  else {
			if(confirm("등록 하시겠습니까?")){
				document.upmember.submit();	
			}
   		}
	}
			
	function check(regExp, e, msg) {
		if (regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		return false;
	}	
   		
   	function updeleteConfirm(){
   		if(confirm("등록 취소 하시겠습니까?")){
   			location.replace('List.jsp')
   		}
   	}
   	
   	function allDelte(){
   		let pass = document.upmember.pass;
   		
   		if(pass.value == ""){
			alert("비밀번호를입력해주세요.");
			pass.focus();
		} else if (document.upmember.passCheck.value != pass.value) {
			alert("비밀번호와 비밀번호 확인란이 일치하지 않습니다. 다시 입력해주세요.");
			document.upmember.passCheck.focus();
		}  else {
			if(confirm("탈퇴하시겠습니까?")){
				location.replace('allDelete.jsp')
				//document.upmember.submit();	
			}
   		}
   	}
	</script>
   	<form name="upmember" action="informationpro.jsp" class="form-horizontal" method="post">
	 	
	 	<div class = "container">
	 		<div class="form-group row">
	 			<label class="col-sm-2"><b>아이디</b></label>
				<div class="com-sm-3">
					<input type="text" id="id" name="id" class="form-control" readonly="readonly" value ='<%= upmember.getId() %>'>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><b>비밀번호</b></label>
				<div class="com-sm-3">
					<input type="text" id="pass" name="pass" class="form-control" placeholder="비밀번호을 입력해주세요." value='<%=upmember.getPass() %>' >
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><b>비밀번호 확인</b></label>
				<div class="com-sm-3">
					<input type= "text" id="passCheck" name="passCheck" class="form-control" placeholder="비밀번호을 다시입력해주세요." >
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><b>성명</b></label>
				<div class="com-sm-3">
					<input type="text" id="name" name="name" class="form-control" placeholder="성명을 입력해주세요." value='<%=upmember.getName() %>'>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><b>성별</b></label>
				<div class="com-sm-5">
					<input type="radio" name="gender" value="man" <%= upmember.getGender().equals("man") ? "checked" : "" %>> 남
					<input type="radio" name="gender" value="girl" <%= upmember.getGender().equals("girl") ? "checked" : "" %>> 여	
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><b>생일</b></label>
				<div>
					<input type="text" name="birth_yy" placeholder="년(4자)" size = "6" value="<%= upmember.getBirth().substring(0, 4) %>">
					<select name = "birth_mm">
						<option value = "">월</option>
						<option value = "01" <%= upmember.getBirth().substring(4, 6).equals("01") ? "selected" : "" %>>1</option>
						<option value = "02" <%= upmember.getBirth().substring(4, 6).equals("02") ? "selected" : "" %>>2</option>
						<option value = "03" <%= upmember.getBirth().substring(4, 6).equals("03") ? "selected" : "" %>>3</option>
						<option value = "04" <%= upmember.getBirth().substring(4, 6).equals("04") ? "selected" : "" %>>4</option>
						<option value = "05" <%= upmember.getBirth().substring(4, 6).equals("05") ? "selected" : "" %>>5</option>
						<option value = "06" <%= upmember.getBirth().substring(4, 6).equals("06") ? "selected" : "" %>>6</option>
						<option value = "07" <%= upmember.getBirth().substring(4, 6).equals("07") ? "selected" : "" %>>7</option>
						<option value = "08" <%= upmember.getBirth().substring(4, 6).equals("08") ? "selected" : "" %>>8</option>
						<option value = "09" <%= upmember.getBirth().substring(4, 6).equals("09") ? "selected" : "" %>>9</option>
						<option value = "10" <%= upmember.getBirth().substring(4, 6).equals("10") ? "selected" : "" %>>10</option>
						<option value = "11" <%= upmember.getBirth().substring(4, 6).equals("11") ? "selected" : "" %>>11</option>
						<option value = "12" <%= upmember.getBirth().substring(4, 6).equals("12") ? "selected" : "" %>>12</option>
					</select>
					<input type ="text" name = "birth_dd" maxlength="2" placeholder="일 " size="5" value="<%= upmember.getBirth().substring(6, 8) %>">
				</div>
			</div>
			<%
				String arr[] = {"naver.com", "daum.net", "gmail.com", "nate.com"};
			
			 	boolean isArrSelect = Arrays.asList(arr).contains(upmember.getEmail().split("@")[1]);
				
			%>
			<div class="form-group row">
				<label class="col-sm-2"><b>이메일</b></label>
				<div class="com-sm-3">
					<input type="text" name="email" class="form_w200" title="이메일 아이디"  placeholder="email" maxlength="18" value="<%= upmember.getEmail().split("@")[0] %>"> @
					<input type="text" name="email_domain" class="form_w200" title="이메일 도메인" placeholder="이메일 도메인" maxlength="18" value="<%= isArrSelect ? "" : upmember.getEmail().split("@")[1] %>"/> 
					<select class="select" name="email_click" title="이메일 도메인 주소 선택">
						<option>--선택--</option>
						<option <%= isArrSelect && upmember.getEmail().split("@")[1].equals("naver.com") ? "selected" : "" %>>naver.com</option>
						<option <%= isArrSelect && upmember.getEmail().split("@")[1].equals("daum.net") ? "selected" : "" %>>daum.net</option>
						<option <%= isArrSelect && upmember.getEmail().split("@")[1].equals("gmail.com") ? "selected" : "" %>>gmail.com</option>
						<option <%= isArrSelect && upmember.getEmail().split("@")[1].equals("nate.com") ? "selected" : "" %>>nate.com</option>
					</select>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><b>전화번호</b></label>
				<div class="com-sm-3">
					<input type="number" name="number" class="form-control" placeholder="전화번호를 입력해주세요. " value='<%=upmember.getNumber() %>'>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><b>주소</b></label>
				<div class="com-sm-3">
					<input type="text" name="address" class="form-control" placeholder="주소을 입력해주세요." value='<%=upmember.getAddress() %>'>
				</div>
			</div>
			
			<div class="form-group row">
				<div>
					<input type="button" class="btn btn-primary" value="수정" onclick="UPcheckAdd()">
					<input type="button" class="btn btn-primary" value="이전" onclick="updeleteConfirm()" > 
					<input type="button" class="btn btn-danger" value="탈퇴하기" onclick="allDelte()" style="align:right" > 
				</div>
			</div>
		</div>
	</form>
   	

	</body>
</html>