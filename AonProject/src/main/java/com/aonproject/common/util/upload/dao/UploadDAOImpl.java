package com.aonproject.common.util.upload.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.aonproject.common.util.upload.controller.UploadController;
import com.aonproject.common.util.upload.vo.UploadVO;

@Repository
public class UploadDAOImpl implements UploadDAO {
	Logger logger = Logger.getLogger(UploadController.class);
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<UploadVO> uploadList(UploadVO uvo) {
		return session.selectList("uploadList", uvo);
	}

	@Override
	public int uploadInsert(UploadVO uvo, List<MultipartFile> getFileList) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
	
}
