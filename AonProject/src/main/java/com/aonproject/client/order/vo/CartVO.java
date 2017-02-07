package com.aonproject.client.order.vo;

import java.util.List;

public class CartVO {
	private String p_no = ""; // 상품 번호
	private int o_cnt = 0; // 상품 수량
	private String p_name = ""; // 상품 이름
	private String p_type = ""; // 상품 종류
	private int p_price = 0; // 상품 가격
	private int p_discount = 0; // 할인율
	private String p_color = ""; // 상품 색상
	private String p_size = ""; // 상품 사이즈
	private String pi_file = ""; // 상품 이미지 이름
	private String pi_route = ""; // 상품 이미지 실제 경로
	private String color_code = ""; // 색상 코드
	private String size_code = ""; // 사이즈코드
	
	private List<String> p_nos = null;
	private List<Integer> o_cnts = null;
	private List<String> cd = null;
	
	public List<String> getCd() {
		return cd;
	}
	public void setCd(List<String> cd) {
		this.cd = cd;
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
	public String getPi_file() {
		return pi_file;
	}
	public void setPi_file(String pi_file) {
		this.pi_file = pi_file;
	}
	public String getPi_route() {
		return pi_route;
	}
	public void setPi_route(String pi_route) {
		this.pi_route = pi_route;
	}
	public String getP_type() {
		return p_type;
	}
	public void setP_type(String p_type) {
		this.p_type = p_type;
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
	public String getP_color() {
		return p_color;
	}
	public void setP_color(String p_color) {
		this.p_color = p_color;
	}
	public String getP_size() {
		return p_size;
	}
	public void setP_size(String p_size) {
		this.p_size = p_size;
	}
	public String getP_no() {
		return p_no;
	}
	public void setP_no(String p_no) {
		this.p_no = p_no;
	}
	public int getO_cnt() {
		return o_cnt;
	}
	public void setO_cnt(int o_cnt) {
		this.o_cnt = o_cnt;
	}
	public List<String> getP_nos() {
		return p_nos;
	}
	public void setP_nos(List<String> p_nos) {
		this.p_nos = p_nos;
	}
	public List<Integer> getO_cnts() {
		return o_cnts;
	}
	public void setO_cnts(List<Integer> o_cnts) {
		this.o_cnts = o_cnts;
	}
	
	
	
}
