package com.aonproject.client.product.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aonproject.admin.category.service.CategoryService;
import com.aonproject.admin.category.vo.CategoryVO;

@Controller
public class ClientProductController {
	Logger logger = Logger.getLogger(ClientProductController.class);
	
//	@Autowired
//	private ClientProductService clientProductService;
	
	@Autowired
	private CategoryService categoryService;
	
	/*상품리스트 구현*/
	@RequestMapping(value = "/main", method=RequestMethod.GET)
	public String productList(@ModelAttribute CategoryVO cvo, Model model){
		logger.info("itemList 호출 성공!");
		
		List<CategoryVO> categoryList = categoryService.categoryList(cvo);
		model.addAttribute("categoryList", categoryList);
		
		
		return "product/productMain";
	}
			
}