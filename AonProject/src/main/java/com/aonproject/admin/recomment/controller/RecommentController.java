package com.aonproject.admin.recomment.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aonproject.admin.recomment.service.RecommentService;
import com.aonproject.admin.recomment.vo.RecommentVO;
import com.aonproject.admin.review.service.ReviewService;

@Controller
@RequestMapping(value="/admin/recomment")
public class RecommentController {
	Logger logger = Logger.getLogger(RecommentController.class);
	
	@Autowired
	private RecommentService recommentService;
	
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value="/recommentList", method=RequestMethod.GET)
	public String recommentList(@ModelAttribute RecommentVO comvo, Model model){
		logger.info("recommentList 호출 성공");
		
		List<RecommentVO> recommentList = recommentService.recommentList(comvo);
		
		model.addAttribute("recommentList",recommentList);
		
		return "review/reviewList";
	}
	
	@ResponseBody
	@RequestMapping(value="/recommentInsert", method=RequestMethod.POST)
	public String recommentInsert(@ModelAttribute RecommentVO comvo, HttpServletRequest request){
		logger.info("recommentInsert호출 성공");
		int result = 0;
		int re_no = 0;
		re_no = comvo.getRe_no();
		result = recommentService.recommentInsert(comvo);
		
		if(result == 1){
			reviewService.rechkUpdate(re_no);
			logger.info("recommentInsert 성공");
		}
		
		String ent = "success";
		
		return ent;
	}
	
	@ResponseBody
	@RequestMapping(value="/recommentUpdate", method=RequestMethod.POST)
	public String recommentUpdate(@ModelAttribute RecommentVO comvo, HttpServletRequest request){
		logger.info("recommentUpdate호출 성공");
		int result = 0;
		
		result = recommentService.recommentUpdate(comvo);
		
		if(result == 1){
			logger.info("recommentUpdate성공");
		}
		
		String ent = "success";
		
		return ent;
	}
}
