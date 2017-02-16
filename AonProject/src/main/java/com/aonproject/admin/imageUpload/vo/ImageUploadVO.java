package com.aonproject.admin.imageUpload.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ImageUploadVO {
	private int mp_no;  // 사진 번호
	private String mp_route; // 실제 경로
	private String mp_date; //등록일
	private List<MultipartFile> files;
	private MultipartFile file;
	private String mp_file; // 이미지
	
	public int getMp_no() {
		return mp_no;
	}
	public void setMp_no(int mp_no) {
		this.mp_no = mp_no;
	}
	public String getMp_route() {
		return mp_route;
	}
	public void setMp_route(String mp_route) {
		this.mp_route = mp_route;
	}
	public String getMp_date() {
		return mp_date;
	}
	public void setMp_date(String mp_date) {
		this.mp_date = mp_date;
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
	public String getMp_file() {
		return mp_file;
	}
	public void setMp_file(String mp_file) {
		this.mp_file = mp_file;
	}
	

}
