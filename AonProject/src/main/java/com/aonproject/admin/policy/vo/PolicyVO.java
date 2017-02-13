package com.aonproject.admin.policy.vo;

public class PolicyVO {
	private int po_no = 0;
	private String po_name = "";
	private String po_content = "";
	private String po_type = "";
	private String po_date = "";

	public int getPo_no() {
		return po_no;
	}
	public void setPo_no(int po_no) {
		this.po_no = po_no;
	}
	public String getPo_name() {
		return po_name;
	}
	public void setPo_name(String po_name) {
		this.po_name = po_name;
	}
	public String getPo_content() {
		return po_content;
	}
	public void setPo_content(String po_content) {
		this.po_content = po_content;
	}
	public String getPo_type() {
		return po_type;
	}
	public void setPo_type(String po_type) {
		this.po_type = po_type;
	}
	public String getPo_date() {
		return po_date;
	}
	public void setPo_date(String po_date) {
		this.po_date = po_date;
	}
	
	@Override
	public String toString() {
		return "PolicyVO [po_no=" + po_no + ", po_name=" + po_name + ", po_content=" + po_content + ", po_type="
				+ po_type + ", po_date=" + po_date + "]";
	}
}
