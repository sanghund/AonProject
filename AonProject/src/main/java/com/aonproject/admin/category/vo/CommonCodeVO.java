package com.aonproject.admin.category.vo;

public class CommonCodeVO {
	//공통코드마스터
	private String cc_no;		//공통코드 (c1~c?: 색상, s1~s4:사이즈, t1~t?:상품종) 
	private String cc_name;		//코드이름
	private String cc_group;	//코드그룹
	private String cc_desc;		//코드설명
	private String cc_date;		//등록일
	
	public String getCc_no() {
		return cc_no;
	}
	public void setCc_no(String cc_no) {
		this.cc_no = cc_no;
	}
	public String getCc_name() {
		return cc_name;
	}
	public void setCc_name(String cc_name) {
		this.cc_name = cc_name;
	}
	public String getCc_group() {
		return cc_group;
	}
	public void setCc_group(String cc_group) {
		this.cc_group = cc_group;
	}
	public String getCc_desc() {
		return cc_desc;
	}
	public void setCc_desc(String cc_desc) {
		this.cc_desc = cc_desc;
	}
	public String getCc_date() {
		return cc_date;
	}
	public void setCc_date(String cc_date) {
		this.cc_date = cc_date;
	}
	
	
}
