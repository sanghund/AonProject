package com.aonproject.client.order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.aonproject.admin.category.service.CategoryService;
import com.aonproject.admin.category.vo.CategoryVO;
import com.aonproject.admin.commoncode.service.CommonCodeService;
import com.aonproject.admin.commoncode.vo.CommonCodeVO;
import com.aonproject.admin.product.service.ProductService;
import com.aonproject.admin.product.vo.ProductVO;
import com.aonproject.client.order.service.OrderService;
import com.aonproject.client.order.vo.Product_orderVO;

@Controller
@RequestMapping(value="/order")
public class OrderController{
	private Logger logger = Logger.getLogger(OrderController.class);
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private CommonCodeService commonCodeService;
	
	@Autowired
	private ProductService productService;
	
	//주문
	@RequestMapping(value= "/order")
	public String order(@ModelAttribute Product_orderVO povo, @ModelAttribute CategoryVO cvo, @ModelAttribute CommonCodeVO cmvo, @ModelAttribute ProductVO pvo, HttpServletRequest request, Model model){
		logger.info("order 호출 성공");
		
		/*카테고리 리스트 출력*/
		List<CategoryVO> categoryList = categoryService.categoryList(cvo);
		model.addAttribute("categoryList", categoryList);
		
		List<CommonCodeVO> commonCodeList = commonCodeService.commonCodeList(cmvo);
		model.addAttribute("commonCodeList", commonCodeList);
		
		ProductVO productDetail = productService.productDetail(pvo);
		model.addAttribute("productDetail", productDetail);
		
		//List<Product_orderVO> orderList = orderService.orderList(povo);
		
		
		return "client/order/order";
	}
	
	
	// 장바구니
	@RequestMapping(value= "/cart")
	public ModelAndView cart(HttpServletRequest request, HttpServletResponse response){
		logger.info("cart 호출 성공");
		ModelAndView mav = new ModelAndView();
		
		
		
		return mav;
	}
}
