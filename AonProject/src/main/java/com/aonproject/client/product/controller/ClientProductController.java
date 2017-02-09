package com.aonproject.client.product.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.aonproject.admin.category.service.CategoryService;
import com.aonproject.admin.category.vo.CategoryVO;
import com.aonproject.admin.commoncode.service.CommonCodeService;
import com.aonproject.admin.commoncode.vo.CommonCodeVO;
import com.aonproject.admin.product.service.ProductService;
import com.aonproject.admin.product.vo.ProductVO;
import com.aonproject.client.root.RootController;
import com.aonproject.common.util.upload.service.UploadService;
import com.aonproject.common.util.upload.vo.UploadVO;

@Controller
public class ClientProductController {
	Logger logger = Logger.getLogger(RootController.class);
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CommonCodeService commonCodeService;
	
	@Autowired
	private UploadService uploadService;
	
	//상품 리스트 출력
	@RequestMapping(value = "category")
	public String productList (@ModelAttribute CategoryVO cvo, ProductVO pvo, Model model, @RequestParam("no") int no){
		/*카테고리 리스트 출력*/
		List<CategoryVO> categoryList = categoryService.categoryList(cvo);
		model.addAttribute("categoryList", categoryList);
		
		logger.info(no);
		
		/*카테고리 선택 이름 출력*/
		cvo.setCa_no(no);
		List<CategoryVO> categorySelect = categoryService.categoryList(cvo);
		logger.info(cvo.getCa_name());
		model.addAttribute("categorySelect", categorySelect);
		
		/*상품리스트 선택 카테고리 번호 삽입*/
		pvo.setCa_no(no);
		
		/*상품 리스트 출력*/
		List<ProductVO> productForCategory = productService.productForCategory(pvo);
		model.addAttribute("productForCategory", productForCategory);
		
		return "client/product/productMain";
	}
	
	//상품 디테일 출력
	@RequestMapping(value = "detail")
	public String productDetail (@ModelAttribute CategoryVO cvo, @ModelAttribute ProductVO pvo, @ModelAttribute CommonCodeVO cmvo, @ModelAttribute UploadVO uvo, Model model, @RequestParam("no") String no){
		/*카테고리 리스트 출력*/
		List<CategoryVO> categoryList = categoryService.categoryList(cvo);
		model.addAttribute("categoryList", categoryList);
		
		List<CommonCodeVO> commonCodeList = commonCodeService.commonCodeList(cmvo);
		model.addAttribute("commonCodeList", commonCodeList);
		
		logger.info(no);
		
		pvo.setP_no(no);
		ProductVO productDetail = productService.productDetail(pvo);
		productDetail.setP_no(pvo.getP_no().substring(0,7));
		//logger.info("productDetail_pno:"+productDetail.getP_no());
		model.addAttribute("productDetail", productDetail);
		
		uvo.setP_no(no);
		List<UploadVO> uploadList = uploadService.uploadList(uvo);
		model.addAttribute("uploadList", uploadList);
		
		return "client/product/productDetail";
	}
}
