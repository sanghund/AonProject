package com.aonproject.admin.product.vo;

public class ProductVO {
	private String p_no;		//상품 코드
	private String p_name;		//상품명
	private int	p_price;		//상품 가격
	private int p_discount;		//상품 할인율
	private String color_code;	//색상 코드
	private String size_code;	//사이즈 코드
	private String p_fabric;	//상품 소재
	private String p_caution;	//주의사항
	private String p_date;		//등록일
	private int ca_no;			//카테고리 번호
	private String p_type;		//상품타입
	
	//카테고리 노출 필드 선언
	private String ca_name;		//카테고리 이름

	
	public String getCa_name() {
		return ca_name;
	}
	public void setCa_name(String ca_name) {
		this.ca_name = ca_name;
	}
	public String getP_type() {
		return p_type;
	}
	public void setP_type(String p_type) {
		this.p_type = p_type;
	}
	public String getP_no() {
		return p_no;
	}
	public void setP_no(String p_no) {
		this.p_no = p_no;
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
	public int getP_discount() {
		return p_discount;
	}
	public void setP_discount(int p_discount) {
		this.p_discount = p_discount;
	}
	public String getColor_code() {
		return color_code;
	}
	public void setColor_code(String color_code) {
		this.color_code = color_code;
	}
	public String getSize_code() {
		return size_code;
	}
	public void setSize_code(String size_code) {
		this.size_code = size_code;
	}
	public String getP_fabric() {
		return p_fabric;
	}
	public void setP_fabric(String p_fabric) {
		this.p_fabric = p_fabric;
	}
	public String getP_caution() {
		return p_caution;
	}
	public void setP_caution(String p_caution) {
		this.p_caution = p_caution;
	}
	public String getP_date() {
		return p_date;
	}
	public void setP_date(String p_date) {
		this.p_date = p_date;
	}
	public int getCa_no() {
		return ca_no;
	}
	public void setCa_no(int ca_no) {
		this.ca_no = ca_no;
	}

	
	
}
