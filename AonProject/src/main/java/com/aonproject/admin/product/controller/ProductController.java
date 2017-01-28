package com.aonproject.admin.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.aonproject.admin.category.service.CategoryService;
import com.aonproject.admin.category.vo.CategoryVO;
import com.aonproject.admin.commoncode.service.CommonCodeService;
import com.aonproject.admin.commoncode.vo.CommonCodeVO;
import com.aonproject.admin.product.service.ProductService;
import com.aonproject.admin.product.vo.ProductVO;
import com.aonproject.common.util.upload.FileUploadUtil;
import com.aonproject.common.util.upload.service.UploadService;
import com.aonproject.common.util.upload.vo.UploadVO;

@Controller
@RequestMapping(value = "/admin")
public class ProductController {
	Logger logger = Logger.getLogger(ProductController.class);
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private CommonCodeService commonCodeService;
	
	@Autowired
	private UploadService uploadService;
	
	/*상품리스트 구현*/
	@RequestMapping(value = "/product", method=RequestMethod.GET)
	public String itemList(@ModelAttribute ProductVO pvo, @ModelAttribute CategoryVO cvo, Model model){
		logger.info("itemList 호출 성공!");
		
		List<ProductVO> productList = productService.productList(pvo);
		model.addAttribute("productList", productList);
		
		return "admin/product/main";
	}
	
	/*상품상세 호출*/
	@RequestMapping(value = "/productDetail", method=RequestMethod.POST)
	public String itemDetail(@ModelAttribute ProductVO pvo, @ModelAttribute CategoryVO cvo, @ModelAttribute CommonCodeVO ovo, Model model){
		logger.info("itemDetail 호출 성공!");
		if(pvo.getP_no() == ""){
			logger.info("p_no: "+pvo.getP_no());
			model.addAttribute("mode", "insert");
		}else{
			ProductVO productDetail = productService.productDetail(pvo);		
			model.addAttribute("productDetail" , productDetail);
			model.addAttribute("mode", "update");
		}
		
		List<CategoryVO> categoryList = categoryService.categoryList(cvo);
		model.addAttribute("categoryList", categoryList);
		
		List<CommonCodeVO> commonCodeList = commonCodeService.commonCodeList(ovo);
		model.addAttribute("commonCodeList", commonCodeList);
		
		return "admin/product/detail";
	}
	
	/*상품 신규등록*/
	@ResponseBody
	@RequestMapping(value = "/productInsert", method=RequestMethod.POST)
	public String itemInsert (@RequestBody ProductVO pvo, @RequestBody UploadVO uvo, Model model, HttpServletRequest request) throws IllegalStateException, IOException {
		logger.info("itemInsert 호출 성공!");
		
		int result = 0;
		result = productService.productInsert(pvo);
		
		String[] imgFileArray = uvo.getPi_file().split("@");
		
		if(imgFileArray.length != 0){
			for(int i=0; i<imgFileArray.length; i++){
				String imgFile = FileUploadUtil.fileUpload(uvo.getFile(), request);
			}
			
			
			
			uvo.setP_no(pvo.getP_no());
			uvo.setPi_route(imgFileArray[0]);
			uvo.setPi_file(imgFileArray[1]);
			uploadService.uploadInsert(uvo);
		}
		
		model.addAttribute("mode", "update");
		
		return result+"";
	}
	
	/*상품 업데이트*/
	@ResponseBody
	@RequestMapping(value = "/productUpdate", method=RequestMethod.POST)
	public String itemUpdate (@RequestBody ProductVO pvo){
		logger.info("itemUpdate 호출 성공!");
		logger.info("pvo="+pvo.getP_no());
		
		int result = 0;
		result = productService.productUpdate(pvo);
		
		return result+"";
	}
	
	
			
}
