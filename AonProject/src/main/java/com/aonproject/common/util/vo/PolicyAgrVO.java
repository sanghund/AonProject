package com.aonproject.common.util.vo;

import com.aonproject.admin.policy.vo.PolicyVO;

public class PolicyAgrVO extends PolicyVO{
	private String pa_confirm = "";
	private String pa_date = "";
	private int m_no = 0;
	private int po_no = 0;
	private String po_date = "";
	private String a_id = "";
	private String po_name = "";
	private String m_id = "";
	private String m_name = "";
	private String m_tel = "";
	private String m_email = "";
	
	
	public String getPo_date() {
		return po_date;
	}
	public void setPo_date(String po_date) {
		this.po_date = po_date;
	}
	public String getA_id() {
		return a_id;
	}
	public void setA_id(String a_id) {
		this.a_id = a_id;
	}
	public String getPo_name() {
		return po_name;
	}
	public void setPo_name(String po_name) {
		this.po_name = po_name;
	}
	private String adminSearch = "";
	private String memberSearch = "";
	private String nonmemberSearch = "";
	
	public int getPo_no() {
		return po_no;
	}
	public void setPo_no(int po_no) {
		this.po_no = po_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_tel() {
		return m_tel;
	}
	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
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
