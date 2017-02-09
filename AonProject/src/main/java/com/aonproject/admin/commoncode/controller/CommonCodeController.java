package com.aonproject.admin.commoncode.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aonproject.admin.category.controller.CategoryController;
import com.aonproject.admin.commoncode.service.CommonCodeService;
import com.aonproject.admin.commoncode.vo.CommonCodeVO;

@Controller
@RequestMapping(value = "/admin")
public class CommonCodeController {
	Logger logger = Logger.getLogger(CategoryController.class);
	
	@Autowired
	private CommonCodeService commonCodeService; 
	
	// 怨듯넻 肄붾뱶 由ъ뒪�듃 援ы쁽
	@RequestMapping(value = "/commonCodeList", method=RequestMethod.GET)
	public String commonCodeList(@ModelAttribute CommonCodeVO cvo, Model model){
		logger.info("commonCode �샇異� �꽦怨�!");
		
		model.addAttribute("commonCodeList", commonCodeService.commonCodeList(cvo));
		return "admin/commonCode/detailForm";
	}
}
