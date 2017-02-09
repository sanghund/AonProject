package com.aonproject.admin.stock.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aonproject.admin.stock.service.StockService;
import com.aonproject.admin.stock.vo.StockVO;

@Controller
@RequestMapping(value="/admin")
public class StockController {
	private Logger logger = Logger.getLogger(StockController.class);
	
	@Autowired
	private StockService stockService;
	
	
	@RequestMapping(value="/stockList")
	public String stockList(@ModelAttribute StockVO svo, Model model){
		logger.info("stockList 호출 성공");

		List<StockVO> stockList = stockService.stockList();
		model.addAttribute("stockList", stockList);
		
		return "admin/stock/main";
	};
	
	
}
