<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "com.dto.Product" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.util.List" %>
<jsp:useBean id = "productDAO" class = "com.dao.ProductRepository" scope="session"/>
<%
		String id = request.getParameter("id");
		// 아이디가 없으면
		if(id==null || id.trim().equals("")){
			// product.jsp로 되돌아간다.
			response.sendRedirect("product.jsp");
			// 프로그램 종료
			return;
		}
		
		
		Product product = productDAO.getProductByID(id);
			
		List<Product> goodsList = productDAO.getAllProducts(); 
		
		goodsList.add(product);
		
		
		Product goods  = new Product();
		
		for(int i = 0; i<goodsList.size(); i++){
			goods  = goodsList.get(i);
			
			if(goods.getProductID().equals(id)){
				break;
			}
		}
			
		ArrayList<Product> list  = (ArrayList<Product>)session.getAttribute("cartlist");
		
		
		if(list == null){
			list = new ArrayList<Product>();
			session.setAttribute("cartlist",list);
		} 
		
		int cot = 0;
		Product CartQnt = new Product();
		for(int i =0; i<list.size(); i++){
			CartQnt = list.get(i);
			if(CartQnt.getProductID().equals(id)){
				cot++;
				int orderQuantity = CartQnt.getQuantity()+1;
				CartQnt.setQuantity(orderQuantity);
			}
		}
		
		if(cot == 0){
			goods.setQuantity(1);
			list.add(goods);
			
		}
		
		response.sendRedirect("product.jsp?id=" + id);	
		%>