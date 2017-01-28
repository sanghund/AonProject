package com.aonproject.common.util.upload.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class UploadVO {
	private int pi_no;
	private String p_no;
	private String pi_route;
	private String pi_file;
	private List<MultipartFile> file;
	private String pi_Date;
	
	

	public List<MultipartFile> getFile() {
		return file;
	}
	public void setFile(List<MultipartFile> file) {
		this.file = file;
	}
	public int getPi_no() {
		return pi_no;
	}
	public void setPi_no(int pi_no) {
		this.pi_no = pi_no;
	}
	public String getP_no() {
		return p_no;
	}
	public void setP_no(String p_no) {
		this.p_no = p_no;
	}
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
	public String getPi_Date() {
		return pi_Date;
	}
	public void setPi_Date(String pi_Date) {
		this.pi_Date = pi_Date;
	}
	
	 
}
