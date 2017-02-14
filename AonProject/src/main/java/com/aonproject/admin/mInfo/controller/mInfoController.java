package com.aonproject.admin.mInfo.controller;

import java.util.List;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.aonproject.admin.mInfo.vo.mInfoVO;
import com.aonproject.admin.notice.vo.NoticeVO;
import com.aonproject.admin.mInfo.service.mInfoService;
import com.aonproject.common.page.Paging;
 
@Controller
@RequestMapping(value="/admin")
public class mInfoController {
	Logger logger = Logger.getLogger(mInfoController.class);
	
	@Autowired
	private mInfoService mInfoService;
	
	// member list
	@RequestMapping(value="/mInfoList", method = RequestMethod.GET)
	public String mInfoList(@ModelAttribute mInfoVO mvo, Model model) {
		logger.info("mInfoList calling success");
		
		// 정렬에 대한 기본값 설정
		if(mvo.getOrder_by()==null) mvo.setOrder_by("m_no");
		if(mvo.getOrder_sc()==null) mvo.setOrder_by("DESC");
		
		//페이징 세팅
		Paging.setPage(mvo);
		
		List<mInfoVO> mInfoList = mInfoService.mInfoList(mvo);
		
		model.addAttribute("mInfoList", mInfoList);
		model.addAttribute("data", mvo);
		
		return "admin/mInfo/mInfoList";
	}
	
	// member detail
	@RequestMapping(value="/mDetailForm", method=RequestMethod.GET)
	public String mDetailForm(@ModelAttribute mInfoVO mvo, Model model){
		logger.info("mDetailForm calling success");
		logger.info("m_no = " + mvo.getM_no());
		
		mInfoVO mDetail = mInfoService.mDetailForm(mvo);
		
		model.addAttribute("mDetail", mDetail);
		String url = "admin/mInfo/mDetailForm";
		
		return url;
	}
	// member delete
	@RequestMapping(value="/mInfoDelete", method=RequestMethod.POST)
	public String mInfoDelete(@ModelAttribute mInfoVO mvo, Model model) {
		logger.info("mInfoDelete calling success");
		
		int result = 0;
		String url = "";
		
		logger.info("m_no="+ mvo.getM_no());
		
		result = mInfoService.mInfoDelete(mvo.getM_no());
		
		if(result == 1){
			url = "/admin/noticeList";
		}
		return "redirect:"+url;
	}

}
