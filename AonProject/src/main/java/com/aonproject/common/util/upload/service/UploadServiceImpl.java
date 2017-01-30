package com.aonproject.common.util.upload.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aonproject.common.util.upload.dao.UploadDAO;
import com.aonproject.common.util.upload.vo.UploadVO;

@Service
@Transactional
public class UploadServiceImpl implements UploadService {
	
	@Autowired
	private UploadDAO uploadDAO;
	
	/*이미지 리스트 구현*/
	@Override
	public List<UploadVO> uploadList(UploadVO uvo) {
		List<UploadVO> uploadList = null;
		uploadList = uploadDAO.uploadList(uvo);
		return uploadList;
	}

	@Override
	public int uploadInsert(UploadVO uvo) {
		int result = 0;
		result = uploadDAO.uploadInsert(uvo);
		return result;
	}

	@Override
	public int uploadUpdate(UploadVO uvo) {
		int result = 0;
		result = uploadDAO.uploadUpdate(uvo);
		return result;
	}


	
}