package com.aonproject.common.util.vo;

import com.aonproject.admin.policy.vo.PolicyVO;

public class PolicyAgrVO extends PolicyVO{
	private String pa_confirm = "";
	private String pa_date = "";
	
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
