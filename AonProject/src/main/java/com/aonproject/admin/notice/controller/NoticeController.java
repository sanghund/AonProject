package com.aonproject.admin.notice.controller;

import java.util.List;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aonproject.admin.aInfo.service.AdminService;
import com.aonproject.admin.aInfo.vo.AdminVO;
import com.aonproject.admin.notice.service.NoticeService;
import com.aonproject.admin.notice.vo.NoticeVO;
import com.aonproject.common.page.Paging;

@Controller
@RequestMapping(value="/admin")
public class NoticeController {
	Logger logger = Logger.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private AdminService adminService;
	
	/*=====================글목록 구현하기=========================*/
	@RequestMapping(value = "/noticeList", method = RequestMethod.GET)
	public String boardList(@ModelAttribute NoticeVO nvo, Model model){
		logger.info("noticeList 호출 성공");
		
		//정렬에 대한 기본값 설정
		if(nvo.getOrder_by()==null) nvo.setOrder_by("no_num");
		if(nvo.getOrder_sc()==null) nvo.setOrder_sc("DESC");
		
		//페이징 세팅
		Paging.setPage(nvo);
		
		//전체 레코드 수 구현
		int total = noticeService.noticeListCnt(nvo);
		logger.info("total = " + total);
		
		List<NoticeVO> noticeList = noticeService.noticeList(nvo);
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("total", total);
		model.addAttribute("data", nvo);
		
		return "admin/notice/noticeList";
	}
	
	/*==================글쓰기 폼 출력하기========================*/
	@RequestMapping(value="/notice/writeForm")
	public String writeForm(@ModelAttribute NoticeVO nvo){
		logger.info("writeFrom 호출 성공");
		
		return "admin/notice/writeForm";
	}
	
	/*===================글쓰기 구현하기==========================*/
	@RequestMapping(value="/noticeInsert", method=RequestMethod.POST)
	public String NoticeInsert(Authentication auth, @ModelAttribute NoticeVO nvo){
		logger.info("noticeInsert 호출 성공");
		AdminVO avo = (AdminVO)auth.getPrincipal();
		nvo.setA_no(avo.getA_no());
		logger.info("a_no="+nvo.getA_no());
		int result = 0;
		String url = "";
		
		result = noticeService.noticeInsert(nvo);
		System.out.println(result);
		if(result == 1){
			url = "/admin/noticeList";
		}
		
		return "redirect:"+url;
	}
	
	/*==================상세 정보 보기===========================*/
	@RequestMapping(value="/detailForm", method=RequestMethod.GET)
	public String selectForm(Authentication auth, @ModelAttribute AdminVO avo, @ModelAttribute NoticeVO nvo, Model model){
		logger.info("detailForm 호출 성공");
		logger.info("no_num = " + nvo.getNo_num());
		
		NoticeVO detail = noticeService.detailForm(nvo);
		
		AdminVO admin= (AdminVO)auth.getPrincipal();
		int a_no = admin.getA_no();
		
		avo.setA_no(a_no);
		admin = adminService.adminInfo(avo);
		
		
		logger.info("admin= "+admin);
		/*if(detail != null && (!detail.equals(""))){
			//내용 엔터 처리
			detail.setNo_content(detail.getNo_content().toString().replaceAll("\n", "<br />"));
		}*/
		
		model.addAttribute("adminInfo", admin);
		model.addAttribute("detail", detail);
		String url = "admin/notice/detailForm";
		
		return url;
	}
	
	/*==================수정 폼===========================
	@RequestMapping(value="/updateForm.do", method=RequestMethod.POST)
	public String updateForm(@ModelAttribute NoticeVO nvo, Model model){
		logger.info("updateForm 호출 성공");
		
		logger.info("no_num = " + nvo.getNo_num());
		
		NoticeVO updateData = new NoticeVO();
		updateData = noticeService.detailForm(nvo);
		
		model.addAttribute("updateData", updateData);
		return "/notice/updateForm";
	}*/
	
	/*==================수정하기===========================*/
	@RequestMapping(value="/noticeUpdate", method=RequestMethod.POST)
	public String noticeUpdate(@ModelAttribute NoticeVO nvo, Model model){
		logger.info("noticeUpdate 호출 성공");
		int result = 0;
		String url = "";
		
		logger.info("no_num="+nvo.getNo_num());
		
		result = noticeService.noticeUpdate(nvo);
		
		if(result == 1) {
			url = "/admin/noticeList";
		}
		return "redirect:"+url;
	}
	
	/*==================삭제하기===========================*/
	@RequestMapping(value="/noticeDelete", method=RequestMethod.POST)
	public String noticeDelete(@ModelAttribute NoticeVO nvo, Model model) {
		logger.info("noticeDelete 호출 성공");
		
		int result = 0;
		String url = "";
		
		logger.info("no_num="+nvo.getNo_num());
		
		result = noticeService.noticeDelete(nvo.getNo_num());
		
		if(result == 1){
			url = "/admin/noticeList";
		}
		return "redirect:"+url;
	}
}