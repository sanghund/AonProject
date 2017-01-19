package com.aonproject.admin.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aonproject.common.security.ShaEncoder;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	Logger logger = Logger.getLogger(AdminController.class);
	
	@Resource(name = "shaEncoder")
	private ShaEncoder encoder;
	
	@RequestMapping(value = "/login")
	public String login(){
		logger.info("login 호출 성공");
		return "admin/login";
	}
}
