package com.aonproject.admin.reviewImg.controller;

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

import com.aonproject.admin.reviewImg.service.ReviewImgService;
import com.aonproject.admin.reviewImg.vo.ReviewImgVO;

@Controller
@RequestMapping(value="/review")
public class ReviewImgController {
	Logger logger = Logger.getLogger(ReviewImgController.class);
	
	@Autowired
	private ReviewImgService reviewImgService;
	
	/*이미지 리스트 구현*/
	@RequestMapping(value = "/reviewImgList.do", method=RequestMethod.GET)
	public String imgList(@ModelAttribute ReviewImgVO revo, Model model){
		logger.info("uploadList 호출 성공!");
		
		List<ReviewImgVO> reviewImgList = reviewImgService.reviewImgList(revo);
		
		model.addAttribute("reviewImgList", reviewImgList);
		
		return "review/reviewList";
	}
	
	/*이미지 업로드 구현*/
	@ResponseBody
	@RequestMapping(value = "/reviewImgInsert.do")
	public String imgInsert (@RequestBody ReviewImgVO uvo){
		logger.info("reviewImgInsert 호출 성공!");
		
		int result = 0;
		result = reviewImgService.reviewImgInsert(uvo);
		
		return result+"";
	}
	
	
}
