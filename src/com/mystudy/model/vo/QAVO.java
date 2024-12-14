package com.mystudy.model.vo;

import java.util.Date;

public class QAVO {
    private int qaId;
    private String memid;
    private String productCode;
    private String category;
    private String title;
    private Date rDate;
    private String content;
    private String img;
    private int parentQaId;

    public int getQaId() {
        return qaId;
    }

    public void setQaId(int qaId) {
        this.qaId = qaId;
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

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getrDate() {
        return rDate;
    }

    public void setrDate(Date rDate) {
        this.rDate = rDate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getParentQaId() {
        return parentQaId;
    }

    public void setParentQaId(int parentQaId) {
        this.parentQaId = parentQaId;
    }

    @Override
    public String toString() {
        return "QAVO{" +
                "qaId=" + qaId +
                ", memid=" + memid +
                ", productCode=" + productCode +
                ", category='" + category + '\'' +
                ", title='" + title + '\'' +
                ", rDate=" + rDate +
                ", content='" + content + '\'' +
                ", img='" + img + '\'' +
                ", parentQaId=" + parentQaId +
                '}';
    }
}



