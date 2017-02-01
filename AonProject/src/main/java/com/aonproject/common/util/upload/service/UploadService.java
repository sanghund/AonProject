package com.aonproject.common.util.upload.service;

import java.util.List;

import com.aonproject.common.util.upload.vo.UploadVO;

public interface UploadService {
	public List<UploadVO> uploadList(UploadVO uvo);
	
	public int uploadInsert(UploadVO uvo);
	public int uploadUpdate(UploadVO uvo);
	public int uploadDelete(UploadVO uvo);
}