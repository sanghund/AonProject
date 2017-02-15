package com.aonproject.client.product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import com.aonproject.common.util.paging.PagingSet;
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
	
	@RequestMapping(value = "category")
	public String productList (@ModelAttribute CategoryVO cvo, ProductVO pvo, Model model, @RequestParam("no") int no, HttpServletRequest request){
		List<CategoryVO> categoryList = categoryService.categoryList(cvo);
		model.addAttribute("categoryList", categoryList);
		
		/*product page set*/
		String productPageNum = request.getParameter("productPageNum");
		if(productPageNum != null){
			pvo.setPageNum(productPageNum);
		}
		
		/*product total count*/
		int productCnt = productService.productCnt(pvo);
		PagingSet.setPageing(pvo, productCnt);
		cvo.setCa_no(no);
		List<CategoryVO> categorySelect = categoryService.categoryList(cvo);
		
		pvo.setCa_no(no);
		
		List<ProductVO> productForCategory = productService.productForCategory(pvo);
		System.out.println(pvo.toString());
		logger.info("totalPage = "+pvo.getTotalPage());
		model.addAttribute("productForCategory", productForCategory);
		model.addAttribute("categorySelect", categorySelect);
		model.addAttribute("productVO", pvo);
		
		
		return "client/product/productMain";
	}
	
	@RequestMapping(value = "detail")
	public String productDetail (@ModelAttribute CategoryVO cvo, @ModelAttribute ProductVO pvo, @ModelAttribute CommonCodeVO cmvo, @ModelAttribute UploadVO uvo, Model model, @RequestParam("no") String no){
		List<CategoryVO> categoryList = categoryService.categoryList(cvo);
		model.addAttribute("categoryList", categoryList);
		
		List<CommonCodeVO> commonCodeList = commonCodeService.CommonCodeList(cmvo);
		model.addAttribute("commonCodeList", commonCodeList);
		
		logger.info(no);
		
		pvo.setP_no(no);
		ProductVO productDetail = productService.productDetail(pvo);
		//logger.info("productDetail_pno:"+productDetail.getP_no());
		uvo.setP_no(productDetail.getP_no());
		List<UploadVO> uploadList = uploadService.uploadList(uvo);
		model.addAttribute("uploadList", uploadList);
		
		List<ProductVO> productList = productService.productList(pvo);
		model.addAttribute("productList", productList);
		
		productDetail.setP_no(pvo.getP_no());
		model.addAttribute("productDetail", productDetail);
		
		return "client/product/productDetail";
	}
}
