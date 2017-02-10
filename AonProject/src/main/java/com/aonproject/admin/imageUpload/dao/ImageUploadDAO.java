package com.aonproject.admin.imageUpload.dao;

import java.util.List;


import com.aonproject.admin.imageUpload.vo.ImageUploadVO;

public interface ImageUploadDAO {
	public List<ImageUploadVO> imageUploadList(ImageUploadVO iuvo);
	public int imageUploadInsert(ImageUploadVO iuvo);
	public List<String> main();
}
