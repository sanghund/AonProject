package com.aonproject.admin.reviewImg.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ReviewImgVO {
	private int ri_no;
	private String ri_route;
	private String ri_file;
	private String ri_date;
	private int re_no;
	private List<MultipartFile> files;
	private MultipartFile file;
	
	public int getRi_no() {
		return ri_no;
	}
	public void setRi_no(int ri_no) {
		this.ri_no = ri_no;
	}
	public String getRi_route() {
		return ri_route;
	}
	public void setRi_route(String ri_route) {
		this.ri_route = ri_route;
	}
	public String getRi_file() {
		return ri_file;
	}
	public void setRi_file(String ri_file) {
		this.ri_file = ri_file;
	}
	public String getRi_date() {
		return ri_date;
	}
	public void setRi_date(String ri_date) {
		this.ri_date = ri_date;
	}
	public int getRe_no() {
		return re_no;
	}
	public void setRe_no(int re_no) {
		this.re_no = re_no;
	}
	public List<MultipartFile> getFiles() {
		return files;
	}
	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
}
