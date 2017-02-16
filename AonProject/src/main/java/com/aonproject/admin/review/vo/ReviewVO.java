package com.aonproject.admin.review.vo;

import com.aonproject.common.util.vo.CommonPagingVO;

public class ReviewVO extends CommonPagingVO{ 

	private int re_no = 0;           //등록번호
	private String re_title = "";    //리뷰 제목
	private String re_content = "";	//리뷰 내용
	private String re_date = "";  	//리뷰 등록일
	private String re_pwd = "";		//리뷰 비밀번호
	private String re_chk = "";  	//댓글 등록여부(Y, N)
	private String re_name = "";     //작성자
	private int m_no = 0;           //멤버 번호
	private int o_no = 0;           //주문번호
	private String p_no = "";        //상품 번호
	
	private String pi_route = "";
	private String pi_file = "";
	
	
	public String getPi_route() {
		return pi_route;
	}
	public void setPi_route(String pi_route) {
		this.pi_route = pi_route;
	}
	public String getPi_file() {
		return pi_file;
	}
	public void setPi_file(String pi_file) {
		this.pi_file = pi_file;
	}

	public int getRe_no() {
		return re_no;
	}
	public void setRe_no(int re_no) {
		this.re_no = re_no;
	}
	public String getRe_title() {
		return re_title;
	}
	public void setRe_title(String re_title) {
		this.re_title = re_title;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public String getRe_date() {
		return re_date;
	}
	public void setRe_date(String re_date) {
		this.re_date = re_date;
	}
	public String getRe_pwd() {
		return re_pwd;
	}
	public void setRe_pwd(String re_pwd) {
		this.re_pwd = re_pwd;
	}
	public String getRe_chk() {
		return re_chk;
	}
	public void setRe_chk(String re_chk) {
		this.re_chk = re_chk;
	}
	public String getRe_name() {
		return re_name;
	}
	public void setRe_name(String re_name) {
		this.re_name = re_name;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public int getO_no() {
		return o_no;
	}
	public void setO_no(int o_no) {
		this.o_no = o_no;
	}
	public String getP_no() {
		return p_no;
	}
	public void setP_no(String p_no) {
		this.p_no = p_no;
	}
	
	@Override
	public String toString() {
		return "ReviewVO [re_no=" + re_no + ", re_title=" + re_title + ", re_content=" + re_content + ", re_date="
				+ re_date + ", re_pwd=" + re_pwd + ", re_chk=" + re_chk + ", re_name=" + re_name + ", m_no=" + m_no
				+ ", o_no=" + o_no + ", p_no=" + p_no + ", pi_route=" + pi_route + ", pi_file=" + pi_file + "]";
	}
	
	
	
	
}
