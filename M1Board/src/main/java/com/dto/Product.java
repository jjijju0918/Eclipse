package com.dto;

import java.io.Serializable;


public class Product implements Serializable {
   
   private static final long serialVersionUID = 1L;
   
   private String productID;        // 상품아이디 
   private String pname;          	// 상품 이름
   private int unitPrice;       // 상품가격
   private String description;    	// 상품 설명
   private String maufacture;    	// 제조사
   private String category;       	// 분류
   private long unitsInStock;       // 재고 수
   private String condition;        // 신상, 중고, 재생
   private String filename;  		// 파일 이미지
   private int quantity;			//장바구니 

   public Product() {
      super();
   }
   
   public Product(String productID, String pname, int unitPrice) {
      this.productID = productID;
      this.pname = pname;
      this.unitPrice = unitPrice;
   }

   public String getProductID() {
      return productID;
   }

   public void setProductID(String productID) {
      this.productID = productID;
   }

   public String getPname() {
      return pname;
   }

   public void setPname(String pname) {
      this.pname = pname;
   }

   public int getUnitPrice() {
      return unitPrice;
   }

   public void setUnitPrice(int unitPrice) {
      this.unitPrice = unitPrice;
   }

   public String getDescription() {
      return description;
   }

   public void setDescription(String description) {
      this.description = description;
   }

   public String getManufacturer() {
      return maufacture;
   }

   public void setManufacturer(String manufacturer) {
      this.maufacture = manufacturer;
   }

   public String getCategory() {
      return category;
   }

   public void setCategory(String category) {
      this.category = category;
   }

   public long getUnitsInStock() {
      return unitsInStock;
   }

   public void setUnitsInStock(long unitsInStock) {
      this.unitsInStock = unitsInStock;
   }

   public String getCondition() {
      return condition;
   }

   public void setCondition(String condition) {
      this.condition = condition;
   }
   
   public String getFilename() {
	return filename;
   }

   public void setFilename(String filename) {
	   this.filename = filename;
   }
   
   public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}