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
		<link rel = "stylesheet" 
			href= "http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
		<title>상품수정</title>
	</head>	
	<body>
		<jsp:include page="menu.jsp"/>
		<div class = "jumbotron">
			<div class = "container">
				<h1 class = "display-3">상품수정</h1>
			</div> 
   		</div>
   		<div class="container">
   			<div class = "row" align = "center">
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
										<input type="text" id = "comment" name="comment" class="form-control" value='<%=rs.getString("description")%>'>
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
									<input type="submit" class="btb btn-primary" value="수정완료">
								</div>
							</div>
						</form>
					</div>
				</div>
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