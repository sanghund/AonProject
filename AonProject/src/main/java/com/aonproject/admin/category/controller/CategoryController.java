package com.aonproject.admin.category.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aonproject.admin.category.service.CategoryService;
import com.aonproject.admin.category.vo.CategoryVO;

@Controller
@RequestMapping(value = "/admin")
public class CategoryController {
	Logger logger = Logger.getLogger(CategoryController.class);
	
	@Autowired
	private CategoryService categoryService;
	
	/*ī�װ��� ����Ʈ ����*/
	@RequestMapping(value = "/category", method=RequestMethod.GET)
	public String categoryList(@ModelAttribute CategoryVO cvo, Model model){
		logger.info("categoryList ȣ�� ����!");
		List<CategoryVO> categoryList = categoryService.categoryList(cvo);
		
		model.addAttribute("categoryList", categoryList);
		
		return "admin/category/main";
	}
	
	@ResponseBody
	@RequestMapping(value="/categoryInsert", method=RequestMethod.POST)
	public String categoryInsert(@ModelAttribute CategoryVO cvo, HttpServletRequest request){
		logger.info("categoryInsertȣ�� ����");
		
		int result = 0;
		String success = "";
		result = categoryService.categoryInsert(cvo);
		
		if(result == 1){
			success = "success";
		}
		return success;
	}
}