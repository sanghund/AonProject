package com.aonproject.common.util.upload.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aonproject.common.util.upload.service.UploadService;
import com.aonproject.common.util.upload.vo.UploadVO;

@Controller
@RequestMapping(value = "admin")
public class UploadController {
	Logger logger = Logger.getLogger(UploadController.class);
	
	@Autowired
	private UploadService uploadService;
	
	/*이미지 리스트 구현*/
	@RequestMapping(value = "/imgUploadList", method=RequestMethod.GET)
	public String imgList(@ModelAttribute UploadVO uvo, Model model){
		logger.info("uploadList 호출 성공!");
		
		List<UploadVO> uploadList = uploadService.uploadList(uvo);
		
		model.addAttribute("uploadList", uploadList);
		
		return "admin/product/img";
	}
	
	/*이미지 업로드 구현*/
	@ResponseBody
	@RequestMapping(value = "/imgUploadInsert")
	public String imgInsert (@RequestBody UploadVO uvo){
		logger.info("uploadInsert 호출 성공!");
		
		int result = 0;
		result = uploadService.uploadInsert(uvo);
		
		return result+"";
	}
	
}