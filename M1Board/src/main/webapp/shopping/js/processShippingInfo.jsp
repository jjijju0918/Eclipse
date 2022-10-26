<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	//쿠키 생성 문법?
	//Cookie 객체명 = new Cookie(name,value);
	Cookie cartid = new Cookie("Shipping_cartid", 
			URLEncoder.encode(request.getParameter("cartid"), "UTF-8"));
	
	Cookie name = new Cookie("Shipping_name", 
			URLEncoder.encode(request.getParameter("name"), "UTF-8"));
	
	Cookie shippingDate = new Cookie("Shipping_shippingDate", 
			URLEncoder.encode(request.getParameter("shoppingDate"), "UTF-8"));
	
	Cookie countyu = new Cookie("Shipping_country", 
			URLEncoder.encode(request.getParameter("countyu"), "UTF-8"));
	
	/*Cookie zipCode = new Cookie("Shipping_zipCode", 
			URLEncoder.encode(request.getParameter("zipCode"), "UTF-8"));*/
	
	Cookie addressName = new Cookie("Shipping_addressName", 
			URLEncoder.encode(request.getParameter("addressName"), "UTF-8"));
	
	cartid.setMaxAge(24*60*60);
	name.setMaxAge(24*60*60);
	shippingDate.setMaxAge(24*60*60);
	countyu.setMaxAge(24*60*60);
	//zipCode.setMaxAge(24*60*60);
	addressName.setMaxAge(24*60*60);
	
	//쿠키를 등록하기 위해 response객체를 통해 클라이언트(크롬)에게 전달해줌
	response.addCookie(cartid);
	response.addCookie(name);
	response.addCookie(shippingDate);
	response.addCookie(countyu);
	//response.addCookie(zipCode);
	response.addCookie(addressName);

	response.sendRedirect("orderConfirmation.jsp");
%>