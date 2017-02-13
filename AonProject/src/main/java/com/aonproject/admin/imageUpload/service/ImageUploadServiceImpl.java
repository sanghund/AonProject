package com.aonproject.admin.imageUpload.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aonproject.admin.imageUpload.dao.ImageUploadDAO;
import com.aonproject.admin.imageUpload.vo.ImageUploadVO;

@Service
@Transactional
public class ImageUploadServiceImpl implements ImageUploadService {
	
	@Autowired
	private ImageUploadDAO imageUploadDAO;
	
	
	public List<ImageUploadVO> imageUploadList(ImageUploadVO iuvo) {
		List<ImageUploadVO> imageUploadList = null;
		imageUploadList = imageUploadDAO.imageUploadList(iuvo);
		return imageUploadList;
	}
	
	public int imageUploadInsert(ImageUploadVO iuvo) {
		int result = 0;
		result = imageUploadDAO.imageUploadInsert(iuvo);
		return result;
	}

	@Override
	public List<String> main() {
		// TODO Auto-generated method stub
		return imageUploadDAO.main();
	}

}
