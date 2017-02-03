package com.aonproject.admin.notice.vo;

import java.sql.Timestamp;

import com.aonproject.common.vo.CommonVO;

public class NoticeVO extends CommonVO {
	
	private int no_num;
	private String no_title;
	private String no_content;
	private Timestamp no_date;
	private int a_no;
	
	public int getNo_num() {
		return no_num;
	}
	public void setNo_num(int no_num) {
		this.no_num = no_num;
	}
	public String getNo_title() {
		return no_title;
	}
	public void setNo_title(String no_title) {
		this.no_title = no_title;
	}
	public String getNo_content() {
		return no_content;
	}
	public void setNo_content(String no_content) {
		this.no_content = no_content;
	}
	public Timestamp getNo_date() {
		return no_date;
	}
	public void setNo_date(Timestamp no_date) {
		this.no_date = no_date;
	}
	public int getA_no() {
		return a_no;
	}
	public void setA_no(int a_no) {
		this.a_no = a_no;
	}

}
