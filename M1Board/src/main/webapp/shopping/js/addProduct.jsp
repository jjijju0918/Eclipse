<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "com.dto.Product" %>
<%
	String id = request.getParameter("id");

%>
<!DOCTYPE html>
<jsp:useBean id = "productDAO" class = "com.dao.ProductRepository" scope="session"/> 
<html>
	<head>
		<link rel = "stylesheet" href= "http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
		<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
		<title>상품등록</title>
	</head>	
	<body>
		<jsp:include page="Link.jsp"/>
		<div class = "jumbotron">
			<div class = "container">
				<h1 class = "display-3">상품등록</h1>
			</div> 
   		</div>
   		<script>
   		function CheckAddProduct(){
   			if(confirm("등록 하시겠습니까?"))
   				
   			var productid = document.newProduct.ProductID;
			var name = document.newProduct.name;
			var unitPrice = document.newProduct.unitPrice;
			var unitsInStock = document.newProduct.unitsInStock;
			
			var comment = document.newProduct.comment;
			var maufacture = document.newProduct.maufacture;
			var category = document.newProduct.category;
			var condition = document.newProduct.condition;
			var filename = document.newProduct.filename;
			
			
			
			const idCheck = /^P[0-9]{4,11}$/;
			const unitPriceCheck = /(^\d+$)|(^\d{1,}.\d{0,2}$)/;
			const unitsInStockCheck = /^[0-9]+$/;
				
			//아이디 체크
			if(!check(idCheck, productid, "상품코드는 P와 숫자를 조합하여 5~12까지 입력 \n 첫글자는 반드시 P로 시작"))
				return false;
			if(name.value.length < 4  || name.value.length > 12){
				alert("상품명은 최소 4자에서 최대 12자까지 입력 필요!")
				name.select();
				name.focus();
				return false;
			}
			
			if(!check(unitPriceCheck, unitPrice, "가격은 숫자만 입력 가능하고 음수는 입력할 수 없으며 소수점인 경우 둘째 자리까지만 가능합니다.")){
				return false;
			}
			
			
			if(comment.value ==""){
				alert("정보를 입력해주세요.");
				return false;
			}
			if(maufacture.value ==""){
				alert("제조사를 입력해주세요.");
				return false;
			}
			if(category.value ==""){
				alert("분류를 입력해주세요.");
				return false;
			}
			if(!check(unitsInStockCheck,unitsInStock,"숫자만 입력가능합니다")){
				return false;
			}
			if(condition.value ==""){
				alert("상태 체크해주세요.");
				return false;
			}
			if(filename.value == ""){
				alert("이미지업로드해주세요.");
				return false;
			}
			
			function check(regExp, e, msg) {
				if (regExp.test(e.value)) {
					return true;
				}
				alert(msg);
				e.select();
				e.focus();
				return false;
			}
			document.newProduct.submit();
		}
   		function deleteConfirm(){
   			if(confirm("등록 취소 하시겠습니까?")){
   				location.replace('./Products.jsp')
   			}
   		}
		</script>
		  <script>
 
   		 $(document).ready(function() {
        	$('#test').on('keyup', function() {
            	$('#test_cnt').html("("+$(this).val().length+" / 200)");
 
            if($(this).val().length > 200) {
            	alert("최대 200자까지 입력 가능합니다.");
                $(this).val($(this).val().substring(0, 200));
                $('#test_cnt').html("(200 / 200)");
            }
        });
    });
        
    </script>
	 	<form name="newProduct" action="processAddProduct.jsp" enctype="multipart/form-data"  class="form-horizontal" method="post">
	 	<div class = "container">
	 		<div class="form-group row">
	 			<label class="col-sm-2"><b>상품코드</b></label>
				<div  class="com-sm-3">
					<input type="text" id="ProductID" name="ProductID" class="form-control" placeholder="상품코드를 입력해주세요.">
				</div>
			</div>
	 					
	 		<div class="form-group row">
				<label class="col-sm-2"><b>상품명</b></label>
				<div class="com-sm-3">
					<input type="text" id="name" name="name" class="form-control" placeholder="상품명을 입력해주세요.">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><b>가격</b></label>
				<div class="com-sm-3">
					<input type="number" id="unitPrice" name="unitPrice" class="form-control" placeholder="가격을 입력해주세요.">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><b>상세정보</b></label>
				<div class="com-sm-3">
					<textarea id="test" name="comment" cols="40" rows="5" class="form-control" ></textarea>
    				<div id="test_cnt">(0 / 200)</div>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><b>제조사</b></label>
				<div class="com-sm-3">
					<input type="text" id="maufacture" name="maufacture" class="form-control" placeholder="제조사를 입력해주세요.">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><b>분류</b></label>
				<div class="com-sm-3">
					<input type="text" id="category" name="category" class="form-control" placeholder="분류를 입력해주세요.">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><b>재고 수</b></label>
				<div class="com-sm-3">
					<input type="number" id="unitsInStock" name="unitsInStock" class="form-control" placeholder="재고 수를 입력해주세요.">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><b>상태</b></label>
				<div class="com-sm-5">
					<input type="radio" name="condition" value="New"> 신규 제품
					<input type="radio" name="condition" value="Old"> 중고 제품
					<input type="radio" name="condition" value="Refurbished"> 재생 제품	
				</div>
			</div>
			<br>
			<div class="form-group row">
				<label class="col-sm-2"><b>이미지</b></label>
				<div class="com-sm-3">
					<input type="file"  name="filename" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" class="btn btn-primary" value="상품등록" onclick="CheckAddProduct()">
					<input type="button" class="btn btn-primary" value="등록취소" onclick="deleteConfirm()" > 
				</div>
			</div>
		</div>
	 	<hr>
	 	<jsp:include page="footer.jsp"/>
		</form>
	</body>
</html>