package com.mystudy.model.vo;

import java.sql.Date;

public class ReviewVO {
	private String id;
	private String content;
	private int record;
	private String productCode;
	private int reviewNum;
	private Date regdate;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRecord() {
		return record;
	}
	public void setRecord(int record) {
		this.record = record;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;		
	}
	
	public int getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "ReviewVO [id=" + id + ", content=" + content + ", record=" + record + ", productCode=" + productCode
				+ ", reviewNum=" + reviewNum + ", regdate=" + regdate + "]";
	}
	
	


	
	
	
}
