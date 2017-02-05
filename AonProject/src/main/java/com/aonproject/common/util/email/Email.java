package com.aonproject.common.util.email;

public class Email {
	private String subject = ""; // 본문
	private String content = ""; // 내용
	private String reciver = ""; // 받는 사람
	
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReciver() {
		return reciver;
	}
	public void setReciver(String reciver) {
		this.reciver = reciver;
	}
	
	
}
