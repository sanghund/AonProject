package com.aonproject.admin.stock.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/admin")
public class StockController {
	private Logger logger = Logger.getLogger(StockController.class);
	
	@RequestMapping(value="/stockList")
	public ModelAndView stockList(){
		logger.info("stockList 호출 성공");
		ModelAndView mav = new ModelAndView();
		
		return mav;
	};
}
