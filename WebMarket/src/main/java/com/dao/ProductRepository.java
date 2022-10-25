package com.dao;
import com.dto.Product;
import java.sql.*;
import java.util.*;

public class ProductRepository {
	ArrayList<Product> listProducts = new ArrayList<>();
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private static String url = "jdbc:mysql://localhost:3306/jspWebMarket";
	private static String user = "root";
	private static String password = "1234";
	
	
	public ArrayList<Product> getAllProducts(){
		String sql = "select * from product";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Product product = new Product();
				product.setProductID(rs.getString("productID"));
				product.setPname(rs.getString("pname"));
				product.setUnitPrice(Integer.parseInt(rs.getString("unitPrice")));
				product.setDescription(rs.getString("description"));
				product.setManufacturer(rs.getString("maufacture"));
				product.setCategory(rs.getString("category"));
				product.setUnitsInStock(Integer.parseInt(rs.getString("unitsInStock")));
				product.setCondition(rs.getString("conditions"));
				product.setFilename(rs.getString("filename"));
				
				listProducts.add(product);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				System.out.println("DB연동해제");
				
			} catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return listProducts;
	}
	
	public Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("DB 연동완료");
		} catch(Exception e) {
			System.out.println("DB연동실패");
			e.printStackTrace();
		}
		return conn;
	}
	
	public Product getProductByID(String productid) {
		Product productByID = new Product();
		String sql = "select * from product where productID=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productid);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				productByID.setProductID(rs.getString(1));
				productByID.setPname(rs.getString(2));
				productByID.setUnitPrice(Integer.parseInt(rs.getString(3)));
				productByID.setDescription(rs.getString(4));
				productByID.setManufacturer(rs.getString(5));
				productByID.setCategory(rs.getString(6));
				productByID.setUnitsInStock(Integer.parseInt(rs.getString(7)));
				productByID.setCondition(rs.getString(8));
				productByID.setFilename(rs.getString(9));
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return productByID;
	}
	public void addProduct(Product product) {
		listProducts.add(product);
	}
}
