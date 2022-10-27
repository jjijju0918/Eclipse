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
		<link rel = "stylesheet" 
			href= "http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
		<title>배송 정보</title>
	</head>
	<body>
	<script>
		function UPcheckAdd(){
			let name = document.shippinginfo.name;
			let shoppingDate = document.shippinginfo.shoppingDate;
			let countyu = document.shippinginfo.countyu;
			let addressName = document.shippinginfo.addressName;
			
			if(name.value == ""){
				alert("실명을적어주세요");
				name.focus();
			}else if(shoppingDate.value == ""){
				alert("배송날짜를 입력해주세요");
				shoppingDate.focus();
			}else if(countyu.value == ""){
				alert("국가를 입력해주세요");
				countyu.focus();
			}else if (addressName.value == ""){
				alert("주소를 입력해주세요");
			} else {
				if(confirm("등록 하시겠습니까?")){
					document.shippinginfo.submit();	
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
		
		</script>
		<jsp:include page="Link.jsp"/>
		
		<div class = "jumbotron">
			<div class = "container">
				<h1 class = "display-3">배송 정보</h1>
			</div>
   		</div>
	<div class="container">
			<form action="./processShippingInfo.jsp" class ="form-horizontal" method="post" name ="shippinginfo">
				<input type = "hidden" name = "cartid" value="<%=request.getParameter("cartid")%>"/>
				
				<div class="form-group row">
					<lebel class="col-sm-2">성명</lebel>
					<div class="col-sm-3">
						<input type = "text" name = "name" class="form-control" placeholder = "성명"  value='<%=upmember.getName() %>'/>
					</div>
				</div>
				
				<div class="form-group row">
					<lebel class="col-sm-2">배송일</lebel>
					<div class="col-sm-3">
						<input type="number" name = "shoppingDate" class="form-control" placeholder = "ex)20220910"/>
					</div>
				</div>
				
				<div class="form-group row">
					<lebel class="col-sm-2">국가명</lebel>
					<div class="col-sm-3">
						<input type = "text" name = "countyu" class="form-control" placeholder = "국가명"/>
					</div>
				</div>
				
				<div class="form-group row">
					<lebel class="col-sm-2">주소</lebel>
					<div class="col-sm-3">
						<input type = "text" name = "addressName" class="form-control" placeholder = "주소"  value='<%=upmember.getAddress() %>'/>
					</div>
				</div>
				
				<div class="form-group row">
					<div class="col-sm-offset2 col-sm-10">
						<a href="./cart.jsp?cartid=<%=request.getParameter("cartid")%>" class="btn btn-secondary" role="button">이전</a>
						<input type ="button" class="btn btn-primary"  onclick="UPcheckAdd()" value="등록"/>
						<a href="checkOutCancelled.jsp" class="btn btn-secondary">취소</a>
					</div>
				</div>
			</form>
		</div>
		
		<jsp:include page="footer.jsp"/>
	

	</div>
</html>