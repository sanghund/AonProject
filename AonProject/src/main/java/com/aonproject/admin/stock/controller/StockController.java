package com.aonproject.admin.stock.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aonproject.admin.aInfo.vo.AdminVO;
import com.aonproject.admin.stock.service.StockService;
import com.aonproject.admin.stock.vo.StockVO;
import com.aonproject.common.util.paging.PagingSet;

@Controller
@RequestMapping(value="/admin")
public class StockController {
	private Logger logger = Logger.getLogger(StockController.class);
	
	@Autowired
	private StockService stockService;
	
	//stock list
	@RequestMapping(value="/stockList")
	public String stockList(Authentication auth, @ModelAttribute StockVO svo, Model model, HttpServletRequest request){
		logger.info("stockList 호출 성공");
		
		UserDetails vo = (AdminVO) auth.getPrincipal();
		model.addAttribute("vo", vo);
		
		/*product page set*/
		String stockPageNum = request.getParameter("stockPageNum");
		if(stockPageNum != null){
			svo.setPageNum(stockPageNum);
		}
		
		/*product total count*/
		int productCnt = stockService.productCnt(svo);
		PagingSet.setPageing(svo, productCnt);
		
		List<StockVO> stockList = stockService.stockList(svo);
		model.addAttribute("stockList", stockList);
		model.addAttribute("stockVO", svo);
		
		return "admin/stock/main";
	};
	
	//stock update
	@RequestMapping(value="/stockUpdate")
	public ResponseEntity<String> stockUpdate (Authentication auth, @RequestBody StockVO svo, Model model){
		logger.info("stockUpdate");
		
		UserDetails vo = (AdminVO) auth.getPrincipal();
		model.addAttribute("vo", vo);
		
		ResponseEntity<String> entity = null;
		
		int stockUpdate = stockService.stockUpdate(svo);
		
		try{
			if(stockUpdate == 1){
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}
		}catch (Exception e){
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
