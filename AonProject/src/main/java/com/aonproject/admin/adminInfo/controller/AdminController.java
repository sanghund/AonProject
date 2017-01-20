package com.aonproject.admin.adminInfo.controller;

import org.apache.log4j.Logger;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.aonproject.admin.adminInfo.vo.AdminVO;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	Logger logger = Logger.getLogger(AdminController.class);
	
	/*@Resource(name = "shaEncoder")
	private ShaEncoder encoder;*/
	
	
	@RequestMapping(value = "/login")
	public String loginForm(){
		logger.info("loginForm 호출 성공");
		return "admin/login/loginForm";
	}
	
	@RequestMapping(value = "/main")
	public ModelAndView main(Authentication auth){
		logger.info("main 호출 성공");
		ModelAndView mav = new ModelAndView();
		if(auth != null){
			UserDetails vo = (AdminVO) auth.getPrincipal();
			mav.addObject("vo", vo);
		}
		mav.setViewName("admin/main");
		return mav;
	}
}
