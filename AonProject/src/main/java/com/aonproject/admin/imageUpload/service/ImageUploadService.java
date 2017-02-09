package com.aonproject.admin.imageUpload.service;

import java.util.List;

import com.aonproject.admin.imageUpload.vo.ImageUploadVO;

public interface ImageUploadService {
	
    public List<ImageUploadVO> imageUploadList(ImageUploadVO iuvo);
    public int imageUploadInsert(ImageUploadVO iuvo);
	public List<String> main();
}
