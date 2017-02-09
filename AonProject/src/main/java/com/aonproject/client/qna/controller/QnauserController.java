package com.aonproject.client.qna.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aonproject.admin.commentQnA.service.CommentQnAService;
import com.aonproject.admin.commentQnA.vo.CommentQnAVO;
import com.aonproject.admin.qna.service.QnaService;
import com.aonproject.admin.qna.vo.QnaVO;
import com.aonproject.client.mInfo.vo.MemberVO;
import com.aonproject.common.util.paging.PagingSet;

@Controller
@RequestMapping(value="/qna")
public class QnauserController {
	Logger logger = Logger.getLogger(QnauserController.class);
	String mode = "";
	
	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private CommentQnAService commentQnAService;
	
	//리스트 불러오기
	@RequestMapping(value="/qnauserList", method=RequestMethod.GET)
	public String qnaList(@ModelAttribute QnaVO qvo, @ModelAttribute CommentQnAVO cqvo,Model model){
		logger.info("qnaList호출 성공");
		
		int cnt = 0;
		/*cnt = qnaService.cntList();*/
		qvo.setCountList(5);
		PagingSet.setPageing(qvo, cnt);
		
		List<QnaVO> qnaList = qnaService.qnaList(qvo);
		logger.info("qnaList = " +qnaList);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("qnaVO", qvo);
		
		List<CommentQnAVO> commentQnAList = commentQnAService.commentQnAList(cqvo);
		logger.info("commentQnAList="+commentQnAList);
		model.addAttribute("commentQnAList",commentQnAList);
		
		return  "client/userqnaList";
	}
	
	//입력
	@ResponseBody
	@RequestMapping(value="/qnaUserInsert", method=RequestMethod.POST)
	public String qnaUserInsert(Authentication auth, @ModelAttribute QnaVO qvo, HttpServletRequest request){
		logger.info("qnaUserInsert호출 성공");
		MemberVO mvo = (MemberVO)auth.getPrincipal();
		qvo.setM_no(mvo.getM_no());
		
		int result = 0;
		int success=0;
		result = qnaService.qnaUserInsert(qvo);
		if(result ==1){
			success = qnaService.qnaConfirm(qvo);
			if(success == 1){
				qnaService.qnaQname(qvo);
			}
			logger.info("qnaUserInsert성공");
		}
		String end = "success";
		
		return end;
	}
	
	@RequestMapping(value="/qnaPwdConfirm", method=RequestMethod.POST)
	public ResponseEntity<Integer> qnaPwdConfirm(@ModelAttribute QnaVO qvo){
		logger.info("qnaConfirm호출 확인");
		int result = 0;
		ResponseEntity<Integer> entity = null;
		
		try{
			result = qnaService.qnaPwdConfirm(qvo);
			if(result == 1){
				entity = new ResponseEntity<>(result, HttpStatus.OK);
			}
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(result, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
