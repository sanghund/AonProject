package com.aonproject.client.about.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/client")
public class AboutController {
	
	@RequestMapping(value="/about")
	public String About(Model model){
		return "client/about/about";
	}
}
