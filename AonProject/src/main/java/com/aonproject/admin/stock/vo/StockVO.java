package com.aonproject.admin.stock.vo;

public class StockVO {
	private String p_no = "";			//상품번호
	private int stock_cnt = 0;			//재고수량
	private String stock_date = "";		//등록일
	
	//상품 추가 정보
	private String ca_name = "";		//상품카테고리명
	private String p_type_name = "";	//상품타입
	private String p_name = "";			//상품명
	private int p_price = 0;			//상품가격
	private String color = "";			//상품색상
	private String size = "";			//상품사이즈
	
	
	
	
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getCa_name() {
		return ca_name;
	}
	public void setCa_name(String ca_name) {
		this.ca_name = ca_name;
	}
	public String getP_type_name() {
		return p_type_name;
	}
	public void setP_type_name(String p_type_name) {
		this.p_type_name = p_type_name;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getP_no() {
		return p_no;
	}
	public void setP_no(String p_no) {
		this.p_no = p_no;
	}
	public int getStock_cnt() {
		return stock_cnt;
	}
	public void setStock_cnt(int stock_cnt) {
		this.stock_cnt = stock_cnt;
	}
	public String getStock_date() {
		return stock_date;
	}
	public void setStock_date(String stock_date) {
		this.stock_date = stock_date;
	}
	
	
}
