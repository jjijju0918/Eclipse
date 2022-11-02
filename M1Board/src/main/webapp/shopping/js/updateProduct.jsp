<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@page import = "java.text.DecimalFormat" %>
<%
	request.setCharacterEncoding("UTF-8");
	DecimalFormat dFormat = new DecimalFormat("###,###");
%>
<!DOCTYPE html>
<html>
	<head>
		<link rel = "stylesheet" href= "http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
		<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
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
	</head>	
	<body>
		<jsp:include page="Link.jsp"/>
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3"><b>상품수정</b></h1>
			</div> 
   		</div>
   		
   		<div class="container">
   			<div class = "row" align="center">
   				<%@ include file="dbconn.jsp"%>
   			<%
   				String productid = request.getParameter("id");
   				
   				PreparedStatement pstmt = null;
   				ResultSet rs = null;
   				String sql = "select * from product where productID = ?";
   				
   				pstmt = conn.prepareStatement(sql);
   				pstmt.setString(1, productid);
   				
   				rs=pstmt.executeQuery();
   				
   				if(rs.next()){
   	
			%>
			<div class="container">
				<div class="row">
					<div class = "col-md-5">
						<img alt="이미지" src="resources/images/<%=rs.getString("filename") %>" style="width:60% ">
					</div>
		
					<div class = "col-md-7">
						<form action="./processUpdateProduct.jsp" name = "newProduct" class = "form-horizontal" method="post" enctype = "multipart/form-data" >
							
							<div class = "form-group row">
								<label class="col-sm-3"><b>상품코드</b></label>
									<div class = "com-sm-3">
										<input type="text" id ="ProductID" name="ProductID" class="form-control"  value='<%=rs.getString("ProductID") %>'>
									</div>
							</div>
							
							<div class = "form-group row">
								<label class="col-sm-3"><b>상품명</b></label>
									<div class ="com-sm-3">
										<input type="text" id="pname" name="pname" class="form-control"  value='<%=rs.getString("pname") %>' >
									</div>
							</div>
							
							<div class="form-group row">
								<label class="col-sm-3"><b>가격</b></label>
									<div class="com-sm-3">
										<input type="number" id="unitPrice" name="unitPrice" class="form-control" value='<%=rs.getString("unitPrice")%>'>
									</div>
							</div>
			
							<div class="form-group row">
								<label class="col-sm-3"><b>상세정보</b></label>
									<div class="com-sm-3">
										<textarea id="test" name="comment" cols="40" rows="5" class="form-control" ><%=rs.getString("description")%></textarea>
										<div id="test_cnt" style="margin-right: 300px">(0 / 200)</div>
									</div>
							</div>
			
							<div class="form-group row">
								<label class="col-sm-3"><b>제조사</b></label>
									<div class="com-sm-3">
										<input type="text" id="maufacture" name="maufacture" class="form-control"  value='<%=rs.getString("maufacture")%>' >
									</div>
							</div>
			
							<div class="form-group row">
								<label class="col-sm-3"><b>분류</b></label>
									<div class="com-sm-3">
										<input type="text" id="category" name="category" class="form-control"  value='<%=rs.getString("category")%>' >
									</div>
							</div>
							
							<div class="form-group row">
								<label class="col-sm-3"><b>재고 수</b></label>
									<div class="com-sm-3">
										<input type="number" id="unitsInStock" name="unitsInStock" class="form-control"  value='<%=rs.getString("unitsInStock")%>' >
									</div>
							</div>
			
							<div class="form-group row">
								<label class="col-sm-3"><b>상태</b></label>
								<div class="com-sm-5">
										<input type="radio" name="condition" value="New"> 신규 제품<br/>
										<input type="radio" name="condition" value="Old"> 중고 제품<br/>
										<input type="radio" name="condition" value="Refurbished"> 재생 제품	
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-sm-3"><b>이미지</b></label>
								<div class="com-sm-5">
									<input type="file"  name="filename" class="form-control" >
								</div>
							</div>
							
							<div class = "form-group row">
								<div class="col-sm-offset-2 col-sm-2">
									<input type="submit" class="btb btn-primary" style="padding: 6px 25px;border-radius: 12px; margin-left: 80px;" value="수정완료">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
			<hr>
	</div>
			<%
   				}
   				if(rs != null) rs.close();
   				if(pstmt != null) pstmt.close();
   				if(conn != null) conn.close();
			%>
			
	 	<jsp:include page="footer.jsp"/>
	</body>
</html>