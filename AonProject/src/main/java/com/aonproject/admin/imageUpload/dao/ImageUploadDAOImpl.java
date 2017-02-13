package com.aonproject.admin.imageUpload.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aonproject.admin.imageUpload.controller.ImageUploadController;
import com.aonproject.admin.imageUpload.vo.ImageUploadVO;

@Repository
public class ImageUploadDAOImpl implements ImageUploadDAO {
	Logger logger = Logger.getLogger(ImageUploadController.class);
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<ImageUploadVO> imageUploadList(ImageUploadVO iuvo) {
		return session.selectList("imageUploadList", iuvo);
	}
	
	@Override
	public int imageUploadInsert(ImageUploadVO iuvo) {
		return session.insert("imageUploadInsert", iuvo);
	}

	@Override
	public List<String> main() {
		// TODO Auto-generated method stub
		return session.selectList("main");
	}

}
