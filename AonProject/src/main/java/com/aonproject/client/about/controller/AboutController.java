package com.aonproject.client.about.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aonproject.admin.category.service.CategoryService;
import com.aonproject.admin.category.vo.CategoryVO;

@Controller
@RequestMapping(value="/client")
public class AboutController {
	
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping(value="/about")
	public String About(@ModelAttribute CategoryVO cvo, Model model){
		List<CategoryVO> categoryList = categoryService.categoryList(cvo);
		
		model.addAttribute("categoryList", categoryList);
		return "client/about/about";
	}
}
