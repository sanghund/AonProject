package com.aonproject.client.notice.controller;

import java.util.List;



import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
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
@RequestMapping(value="/client")
public class ClientNoticeController {
	Logger logger = Logger.getLogger(ClientNoticeController.class);
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private AdminService adminService;
	
	/*=====================글목록 구현하기=========================*/
	@RequestMapping(value = "/noticeList", method = RequestMethod.GET)
	public String noticeList(@ModelAttribute NoticeVO nvo, Model model){
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
		
		return "client/notice/noticeList";
	}
	
	/*==================상세 정보 보기===========================*/
	@RequestMapping(value="/detailForm", method=RequestMethod.GET)
	public String detailForm(/*Authentication auth,*/ @ModelAttribute AdminVO avo, @ModelAttribute NoticeVO nvo, Model model){
		logger.info("detailForm 호출 성공");
		/*logger.info("no_num = " + nvo.getNo_num());*/
		
		NoticeVO detail = noticeService.detailForm(nvo);
		/*avo.setA_no(nvo.getA_no());*/
		logger.info(detail.getA_no());
		
		avo.setA_no(detail.getA_no());
		AdminVO admin = adminService.adminInfo(avo);
	    logger.info("a_id = " + admin.getA_id());
		/*AdminVO admin = (AdminVO)auth.getPrincipal();
		int a_no = admin.getA_no();
		avo.setA_no(a_no);
		admin = adminService.adminInfo(avo);
		
		
		logger.info("admin= "+admin);*/
		/*if(detail != null && (!detail.equals(""))){
			//내용 엔터 처리
			detail.setNo_content(detail.getNo_content().toString().replaceAll("\n", "<br />"));
		}*/
		
		model.addAttribute("adminInfo", admin);
		model.addAttribute("detail", detail);
		String url = "client/notice/detailForm";
		
		return url;
	}

}
