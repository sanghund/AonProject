package com.aonproject.client.root;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RootController {
	
	// 메인 페이지
	@RequestMapping(value = "/")
	public String root(){
		return "client/main";
	}
	
	// 로그인 페이지
	@RequestMapping(value = "/login")
	public String loginForm(){
		return "client/cInfo/loginForm";
	}
	
	// Member(회원) 가입 페이지 - 1단계
	@RequestMapping(value = "/join", method=RequestMethod.GET)
	public String joinForm(){
		return "client/cInfo/joinForm";
	};
}
