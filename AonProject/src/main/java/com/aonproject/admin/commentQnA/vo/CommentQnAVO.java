package com.aonproject.admin.commentQnA.vo;

import com.aonproject.common.util.vo.CommonPagingVO;

public class CommentQnAVO extends CommonPagingVO{
	private int cq_no;     
	private String cq_title;     
	private String cq_content;
	private String cq_date;    
	private String cq_pwd;
	private int q_no;
	public int getCq_no() {
		return cq_no;
	}
	public void setCq_no(int cq_no) {
		this.cq_no = cq_no;
	}
	public String getCq_title() {
		return cq_title;
	}
	public void setCq_title(String cq_title) {
		this.cq_title = cq_title;
	}
	public String getCq_content() {
		return cq_content;
	}
	public void setCq_content(String cq_content) {
		this.cq_content = cq_content;
	}
	public String getCq_date() {
		return cq_date;
	}
	public void setCq_date(String cq_date) {
		this.cq_date = cq_date;
	}
	public String getCq_pwd() {
		return cq_pwd;
	}
	public void setCq_pwd(String cq_pwd) {
		this.cq_pwd = cq_pwd;
	}
	public int getQ_no() {
		return q_no;
	}
	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}
}
