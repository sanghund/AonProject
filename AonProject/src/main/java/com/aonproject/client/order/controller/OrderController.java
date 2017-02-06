package com.aonproject.client.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.aonproject.client.order.service.OrderService;

@Controller
@RequestMapping(value="/order")
public class OrderController{
	private Logger logger = Logger.getLogger(OrderController.class);
	
	@Autowired
	private OrderService orderService;
	
	// 장바구니
	@RequestMapping(value= "/cart")
	public ModelAndView cart(HttpServletRequest request, HttpServletResponse response){
		logger.info("cart 호출 성공");
		ModelAndView mav = new ModelAndView();
		
		
		
		return mav;
	}
}
