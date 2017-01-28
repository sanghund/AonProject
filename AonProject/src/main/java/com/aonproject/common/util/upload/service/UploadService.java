package com.aonproject.common.util.upload.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.aonproject.common.util.upload.vo.UploadVO;

public interface UploadService {
	public List<UploadVO> uploadList(UploadVO uvo);
	
	public int uploadInsert(UploadVO uvo, HttpServletRequest request);
}
