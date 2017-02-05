package com.aonproject.admin.review.vo;

import org.springframework.web.multipart.MultipartFile;

public class ReviewVO { 
	private int re_no;           //등록번호
	private String re_title;    //리뷰 제목
	private String re_content;	//리뷰 내용
	private String re_date;  	//리뷰 등록일
	private String re_pwd;		//리뷰 비밀번호
	private String re_chk;  	//댓글 등록여부(Y, N)
	
	//파일 업로드를 위한 속성
	private MultipartFile file; //첨부파일
	private String re_file = "";		//댓글 첨부파일
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getRe_file() {
		return re_file;
	}
	public void setRe_file(String re_file) {
		this.re_file = re_file;
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
	
}
