package com.aonproject.client.root;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aonproject.admin.category.service.CategoryService;
import com.aonproject.admin.category.vo.CategoryVO;
import com.aonproject.admin.imageUpload.service.ImageUploadService;

@Controller
public class RootController {
	Logger logger = Logger.getLogger(RootController.class);
	
	@Autowired
	private ImageUploadService imageUploadService;
	
	@Autowired
	private CategoryService categoryService;
	
	// ���� ������
	@RequestMapping(value = "/")
	public String root(@ModelAttribute CategoryVO cvo, Model model, Authentication auth){
		logger.info("root ȣ�� ����");
		
		List<CategoryVO> categoryList = categoryService.categoryList(cvo);
		model.addAttribute("categoryList", categoryList);
		
		List<String> main = (List<String>) imageUploadService.main();
		model.addAttribute("main", main);
		
		for(String test : main){
			System.out.println(test);
		}
		
		return "client/index";
	}
}
