package com.aonproject.admin.imageUpload.controller;

import java.io.IOException;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.aonproject.admin.imageUpload.service.ImageUploadService;
import com.aonproject.admin.imageUpload.vo.ImageUploadVO;
import com.aonproject.common.util.upload.FileUploadUtil;

@Controller
@RequestMapping(value = "/admin")
public class ImageUploadController {
	Logger logger = Logger.getLogger(ImageUploadController.class);
	
	@Autowired
	private ImageUploadService imageUploadService;
	
	/*메인 이미지 리스트*/
	@RequestMapping(value = "/imageUploadList", method=RequestMethod.GET)
	public String imageUploadList(@ModelAttribute ImageUploadVO iuvo, Model model){
		logger.info("imageUploadList 호출 성공");
		
		List<ImageUploadVO> imageuploadList = imageUploadService.imageUploadList(iuvo);
		
		model.addAttribute("imageuploadList", imageuploadList);
		
		return "admin/imageUpload/upload";
	}
	
	/*메인 이미지 등록*/
	@RequestMapping(value = "/upload/ImageUploadInsert")
	public String imageUploadInsert(@ModelAttribute ImageUploadVO iuvo, HttpServletRequest request) throws IllegalStateException, IOException {
		logger.info("imageUploadInsert 호출 성공");
		
		
		List<MultipartFile> files = iuvo.getFiles();
		
		for(int i=0; i<files.size(); i++){
			ImageUploadVO ivo = iuvo;
			ivo.setFile(ivo.getFiles().get(i));
			ivo.setMp_file(FileUploadUtil.fileUpload("main", ivo.getFile(), request));
			imageUploadService.imageUploadInsert(ivo);
		}
		
		return "redirect:/admin/imageUploadList";
	}
	
}
