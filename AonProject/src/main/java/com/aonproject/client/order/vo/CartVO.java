package com.aonproject.client.order.vo;

import java.util.List;

public class CartVO {
	private String p_no = ""; // 상품 번호
	private int o_cnt = 0; // 상품 수량
	private List<String> p_nos = null;
	private List<Integer> o_cnts = null;
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
