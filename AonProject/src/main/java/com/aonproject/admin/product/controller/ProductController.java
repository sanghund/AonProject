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
import com.aonproject.admin.stock.service.StockService;
import com.aonproject.admin.stock.vo.StockVO;
import com.aonproject.common.util.paging.PagingSet;
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
	public String itemList(@ModelAttribute ProductVO pvo, @ModelAttribute CategoryVO cvo, Model model, HttpServletRequest request){
		logger.info("itemList load");
		logger.info(pvo.getCa_no());
		
	
		/*product page set*/
		String productPageNum = request.getParameter("productPageNum");
		if(productPageNum != null){
			pvo.setPageNum(productPageNum);
		}
		
		/*product total count*/
		int productCnt = productService.productCnt(pvo);
		PagingSet.setPageing(pvo, productCnt);
		List<ProductVO> productList = productService.productList(pvo);
		model.addAttribute("productList", productList);
		model.addAttribute("productVO", pvo);
		
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
		
		List<CategoryVO> categoryList = categoryService.categoryList(cvo);
		model.addAttribute("categoryList", categoryList);
		
	    List<CommonCodeVO> CommonCodeList = commonCodeService.CommonCodeList(ovo);
		model.addAttribute("commonCodeList", CommonCodeList);
		
		List<UploadVO> uploadList = uploadService.uploadList(uvo);
		model.addAttribute("uploadList", uploadList);
		
		
		return "admin/product/detail";
	}
	
	
	/* product Detail Support */
	@ResponseBody
	@RequestMapping(value = "/productDetailSupport")
	public ProductVO detailInfo(@RequestBody ProductVO pvo, Model model){
		logger.info("productInsertSupport calling");
		ProductVO detailInfo = null;
		detailInfo = productService.productDetail(pvo);
		logger.info(detailInfo.getP_no());
		
		return detailInfo;
	}
	
	
	/*move writeForm*/
	@RequestMapping(value = "/writeForm")
	public String writeFrom (@ModelAttribute CategoryVO cvo, @ModelAttribute CommonCodeVO ovo, Model model){
		logger.info("writeFrom calling");

		
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
		logger.info("itemInsert calling");
		mode = "insert";
		int result = 0;
		String createP_no = "";
		
		
		StockVO svo = new StockVO();
		
		if(pvo.getP_no().length()==0){
			createP_no = productService.createP_no();
			pvo.setP_no(createP_no+pvo.getColor_code().toUpperCase()+pvo.getSize_code().toUpperCase());
		}else{
			pvo.setP_no(pvo.getP_no()+pvo.getColor_code()+pvo.getSize_code());
			logger.info(svo.getP_no());
		}
				
		result = productService.productInsert(pvo);
		
		uvo.setP_no(pvo.getP_no());
		if(result == 1){
			List<MultipartFile> files = uvo.getFiles();
			
			if(files != null && files.size()>0){
				for(MultipartFile file : files ){
					uvo.setFile(file);
					imgInsert(uvo, request);
				}
			}
			StockVO stock = new StockVO();
			stock.setP_no(uvo.getP_no());
			stockService.stockInsert(stock);
			logger.info("stock: "+stock.getP_no());
		}
		
		String url = "product";
		return "redirect:"+url;
	}
	
	/* product update */
	@RequestMapping(value = "/productUpdate")
	public String itemUpdate (@ModelAttribute ProductVO pvo, @ModelAttribute UploadVO uvo, HttpServletRequest request) throws IllegalStateException, IOException {
		mode = "update";
		logger.info("itemUpdate calling");
		
		String fileRoute = "productUpload";
		
		int result = 0;
		result = productService.productUpdate(pvo);
		
		if(result == 1){
			List<MultipartFile> files = uvo.getFiles();
			
			/* file is null check */
			String fileChk = files.get(0).getOriginalFilename().toString();
			
			if(fileChk != ""){
				FileUploadUtil.fileDelete(uvo.getPi_file(), fileRoute, request);
				uploadService.uploadDelete(uvo);
				for(MultipartFile file : files ){
					uvo.setFile(file);
					imgInsert(uvo, request);
				}
			}
		}
		
		String url = "productDetail?p_no="+pvo.getP_no();
		
		return "redirect:"+url;
	}
	
	/* image insert */
	public int imgInsert(UploadVO uvo, HttpServletRequest request) throws IOException {
		int fileResult = 0;
		
		String fileRoute = "productUpload";
		
		String pi_files = FileUploadUtil.fileUpload(uvo.getP_no(), fileRoute, uvo.getFile(), request);
		String pi_file[] = pi_files.split("@@@");
		
		logger.info(pi_file[0]);
		logger.info(pi_file[1]);
		
		uvo.setPi_route(pi_file[0]);
		uvo.setPi_file(pi_file[1]);
		if(pi_file != null){
			if(mode == "insert"){
				fileResult = uploadService.uploadInsert(uvo);
			}else if(mode == "update"){
				fileResult = uploadService.uploadInsert(uvo);
			}
		}
		return fileResult;
	}
	
	/* product delete */
	@RequestMapping(value = "/productDelete")
	public String itemDelete (@ModelAttribute ProductVO pvo) {
		mode = "update";
		
		productService.productDelete(pvo);
		
		String url = "product";
		return "redirect:"+url;
	}
	
	
	
			
}