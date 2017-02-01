package com.aonproject.common.util.upload.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aonproject.admin.product.controller.ProductController;
import com.aonproject.common.util.upload.vo.UploadVO;

@Repository
public class UploadDAOImpl implements UploadDAO {
	Logger logger = Logger.getLogger(ProductController.class);
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<UploadVO> uploadList(UploadVO uvo) {
		return session.selectList("uploadList", uvo);
	}

	@Override
	public int uploadInsert(UploadVO uvo) {
		return session.insert("uploadInsert", uvo);
	}

	@Override
	public int uploadUpdate(UploadVO uvo) {
		return session.update("uploadUpdate", uvo);
	}

	@Override
	public int uploadDelete(UploadVO uvo) {
		return session.delete("uploadDelete", uvo);
	}

	
	
	
}