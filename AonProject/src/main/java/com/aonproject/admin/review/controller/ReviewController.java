package com.aonproject.admin.review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aonproject.admin.review.service.ReviewService;
import com.aonproject.admin.review.vo.ReviewVO;

@Controller
@RequestMapping(value="/review")
public class ReviewController {
	Logger logger = Logger.getLogger(ReviewController.class);
	
	@Autowired
	private ReviewService reviewService;
	
	//리스트 불러오기
	@RequestMapping(value="/reviewList", method=RequestMethod.GET)
	public String reviewList(@ModelAttribute ReviewVO rvo, Model model){
		logger.info("reviewList호출 성공");
		
		List<ReviewVO> reviewList = reviewService.reviewList(rvo);
		
		model.addAttribute("reviewList", reviewList);
		
		return "review/reviewList";
	}
	
		
	//리뷰 쓰기!!
	@RequestMapping(value="/reviewInsert", method=RequestMethod.POST)
	public String reviewInsert(@ModelAttribute ReviewVO rvo, HttpServletRequest request) throws IllegalAccessException, IOException{
		logger.info("reviewInsert호출 성공");
		
		int result = 0;
		String url = "";
		
		/*String r_file = FileUploadUtil.fileUpload(rvo.getFile(), request);
		rvo.setRe_file(r_file);*/
		
		result = reviewService.reviewInsert(rvo);
		if(result == 1){
			url = "/review/reviewList";	
		}
		return "redirect:"+url;
	}
	
	
	
	
	//비밀번호 확인
	@RequestMapping(value="/reviewConfirm", method=RequestMethod.POST)
	public ResponseEntity<Integer> pwdConfirm(@ModelAttribute ReviewVO rvo){
		logger.info("pwdConfirm 호출 성공");
		ResponseEntity<Integer> entity = null;
		int result = 0;
		try{
			result = reviewService.pwdConfirm(rvo);
			if(result==1){
				entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
			}
			
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(result, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	//review내용 사용자가 update
	@RequestMapping(value="/reviewUpdate", method=RequestMethod.POST)
	public String reviewUpdate(@ModelAttribute ReviewVO rvo, HttpServletRequest request) throws IllegalStateException, IOException{
		logger.info("updateForm 호출 성공");
		int result = 0;
		String url = "";
		/*String r_file = "";*/
		
		if(!rvo.getFile().isEmpty()){
			logger.info("re_file = "+rvo.getRe_file());
			/*FileUploadUtil.fileDelete(rvo.getRe_file(), request);
			r_file = FileUploadUtil.fileUpload(rvo.getFile(), request);
			rvo.setRe_file(r_file);*/
		}else{
			logger.info("첨부파일 없음");
			rvo.setRe_file("");
		}
		logger.info("re_file = "+rvo.getRe_file());
		result = reviewService.reviewUpdate(rvo);
		
		if(result ==1){
			url = "/review/reviewList";
		}
		return "redirect:"+url;
	}
	
	//review 내용 삭제하기
	@RequestMapping(value="/{re_no}", method=RequestMethod.DELETE)
	public ResponseEntity<String> reviewDelete(@PathVariable("re_no") Integer re_no, HttpServletRequest request, @ModelAttribute ReviewVO rvo) throws IOException{
		logger.info("reviewDelete호출 성공");
		ResponseEntity<String>	entity = null;
		try{
			reviewService.reviewDelete(re_no);
			/*FileUploadUtil.fileDelete(rvo.getRe_file(), request);*/
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
