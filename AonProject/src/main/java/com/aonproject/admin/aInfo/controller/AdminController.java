package com.aonproject.admin.aInfo.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aonproject.admin.aInfo.service.AdminService;
import com.aonproject.admin.aInfo.vo.AdminVO;
import com.aonproject.common.util.security.ShaEncoder;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	Logger logger = Logger.getLogger(AdminController.class);
	
	@Resource(name = "shaEncoder")
	private ShaEncoder encoder;
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value = "/login")
	public String loginForm(){
		logger.info("loginForm 호출 성공");
		return "admin/aInfo/loginForm";
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
	
	@RequestMapping(value = "/joinForm")
	public String joinForm(){
		logger.info("joinForm 호출 성공");
		return "admin/aInfo/joinForm";
	}
	
	@ResponseBody
	@RequestMapping(value = "/joinGo")
	public String joinGo(@ModelAttribute AdminVO vo){
		logger.info("joinGo 호출 성공");
		
		vo.setA_pwd(encoder.encoding(vo.getA_pwd()));
	
		String result = "";
		
		int gogo = adminService.joinGo(vo);
		
		if (gogo == 1){
			result = "success";
		} 
		else{
			result = "fail";
		}
		return result;
	}
	
}
