package com.aonproject.client.order.vo;

import java.util.List;

public class Product_orderVO {
	private int 	o_no;			//주문번호		
	private int 	o_cnt;			//주문수량
	private int 	o_price;		//주문가격
	private String 	o_mode;			//결재방법
	private String 	o_confirm;		//결재유무
	private String 	o_date;			//등록일
	private int 	m_no;			//회원번호
	private String 	p_no;			//상품번호
	
	private List<String> p_nos;		//상품번호 리스트
	private List<Integer> o_cnts;	//상품 주문수량 리스트
	
	
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
	public int getO_no() {
		return o_no;
	}
	public void setO_no(int o_no) {
		this.o_no = o_no;
	}
	public int getO_cnt() {
		return o_cnt;
	}
	public void setO_cnt(int o_cnt) {
		this.o_cnt = o_cnt;
	}
	public int getO_price() {
		return o_price;
	}
	public void setO_price(int o_price) {
		this.o_price = o_price;
	}
	public String getO_mode() {
		return o_mode;
	}
	public void setO_mode(String o_mode) {
		this.o_mode = o_mode;
	}
	public String getO_confirm() {
		return o_confirm;
	}
	public void setO_confirm(String o_confirm) {
		this.o_confirm = o_confirm;
	}
	public String getO_date() {
		return o_date;
	}
	public void setO_date(String o_date) {
		this.o_date = o_date;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getP_no() {
		return p_no;
	}
	public void setP_no(String p_no) {
		this.p_no = p_no;
	}
	
	
}
