package com.aonproject.admin.commoncode.controller;

import java.util.List;

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
	
	/*공통코드 리스트 구현*/
	@RequestMapping(value = "/commonCode", method=RequestMethod.GET)
	public String commonCodeList(@ModelAttribute CommonCodeVO cvo, Model model){
		logger.info("commonCode 호출 성공!");
		List<CommonCodeVO> commonCodeList = commonCodeService.commonCodeList(cvo);
		
		model.addAttribute("commonCodeList", commonCodeList);
		
		return "admin/commoncode/main";
	}
}
