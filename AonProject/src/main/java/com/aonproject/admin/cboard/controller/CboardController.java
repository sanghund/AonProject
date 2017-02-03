package com.aonproject.admin.cboard.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/admin")
public class CboardController {
	Logger logger = Logger.getLogger(CboardController.class);
	
	@RequestMapping(value = "/cboard")
	public String process() {
		return "admin/cboard/cboard";
	}

}
