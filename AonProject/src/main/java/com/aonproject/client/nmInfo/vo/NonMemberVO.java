package com.aonproject.client.nmInfo.vo;

import com.aonproject.common.util.vo.CommonPagingVO;

public class NonMemberVO extends CommonPagingVO{
	private int nm_no = 0;
	private String nm_tel = "";
	private String nm_name = "";
	private String nm_addr = "";
	private String nm_email = "";
	private String nm_validity = "";
	private String nm_date = "";
	public int getNm_no() {
		return nm_no;
	}
	public void setNm_no(int nm_no) {
		this.nm_no = nm_no;
	}
	public String getNm_tel() {
		return nm_tel;
	}
	public void setNm_tel(String nm_tel) {
		this.nm_tel = nm_tel;
	}
	public String getNm_name() {
		return nm_name;
	}
	public void setNm_name(String nm_name) {
		this.nm_name = nm_name;
	}
	public String getNm_addr() {
		return nm_addr;
	}
	public void setNm_addr(String nm_addr) {
		this.nm_addr = nm_addr;
	}
	public String getNm_email() {
		return nm_email;
	}
	public void setNm_email(String nm_email) {
		this.nm_email = nm_email;
	}
	public String getNm_validity() {
		return nm_validity;
	}
	public void setNm_validity(String nm_validity) {
		this.nm_validity = nm_validity;
	}
	public String getNm_date() {
		return nm_date;
	}
	public void setNm_date(String nm_date) {
		this.nm_date = nm_date;
	}
	
	
}
