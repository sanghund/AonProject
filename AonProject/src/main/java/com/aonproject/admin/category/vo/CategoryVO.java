package com.aonproject.admin.category.vo;

public class CategoryVO {
	//상품 카테고리 (2017 F/W, 2017 S/S etc)
	private int ca_no;			//카테고리 번호
	private String ca_name;		//카테고리 이름
	private String ca_date;		//등록일
	
	public int getCa_no() {
		return ca_no;
	}
	public void setCa_no(int ca_no) {
		this.ca_no = ca_no;
	}
	public String getCa_name() {
		return ca_name;
	}
	public void setCa_name(String ca_name) {
		this.ca_name = ca_name;
	}
	public String getCa_date() {
		return ca_date;
	}
	public void setCa_date(String ca_date) {
		this.ca_date = ca_date;
	}
	
	
}
