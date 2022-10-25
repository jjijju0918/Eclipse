<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dto.Product"%>
<%@ page import = "java.util.ArrayList" %>
<jsp:useBean id = "productDAO" class = "com.dao.ProductRepository" scope="session"/>
<%
	

	String id = request.getParameter("cartId");

	ArrayList<Product> cartList  = (ArrayList<Product>)session.getAttribute("cartlist");
	
	for(int i = 0; i<cartList.size();i++){
		Product get = cartList.get(i);
		if(get.getProductID().equals(id)){
			cartList.remove(i);
			break;
		}
	}
	response.sendRedirect("cart.jsp");
	
%>
