package com.mystudy.model.vo;

public class ProductVO {
	private String productCode;		//상품코드
	private String productName;		//상품이름
	private String categoryCode;	//카테고리
	private int price;				//상품가격
	private int stock;				//재고
	private String detail;			//상품설명
	private int saleCount;			//총주문수량
	private String useYn;			//상품사용여부
	
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getCategoryCode() {
		return categoryCode;
	}
	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public int getSaleCount() {
		return saleCount;
	}
	public void setSaleCount(int saleCount) {
		this.saleCount = saleCount;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	
	@Override
	public String toString() {
		return "ProductVO [productCode=" + productCode + ", productName=" + productName + ", categoryCode="
				+ categoryCode + ", price=" + price + ", stock=" + stock + ", detail=" + detail + ", saleCount="
				+ saleCount + ", useYn=" + useYn + "]";
	}
	
	
	
	
}
