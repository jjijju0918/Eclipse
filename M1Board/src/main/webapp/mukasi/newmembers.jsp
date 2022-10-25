<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "newmembership.NewmemberDAO"%>
<%@ page import = "newmembership.NewmemberDTO"  %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입</title>
		<link rel = "stylesheet" href= "http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
	</head>
	<body>
	<jsp:include page="Link.jsp"/>
	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3"><b>회원가입(new)</b></h1>
		</div> 
   	</div>
   	<script>
   	function CheckAdd(){   		
   		let id = document.newmember.id;
   		let pass = document.newmember.pass;
   		let number = document.newmember.number;
		let name = document.newmember.name;
		let gender = document.newmember.gender;
		let address = document.newmember.address;
		
		let birth_yy = document.newmember.birth_yy;
		let birth_dd = document.newmember.birth_dd;
		
   		let email = document.newmember.email; 
   		let email_domain = document.newmember.email_domain;
   		let email_click = document.newmember.email_click;

   		if(email_domain.value != ""){
   			email.value = email.value + "@" + email_domain.value;
   		}else{
   			email.value = email.value + "@" + email_click.value;
   		}
		
		const idCheck = /^[a-zA-z0-9]{4,12}$/;
		const emailCheck = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
		const birth_yyCheck = /[0-9]{4}$/
		const birth_ddCheck = /[0-9]{1,2}$/
		//const nameCheck =  /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{1,4}$/;
		
		if(!check(idCheck,id,"아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!")){
			id.select();
			id.focus();
		} else if(pass.value == ""){
			alert("비밀번호를입력해주세요.");
			pass.focus();
		} else if (document.newmember.passCheck.value != pass.value) {
			alert("비밀번호와 비밀번호 확인란이 일치하지 않습니다. 다시 입력해주세요.");
			document.newmember.passCheck.focus();
		} else if(name.value==""){
			name.focus();
		} else if(gender.value ==""){
			alert("성별을 체크해주세요.")
			gender.focus();
		} else if(!check(birth_yyCheck,birth_yy,"예)1997 형식에 맞게 입력해주세요")){
			birth_yy.select();
			birth_yy.focus();
		} else if(!check(birth_ddCheck,birth_dd,"1~31까지의 일자를 입력해주세요.")){
			birth_dd.select();
			birth_dd.focus();
		} else if(!check(emailCheck, email, "이메일을 형식에 맞게 입력해주세요!")){
			email_domain.select();
			email_domain.focus();
		} else if(number.value ==""){
			alert("전화번호를 입력해주세요.")
			number.focus();
		} else if(address.value==""){
			alert("주소를 입력해주세요.")
			address.focus();
		} else {
			if(confirm("등록 하시겠습니까?")){
				document.newmember.submit();	
			}
   		}
		email.value = email.value.split("@")[0];
	}
			
	function check(regExp, e, msg) {
		if (regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		return false;
	}	
   		
   	function deleteConfirm(){
   		if(confirm("등록 취소 하시겠습니까?")){
   			location.replace('LoginForm.jsp')
   		}
   	}
	</script>
   	<form name="newmember" action="newmemberpro.jsp" class="form-horizontal" method="POST" >
	 	
	 	<div class = "container">
	 		<div class="form-group row">
	 			<label class="col-sm-2"><b>아이디</b></label>
				<div class="com-sm-3">
					<input type="text" id="id" name="id" class="form-control" placeholder="아이디를 입력해주세요.">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><b>비밀번호</b></label>
				<div class="com-sm-3">
					<input type="text" id="pass" name="pass" class="form-control" placeholder="비밀번호을 입력해주세요.">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><b>비밀번호 확인</b></label>
				<div class="com-sm-3">
					<input type= "text" id="passCheck" name="passCheck" class="form-control" placeholder="비밀번호을 입력해주세요.">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><b>성명</b></label>
				<div class="com-sm-3">
					<input type="text" id="name" name="name" class="form-control" placeholder="성명을 입력해주세요.">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><b>성별</b></label>
				<div class="com-sm-5">
					<input type="radio" name="gender" value="man" checked> 남
					<input type="radio" name="gender" value="girl"> 여	
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><b>생일</b></label>
				<div>
					<input type="number" name="birth_yy" placeholder="년(4자)" size = "6">
					<select name = "birth_mm" >
						<option value = "01">1</option>
						<option value = "02">2</option>
						<option value = "03">3</option>
						<option value = "04">4</option>
						<option value = "05">5</option>
						<option value = "06">6</option>
						<option value = "07">7</option>
						<option value = "08">8</option>
						<option value = "09">9</option>
						<option value = "10">10</option>
						<option value = "11">11</option>
						<option value = "12">12</option>
					</select>
					<input type ="number" name = "birth_dd" maxlength="2" placeholder="일 " size="5" >
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><b>이메일</b></label>
				<div class="com-sm-3">
					<input type="text" name="email" class="form_w200" value="" title="이메일 아이디"  placeholder="email" maxlength="18" > @
					<input type="text" name="email_domain" id="email_domain" class="form_w200" value="" title="이메일 도메인" placeholder="이메일 도메인" maxlength="18"class="form-control"/> 
					<select class="select" title="이메일 도메인 주소 선택" name="email_click" class="form-control">
						<option>naver.com</option>
						<option>daum.net</option>
						<option>gmail.com</option>
						<option>nate.com</option>
					</select>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><b>전화번호</b></label>
				<div class="com-sm-3">
					<input type="number" name="number" class="form-control" placeholder="전화번호를 입력해주세요. ">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><b>주소</b></label>
				<div class="com-sm-3">
					<input type="text" name="address" class="form-control" placeholder="주소을 입력해주세요.">
				</div>
			</div>
			
			<div class="form-group row">
				<div>
					<input type="button" class="btn btn-primary" value="등록" onclick ="CheckAdd()">
					<input type="button" class="btn btn-primary" value="취소" onclick="deleteConfirm()"> 
				</div>
			</div>
		</div>
	</form>
	</body>
</html>