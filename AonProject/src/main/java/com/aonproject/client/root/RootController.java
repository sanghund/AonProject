package com.aonproject.client.root;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RootController {
	
	// 메인 페이지
	@RequestMapping(value = "/")
	public String root(){
		return "client/main";
	}
	
}
