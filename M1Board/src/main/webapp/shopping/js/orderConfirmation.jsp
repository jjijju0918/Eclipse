<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLDecoder"%>
<%@page import = "java.text.DecimalFormat" %>

<%
	request.setCharacterEncoding("UTF-8");
	DecimalFormat dFormat = new DecimalFormat("###,###");
	String cartId = session.getId();
	
	String shipping_cartid = "";
	String shipping_name = "";
	String shipping_shippingDate = "";
	String shipping_country = "";
	String shipping_zipCode = "";
	String shipping_addressName = "";
	Cookie[] cookies = request.getCookies();
	
	//쿠키가 있어야 함
	if(cookies != null){
		for(int i=0;i<cookies.length;i++){
			Cookie thisCookie = cookies[i];
			//쿠키명을 가져오기
			String n = thisCookie.getName();
			//쿠키명에 매핑되어 있는 값을 가져오기
			if(n.equals("Shipping_cartid")){
				shipping_cartid = URLDecoder.decode(thisCookie.getValue(),"UTF-8");
			}
			if(n.equals("Shipping_name")){
				shipping_name = URLDecoder.decode(thisCookie.getValue(),"UTF-8");
			}
			if(n.equals("Shipping_shippingDate")){
				shipping_shippingDate = URLDecoder.decode(thisCookie.getValue(),"UTF-8");
			}
			if(n.equals("Shipping_country")){
				shipping_country = URLDecoder.decode(thisCookie.getValue(),"UTF-8");
			}
			if(n.equals("Shipping_zipCode")){
				shipping_zipCode = URLDecoder.decode(thisCookie.getValue(),"UTF-8");
			}
			if(n.equals("Shipping_addressName")){
				shipping_addressName = URLDecoder.decode(thisCookie.getValue(),"UTF-8");
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

	<%@ include file="Link.jsp"%>
	<%! String greeting = "주문 정보";%>
	
	<div class = "jumbotron">
		<div class = "container">
			<h1 class = "display-3">
				<%= greeting %>
			</h1>		
		</div>
	</div>
	<div class="container col-8 alert alert-info">
		<div class="text-center">
			<h1>영수증</h1>
		</div>
		<!-- 배송에 관한 정보 시작 -->
		<div class="row justify-content-between">
			<div class="col-4" align="left">
				<strong>배송 주소</strong><br />
				성명 : <%=shipping_name%><br />
				우편번호 : <%=shipping_zipCode%><br />
				주소 : <%=shipping_addressName%><br />(<%=shipping_country%>)<br />
			</div>
			<div class="col-4" align="right">
				<p><em>배송일 : <%=shipping_shippingDate%></em></p>
			</div>
		</div>
		<!-- 배송에 관한 정보 끝 -->
		<div>
			<table class="table table-hover">
				<tr>
					<td class="text-center">상품</td>
					<td class="text-center">#</td>
					<td class="text-center">가격</td>
					<td class="text-center">소계</td>
				</tr>
				<%
					//장바구니는 세션을 사용한다(세션명 : cartlist)
					ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartlist");
			
					if(cartList == null){
						cartList = new ArrayList<Product>();
					}
					int sum = 0;	
			     	for(int i = 0; i < cartList.size(); i++){
			     		Product product = cartList.get(i);
			          	int total = product.getUnitPrice() * product.getQuantity();
			          	sum = sum + total;
				%>
				
				<tr>
					<td class="text-center"><em><%=product.getProductID() %> </em></td>
					<td class="text-center"><%=product.getQuantity() %></td>
					<td class="text-center"><%=dFormat.format(product.getUnitPrice())%></td>
					<td class="text-center"><%=dFormat.format(total) %>원</td>
				</tr>
				<%
			      }
				%>
				<tr>
					<td></td>
					<td></td>
					<td class="text-right"><strong>총액 : </strong></td>
					<td class="text-center text-danger"><strong><%=dFormat.format(sum)%></strong></td>
				</tr>
			</table>
			
			<a href="shippingInfo.jsp?cartId=${param.cartId}" class="btn btn-secondary" role="button">이전</a>
			<a href="thankCustomer.jsp" class="btn btn-success" role="button">주문 완료</a>
			<a href="checkOutCancelled.jsp" class="btn btn-secondary" role="button">취소</a>
			
		</div>
	</div>
</body>
</html>