package com.mystudy.model.vo;

import java.util.Date;

public class CartVO {
    private int cartId;
    private String memid;
    private String productCode;
    private int cnt;
    private Date rDate;
    private int price; // price 필드 추가
    private  String productName;


    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public String getMemid() {
        return memid;
    }

    public void setMemid(String memid) {
        this.memid = memid;
    }

    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public int getCnt() {
        return cnt;
    }

    public void setCnt(int cnt) {
        this.cnt = cnt;
    }

    public Date getrDate() {
        return rDate;
    }

    public void setrDate(Date rDate) {
        this.rDate = rDate;
    }
    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    @Override
    public String toString() {
        return "CartVO{" +
                "cartId=" + cartId +
                ", memid='" + memid + '\'' +
                ", productCode='" + productCode + '\'' +
                ", cnt=" + cnt +
                ", rDate=" + rDate +
                '}';
    }

}