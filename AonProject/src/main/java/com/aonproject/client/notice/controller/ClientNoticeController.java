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
import com.aonproject.admin.category.service.CategoryService;
import com.aonproject.admin.category.vo.CategoryVO;
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
	
	@Autowired
	private CategoryService categoryService;
	
	/*=====================湲�紐⑸줉 援ы쁽�븯湲�=========================*/
	@RequestMapping(value = "/noticeList", method = RequestMethod.GET)
	public String noticeList(@ModelAttribute NoticeVO nvo, Model model, @ModelAttribute CategoryVO cvo){
		logger.info("noticeList �샇異� �꽦怨�");
		
		//�젙�젹�뿉 ���븳 湲곕낯媛� �꽕�젙
		if(nvo.getOrder_by()==null) nvo.setOrder_by("no_num");
		if(nvo.getOrder_sc()==null) nvo.setOrder_sc("DESC");
		
		//�럹�씠吏� �꽭�똿
		Paging.setPage(nvo);
		
		//�쟾泥� �젅肄붾뱶 �닔 援ы쁽
		int total = noticeService.noticeListCnt(nvo);
		logger.info("total = " + total);
		
		List<NoticeVO> noticeList = noticeService.noticeList(nvo);
		
		List<CategoryVO> categoryList = categoryService.categoryList(cvo);
		model.addAttribute("categoryList", categoryList);
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("total", total);
		model.addAttribute("data", nvo);
		
		return "client/notice/noticeList";
	}
	
	/*==================�긽�꽭 �젙蹂� 蹂닿린===========================*/
	@RequestMapping(value="/detailForm", method=RequestMethod.GET)
	public String detailForm(/*Authentication auth,*/ @ModelAttribute AdminVO avo, @ModelAttribute NoticeVO nvo, Model model,@ModelAttribute CategoryVO cvo){
		logger.info("detailForm �샇異� �꽦怨�");
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
			//�궡�슜 �뿏�꽣 泥섎━
			detail.setNo_content(detail.getNo_content().toString().replaceAll("\n", "<br />"));
		}*/
	    
	    List<CategoryVO> categoryList = categoryService.categoryList(cvo);
		model.addAttribute("categoryList", categoryList);
		
		model.addAttribute("adminInfo", admin);
		model.addAttribute("detail", detail);
		String url = "client/notice/detailForm";
		
		return url;
	}

}
