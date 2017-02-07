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
	
	String mode = "";
	
	/*상품리스트 구현*/
	@RequestMapping(value = "/product", method=RequestMethod.GET)
	public String itemList(@ModelAttribute ProductVO pvo, @ModelAttribute CategoryVO cvo, Model model){
		logger.info("itemList 호출 성공!");
		logger.info(pvo.getCa_no());
		
		List<ProductVO> productList = productService.productList(pvo);
		model.addAttribute("productList", productList);
		
		return "admin/product/main";
	}
	
	/*상품상세 호출*/
	@RequestMapping(value = "/productDetail")
	public String itemDetail(@ModelAttribute ProductVO pvo, @ModelAttribute CategoryVO cvo, @ModelAttribute CommonCodeVO ovo, @ModelAttribute UploadVO uvo, Model model){
		logger.info("itemDetail 호출 성공!");
		logger.info("p_no: "+pvo.getP_no());
		logger.info("cc_no: "+cvo.getCa_no());
		logger.info("cc_name: "+cvo.getCa_name());
		
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
		
		List<UploadVO> uploadList = uploadService.uploadList(uvo);
		model.addAttribute("uploadList", uploadList);
		
		
		return "admin/product/detail";
	}
	
	/*상품등록 페이지 이동*/
	@RequestMapping(value = "/writeForm")
	public String writeFrom (@ModelAttribute CategoryVO cvo, @ModelAttribute CommonCodeVO ovo, Model model){
		logger.info("writeFrom 호출 성공!");
		
		List<CategoryVO> categoryList = categoryService.categoryList(cvo);
		model.addAttribute("categoryList", categoryList);
		
		List<CommonCodeVO> commonCodeList = commonCodeService.commonCodeList(ovo);
		model.addAttribute("commonCodeList", commonCodeList);
		
		ProductVO pvo = new ProductVO();
		List<ProductVO> productList = productService.productList(pvo);
		model.addAttribute("productList", productList);
		
		return "admin/product/write";
	}
	
	/*상품 등록*/
	@RequestMapping(value = "/productInsert")
	public String itemInsert (@ModelAttribute ProductVO pvo, @ModelAttribute UploadVO uvo, HttpServletRequest request) throws IllegalStateException, IOException {
		logger.info("itemInsert 호출 성공!");
		mode = "insert";
		int result = 0;
		
		logger.info("p_no1="+pvo.getP_no().length());
		
		//상품번호(p_no) 생성
		if(pvo.getP_no().length()==0){
			String createP_no = productService.createP_no();
			
			pvo.setP_no(createP_no+pvo.getColor_code()+pvo.getSize_code());
			logger.info("p_no2="+pvo.getP_no());
		}else{
			//String fixedP_no = pvo.getP_no().substring(0, as)
			pvo.setP_no(pvo.getP_no()+pvo.getColor_code()+pvo.getSize_code());
		}
				
		logger.info((pvo.getP_no()+pvo.getColor_code()));
		result = productService.productInsert(pvo);
		
		uvo.setP_no(pvo.getP_no());
		logger.info(uvo.getP_no());
		if(result == 1){
			List<MultipartFile> files = uvo.getFiles();
			
			if(files != null && files.size()>0){
				for(MultipartFile file : files ){
					uvo.setFile(file);
					int fileResult = imgInsert(uvo, request);
					logger.info(fileResult);
				}
			}
		}else {
			logger.info(result);
		}
		
		String url = "product";
		return "redirect:"+url;
	}
	
	/*상품 업데이트*/
	@RequestMapping(value = "/productUpdate")
	public String itemUpdate (@ModelAttribute ProductVO pvo, @ModelAttribute UploadVO uvo, HttpServletRequest request) throws IllegalStateException, IOException {
		mode = "update";
		logger.info("itemUpdate 호출 성공!");
		logger.info("pvo="+pvo.getP_no());
		
		int result = 0;
		result = productService.productUpdate(pvo);
		
		if(result == 1){
			List<MultipartFile> files = uvo.getFiles();
			
			logger.info("filesSize="+files.size());
			/*파일명 확인*/
			logger.info("files="+files.get(0).getOriginalFilename().toString());
			
			String fileChk = files.get(0).getOriginalFilename().toString();
			
			if(fileChk != ""){
				FileUploadUtil.fileDelete(uvo.getPi_file(), request);
				uploadService.uploadDelete(uvo);
				for(MultipartFile file : files ){
					uvo.setFile(file);
					int fileResult = imgInsert(uvo, request);
					logger.info(fileResult);
				}
			}
		}else {
			logger.info(result);
		}
		
		String url = "productDetail?p_no="+pvo.getP_no();
		
		return "redirect:"+url;
	}
	
	/*상품이미지 등록, 수정*/
	public int imgInsert(UploadVO uvo, HttpServletRequest request) throws IOException {
		int fileResult = 0;
		
		logger.info(uvo.getFile());
		String pi_file = FileUploadUtil.fileUpload(uvo.getP_no(), uvo.getFile(), request);
		uvo.setPi_file(pi_file);
		if(pi_file != null){
			if(mode == "insert"){
				logger.info("mode="+mode);
				fileResult = uploadService.uploadInsert(uvo);
			}else if(mode == "update"){
				logger.info("mode="+mode);
				//fileResult = uploadService.uploadUpdate(uvo);
				fileResult = uploadService.uploadInsert(uvo);
			}
			if(fileResult == 1){
				logger.info("fileResult="+fileResult);
			}else{
				logger.info("fileResult="+fileResult);
			}
		}
		return fileResult;
	}
	
	/*상품 삭제*/
	@RequestMapping(value = "/productDelete")
	public String itemDelete (@ModelAttribute ProductVO pvo) {
		mode = "update";
		logger.info("itemDelete 호출 성공!");
		logger.info("p_no="+pvo.getP_no());
		logger.info("p_name="+pvo.getP_name());
		logger.info("p_del="+pvo.getP_del());
		
		int result = 0;
		result = productService.productDelete(pvo);
		
		if(result == 1){
			logger.info("success = "+result);
		}else {
			logger.info("fail = "+result);
		}
		
		String url = "product";
		return "redirect:"+url;
	}
	
	
	
			
}
