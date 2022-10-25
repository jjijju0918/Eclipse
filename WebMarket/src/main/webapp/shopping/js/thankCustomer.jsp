<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%>
<%
	Cookie[] cookies = request.getCookies();
	
	String shipping_cartid = "";
	String shipping_name = "";
	String shipping_shippingDate = "";
	
	
	if(cookies != null){
		for(int i=0;i<cookies.length;i++){
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			if(n.equals("Shipping_cartid")){
				shipping_cartid = URLDecoder.decode(thisCookie.getValue(),"UTF-8");
			}
			if(n.equals("Shipping_shippingDate")){
				shipping_shippingDate = URLDecoder.decode(thisCookie.getValue(), "UTF-8");
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="menu.jsp"%>
	<%! String greeting = "주문완료";%>
	
	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3">
				<%= greeting %>
			</h1>		
		</div>
	</div>
	
	<div class="container">
		<h2 class="alert alert-danger">주문해주셔서 감사합니다!!</h2>
		<p>주문은 <%=shipping_shippingDate%> 에 배송될 예정입니다.</p>
		<p>주문번호 : <%=shipping_cartid%></p>
	</div>
	<div class="container">
		<p>
			<a href="Products.jsp" class="btn btn-secondary">&laquo; 상품 목록</a>
		</p>
		<br>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>

<%
	//세션으로 저장된 장바구니 정보를 모두 삭제함
	session.setAttribute("cartlist", null);
	//쿠키에 저장된 배송 정보를 모두 삭제함
	for(int i=0; i < cookies.length; i++){
		Cookie thisCookie = cookies[i];
		//쿠키명을 가져오기
		String n = thisCookie.getName();
		
		if(n.equals("Shipping_cartid")){
			thisCookie.setMaxAge(0);
		}
		if(n.equals("Shipping_name")){
			thisCookie.setMaxAge(0);
		}
		if(n.equals("Shipping_shippingDate")){
			thisCookie.setMaxAge(0);
		}
		if(n.equals("Shipping_country")){
			thisCookie.setMaxAge(0);
		}
		if(n.equals("Shipping_zipCode")){
			thisCookie.setMaxAge(0);
		}
		if(n.equals("Shipping_addressName")){
			thisCookie.setMaxAge(0);
		}
		
		response.addCookie(thisCookie);
	}


%>