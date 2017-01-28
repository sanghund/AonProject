package com.aonproject.common.util.upload.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

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
	public int uploadInsert(UploadVO uvo, HttpServletRequest request) {
		List<MultipartFile> files = uvo.getFile();
		List<String> fileNames = new ArrayList<String>();
		
		if(files != null && files.size() > 0){
			for(MultipartFile multipartFile : files){
				String fileName = multipartFile.getOriginalFilename();
				fileNames.add(fileName);
				
				//File imgFile = new File()
				
			}
		}
		return 0;
	}

	
}
