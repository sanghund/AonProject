package com.aonproject.admin.order;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aonproject.admin.aInfo.vo.AdminVO;
import com.aonproject.client.order.service.OrderService;
import com.aonproject.client.order.vo.Product_orderVO;
import com.aonproject.common.util.paging.PagingSet;

@Controller
@RequestMapping(value="/admin/order")
public class AdminOrderController {
	private Logger logger = Logger.getLogger(AdminOrderController.class);
	
	@Autowired 
	OrderService orderService;
	
	@RequestMapping(value="/orderList")
	public ModelAndView orderList(Authentication auth, @ModelAttribute Product_orderVO povo){
		logger.info("orderList 호출 성공");
		AdminVO vo = (AdminVO) auth.getPrincipal();
		povo.setCountList(20);
		povo.setCountPage(10);
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		int cnt = orderService.adminOrderListCnt(povo);
		PagingSet.setPageing(povo, cnt);
		mav.addObject("orderList", orderService.adminOrderList(povo));
		mav.addObject("adminVO", povo);
		mav.setViewName("admin/order/orderlist");
		return mav;
	};
	
	@RequestMapping(value="/orderPaymentList")
	public ModelAndView orderPaymentList(Authentication auth, @ModelAttribute Product_orderVO povo){
		logger.info("orderPaymentList 호출 성공");
		ModelAndView mav = new ModelAndView();
		AdminVO vo = (AdminVO) auth.getPrincipal();
		mav.addObject("vo", vo);
		povo.setCountList(20);
		povo.setCountPage(10);
		int cnt = orderService.orderPaymentListCnt(povo);
		PagingSet.setPageing(povo, cnt);
		mav.addObject("orderList", orderService.orderPaymentList(povo));
		mav.addObject("adminVO", povo);
		mav.setViewName("admin/order/orderPaymentList");
	
		return mav;
	}
	
	@RequestMapping(value="/orderRefundList")
	public ModelAndView orderRefundList(Authentication auth, @ModelAttribute Product_orderVO povo){
		logger.info("orderRefundList 호출 성공");
		ModelAndView mav = new ModelAndView();
		AdminVO vo = (AdminVO) auth.getPrincipal();
		mav.addObject("vo", vo);
		povo.setCountList(20);
		povo.setCountPage(10);
		int cnt = orderService.orderRefundListCnt(povo);
		PagingSet.setPageing(povo, cnt);
		mav.addObject("orderList", orderService.orderRefundList(povo));
		mav.addObject("adminVO", povo);
		mav.setViewName("admin/order/orderRefundList");
	
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/orderPaymentListY")
	public String orderPaymentListY(@RequestParam(value="o_num") int o_num){
		logger.info("orderPaymentListY 호출 성공");
		String result = "";
		int gogo = 0;
		gogo = orderService.orderPaymentListY(o_num);
		if(gogo > 0) result = "success";
		else result = "fail";

		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/orderRefundListF")
	public String orderRefundListF(@RequestParam(value="o_num") int o_num){
		logger.info("orderRefundListF 호출 성공");
		String result = "";
		int gogo = 0;
		gogo = orderService.orderRefundListF(o_num);
		if(gogo > 0) result = "success";
		else result = "fail";

		return result;
	}
}
