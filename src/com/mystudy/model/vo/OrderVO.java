package com.mystudy.model.vo;

import java.sql.Date;

public class OrderVO {
	private String orderNumber;	//주문번호
	private String productCode;	//상품코드
	private int orderCount;		//주문수량
	private String payment;		//결재수단
	private int totalPrice;		//총 금액
	private String id;			//회원아이디
	private String address;		//회원주소
	private String purchaseDate;	//주문(구매)날짜
	
	
	public String getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public int getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPurchaseDate() {
		return purchaseDate;
	}
	public void setPurchaseDate(String purchaseDate) {
		this.purchaseDate = purchaseDate;
	}
	@Override
	public String toString() {
		return "OrderVO [orderNumber=" + orderNumber + ", productCode=" + productCode + ", orderCount=" + orderCount
				+ ", payment=" + payment + ", totalPrice=" + totalPrice + ", id=" + id + ", address=" + address
				+ ", purchaseDate=" + purchaseDate + "]";
	}
	
	
	
	
	
}
