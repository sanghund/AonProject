package com.aonproject.admin.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.aonproject.admin.category.service.CategoryService;
import com.aonproject.admin.category.vo.CategoryVO;
import com.aonproject.admin.commoncode.service.CommonCodeService;
import com.aonproject.admin.commoncode.vo.CommonCodeVO;
import com.aonproject.admin.product.service.ProductService;
import com.aonproject.admin.product.vo.ProductVO;
import com.aonproject.admin.stock.service.StockService;
import com.aonproject.admin.stock.vo.StockVO;
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
	
	@Autowired
	private StockService stockService;
	
	String mode = "";
	
	/*Product List*/
	@RequestMapping(value = "/product", method=RequestMethod.GET)
	public String itemList(@ModelAttribute ProductVO pvo, @ModelAttribute CategoryVO cvo, Model model){
		logger.info("itemList load");
		logger.info(pvo.getCa_no());
		
		List<ProductVO> productList = productService.productList(pvo);
		model.addAttribute("productList", productList);
		
		return "admin/product/main";
	}
	
	/*Product Detail*/
	@RequestMapping(value = "/productDetail")
	public String itemDetail(@ModelAttribute ProductVO pvo, @ModelAttribute CategoryVO cvo, @ModelAttribute CommonCodeVO ovo, @ModelAttribute UploadVO uvo, Model model){

		logger.info("itemDetail load");
		logger.info("p_no: "+pvo.getP_no());
		logger.info("cc_no: "+cvo.getCa_no());
		logger.info("cc_name: "+cvo.getCa_name());
		
		ProductVO productDetail = null;
		
		if(pvo.getP_no() == ""){
			model.addAttribute("mode", "insert");
		}else{
			productDetail = productService.productDetail(pvo);		
			model.addAttribute("productDetail" , productDetail);
			model.addAttribute("mode", "update");
		}
		//logger.info("pno"+productDetail.getP_no());
		
		List<CategoryVO> categoryList = categoryService.categoryList(cvo);
		model.addAttribute("categoryList", categoryList);
		
	    List<CommonCodeVO> CommonCodeList = commonCodeService.CommonCodeList(ovo);
		model.addAttribute("commonCodeList", CommonCodeList);
		
		List<UploadVO> uploadList = uploadService.uploadList(uvo);
		model.addAttribute("uploadList", uploadList);
		
		
		return "admin/product/detail";
	}
	
	/*move writeForm*/
	@RequestMapping(value = "/writeForm")
	public String writeFrom (@ModelAttribute CategoryVO cvo, @ModelAttribute CommonCodeVO ovo, Model model){
		logger.info("writeFrom 호출성공!");
		
		List<CategoryVO> categoryList = categoryService.categoryList(cvo);
		model.addAttribute("categoryList", categoryList);
		
		List<CommonCodeVO> commonCodeList = commonCodeService.CommonCodeList(ovo);
		model.addAttribute("commonCodeList", commonCodeList);
		
		ProductVO pvo = new ProductVO();
		List<ProductVO> productList = productService.productList(pvo);
		model.addAttribute("productList", productList);
		
		return "admin/product/write";
	}
	
	/*Product Insert*/
	@RequestMapping(value = "/productInsert")
	public String itemInsert (@ModelAttribute ProductVO pvo, @ModelAttribute UploadVO uvo, HttpServletRequest request) throws IllegalStateException, IOException {
		logger.info("itemInsert 호占쏙옙 占쏙옙占쏙옙!");
		mode = "insert";
		int result = 0;
		String createP_no = "";
		
		//占쏙옙품占쏙옙호(p_no) 占쏙옙占쏙옙
		logger.info("p_no1="+pvo.getP_no().length());
		
		StockVO svo = new StockVO();
		
		if(pvo.getP_no().length()==0){
			createP_no = productService.createP_no();
			pvo.setP_no(createP_no+pvo.getColor_code().toUpperCase()+pvo.getSize_code().toUpperCase());
			//svo.setP_no(createP_no+pvo.getColor_code().toUpperCase()+pvo.getSize_code().toUpperCase());
		}else{
			pvo.setP_no(pvo.getP_no()+pvo.getColor_code()+pvo.getSize_code());
			//svo.setP_no(pvo.getP_no()+pvo.getColor_code().toUpperCase()+pvo.getSize_code().toUpperCase());
			logger.info(svo.getP_no());
		}
				
		result = productService.productInsert(pvo);
		
		uvo.setP_no(pvo.getP_no());
		if(result == 1){
			//stockService.stockInsert(svo);
			
			List<MultipartFile> files = uvo.getFiles();
			
			if(files != null && files.size()>0){
				for(MultipartFile file : files ){
					uvo.setFile(file);
					/*int fileResult = */imgInsert(uvo, request);
				}
			}
		}else {
		}
		
		
		
		
		String url = "product";
		return "redirect:"+url;
	}
	
	/*占쏙옙품 占쏙옙占쏙옙占쏙옙트*/
	@RequestMapping(value = "/productUpdate")
	public String itemUpdate (@ModelAttribute ProductVO pvo, @ModelAttribute UploadVO uvo, HttpServletRequest request) throws IllegalStateException, IOException {
		mode = "update";
		logger.info("itemUpdate 호占쏙옙 占쏙옙占쏙옙!");
		
		int result = 0;
		result = productService.productUpdate(pvo);
		
		if(result == 1){
			List<MultipartFile> files = uvo.getFiles();
			
			/*占쏙옙占싹몌옙 확占쏙옙*/
			String fileChk = files.get(0).getOriginalFilename().toString();
			
			if(fileChk != ""){
				FileUploadUtil.fileDelete(uvo.getPi_file(), request);
				uploadService.uploadDelete(uvo);
				for(MultipartFile file : files ){
					uvo.setFile(file);
					/*int fileResult = */imgInsert(uvo, request);
					/*logger.info(fileResult);*/
				}
			}
		}else {
		}
		
		String url = "productDetail?p_no="+pvo.getP_no();
		
		return "redirect:"+url;
	}
	
	/*占쏙옙품占싱뱄옙占쏙옙 占쏙옙占�, 占쏙옙占쏙옙*/
	public int imgInsert(UploadVO uvo, HttpServletRequest request) throws IOException {
		int fileResult = 0;
		
		String pi_file = FileUploadUtil.fileUpload(uvo.getP_no(), uvo.getFile(), request);
		uvo.setPi_file(pi_file);
		if(pi_file != null){
			if(mode == "insert"){
				fileResult = uploadService.uploadInsert(uvo);
			}else if(mode == "update"){
				fileResult = uploadService.uploadInsert(uvo);
			}
			/*if(fileResult == 1){
				logger.info("fileResult="+fileResult);
			}else{
				logger.info("fileResult="+fileResult);
			}*/
		}
		return fileResult;
	}
	
	/*占쏙옙품 占쏙옙占쏙옙*/
	@RequestMapping(value = "/productDelete")
	public String itemDelete (@ModelAttribute ProductVO pvo) {
		mode = "update";
		/*int result = 0;*/
		/*result = */productService.productDelete(pvo);
		
		/*if(result == 1){
			logger.info("success = "+result);
		}else {
			logger.info("fail = "+result);
		}*/
		
		String url = "product";
		return "redirect:"+url;
	}
	
	
	
			
}