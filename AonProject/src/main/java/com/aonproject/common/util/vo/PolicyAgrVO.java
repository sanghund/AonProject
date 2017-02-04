package com.aonproject.common.util.vo;

import com.aonproject.admin.policy.vo.PolicyVO;

public class PolicyAgrVO extends PolicyVO{
	private String pa_confirm = "";
	private String pa_date = "";
	private int m_no = 0;
	
	private String adminSearch = "";
	private String memberSearch = "";
	private String nonmemberSearch = "";
	
	
	
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getAdminSearch() {
		return adminSearch;
	}
	public void setAdminSearch(String adminSearch) {
		this.adminSearch = adminSearch;
	}
	public String getMemberSearch() {
		return memberSearch;
	}
	public void setMemberSearch(String memberSearch) {
		this.memberSearch = memberSearch;
	}
	public String getNonmemberSearch() {
		return nonmemberSearch;
	}
	public void setNonmemberSearch(String nonmemberSearch) {
		this.nonmemberSearch = nonmemberSearch;
	}
	public String getPa_confirm() {
		return pa_confirm;
	}
	public void setPa_confirm(String pa_confirm) {
		this.pa_confirm = pa_confirm;
	}
	public String getPa_date() {
		return pa_date;
	}
	public void setPa_date(String pa_date) {
		this.pa_date = pa_date;
	}
	
	
}
