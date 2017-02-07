package com.aonproject.admin.review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.aonproject.admin.recomment.service.RecommentService;
import com.aonproject.admin.recomment.vo.RecommentVO;
import com.aonproject.admin.review.FileUploadUtil;
import com.aonproject.admin.review.service.ReviewService;
import com.aonproject.admin.review.vo.ReviewVO;
import com.aonproject.admin.reviewImg.service.ReviewImgService;
import com.aonproject.admin.reviewImg.vo.ReviewImgVO;
import com.aonproject.common.util.paging.PagingSet;

@Controller
@RequestMapping(value="/admin/review")
public class ReviewController {
	Logger logger = Logger.getLogger(ReviewController.class);
	String mode = "";
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private ReviewImgService reviewImgService;
	
	@Autowired
	private RecommentService recommentService;
	
	//리스트 불러오기
	@RequestMapping(value="/reviewList", method=RequestMethod.GET)
	public String reviewList(@ModelAttribute ReviewVO rvo,@ModelAttribute ReviewImgVO revo, @ModelAttribute RecommentVO comvo, Model model){
		logger.info("reviewList호출 성공"); 
		
		int cnt = 0;
		cnt = reviewService.cntList();
		rvo.setCountList(2);
		PagingSet.setPageing(rvo, cnt);
		
		List<ReviewVO> reviewList = reviewService.reviewList(rvo);
		logger.info("reviewList="+reviewList);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("reviweVO",rvo);
		
		List<ReviewImgVO> reviewImgList = reviewImgService.reviewImgList(revo);
		logger.info("reviewImgList="+reviewImgList);
		model.addAttribute("reviewImgList",reviewImgList);
		
		List<RecommentVO> recommentList = recommentService.recommentList(comvo);
		logger.info("recommentList="+recommentList);
		model.addAttribute("recommentList",recommentList);
		
		
		return "admin/review/reviewList";
	}
	
		
	//리뷰 쓰기!!
	@ResponseBody
	@RequestMapping(value="/reviewInsert.do", method=RequestMethod.POST)
	public String reviewInsert(@ModelAttribute ReviewVO rvo, @ModelAttribute ReviewImgVO revo, HttpServletRequest request) throws IllegalAccessException, IOException{
		logger.info("reviewInsert호출 성공");
		mode = "insert";
		int result = 0;
		int reno = 0;
		reno = reviewService.selectReno();
		rvo.setRe_no(reno);//reno에 review테이블의 re_no가 담겨있다.
		int selectreno = rvo.getRe_no();
		logger.info("selectreno="+selectreno);
		
		result = reviewService.reviewInsert(rvo); //글이 서버에 등록되면 1이 된다.
		logger.info("result="+result);
		int temp = rvo.getRe_no(); //temp에 re_no값이 담겨있다.
		logger.info("temp="+temp);
		
		revo.setRe_no(temp);

		if(result == 1){//글이 입력이 되었을 때
			List<MultipartFile>	files = revo.getFiles();
			logger.info("files="+files);
				
			if(files != null && files.size() > 0){
				for(MultipartFile file : files){
					revo.setFile(file);
					int fileResult = imgInsert(revo, request);
					logger.info(fileResult);
				}
			}
		}else{
			logger.info(result);
		}
		
		String resultS = "success";
		
		return resultS;
	}
	/*상품 이미지 등록 수정*/
	public int imgInsert(ReviewImgVO revo, HttpServletRequest request)throws IOException{
		int fileResult = 0;
		
		String ri_file = FileUploadUtil.fileUpload(revo.getRe_no(), revo.getFile(), request);
		revo.setRi_file(ri_file);
		if(ri_file != null){
			if(mode == "insert"){
				fileResult = reviewImgService.reviewImgInsert(revo);
			}else if(mode == "update"){
				fileResult = reviewImgService.reviewImgInsert(revo);
			}
			if(fileResult == 1){
				logger.info("fileResult="+fileResult);
			}else{
				logger.info("fileResult="+fileResult);
			}
		}
		return fileResult;
	}
	
	
	
	//비밀번호 확인
	@RequestMapping(value="/reviewConfirm.do", method=RequestMethod.POST)
	public ResponseEntity<Integer> pwdConfirm(@ModelAttribute ReviewVO rvo){
		logger.info("pwdConfirm 호출 성공");
		ResponseEntity<Integer> entity = null;
		int result = 0;
		try{
			result = reviewService.pwdConfirm(rvo);
			if(result==1){
				entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
			}
			
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(result, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	//review내용 사용자가 update
	@ResponseBody
	@RequestMapping(value="/reviewUpdate.do", method=RequestMethod.POST)
	public String reviewUpdate(@ModelAttribute ReviewVO rvo,@ModelAttribute ReviewImgVO revo, HttpServletRequest request) throws IllegalStateException, IOException{
		mode = "update";
		logger.info("reviewUpdate호출 성공");
		int re_no = revo.getRe_no();
		
		int result = 0;
		result = reviewService.reviewUpdate(rvo);
		logger.info("result="+result);
		
		if(result == 1){
			List<MultipartFile> files = revo.getFiles();
			logger.info("files = "+files.size());
			
			String fileName = files.get(0).getOriginalFilename().toString();
			logger.info("fileName="+fileName);
			
			if(fileName != ""){
				FileUploadUtil.fileDelete(revo.getRi_file(), request);
				reviewImgService.reviewImgDelete(re_no);
				for(MultipartFile file : files){
					revo.setFile(file);
					int resultFile = imgInsert(revo, request);
					logger.info("resultFile="+resultFile);
				}
			}
		}else{
			logger.info(result);
		}
		
		String resultData =  "success";
		
		return resultData;
	}
	
	//review 내용 삭제하기
	@ResponseBody
	@RequestMapping(value="/{re_no}", method=RequestMethod.DELETE)
	public ResponseEntity<String> reviewDelete(@PathVariable("re_no") Integer re_no,@ModelAttribute ReviewImgVO revo,@ModelAttribute RecommentVO comvo, HttpServletRequest request, @ModelAttribute ReviewVO rvo) throws IOException{
		logger.info("reviewDelete호출 성공");
		ResponseEntity<String>	entity = null;
		try{
			List<ReviewImgVO> fileList = reviewImgService.reviewImgFilename(re_no);
			if(!fileList.isEmpty() ){
				for(ReviewImgVO vo: fileList){
					FileUploadUtil.fileDelete(vo.getRi_file(), request);
				}
			}
			recommentService.recommentDelete(re_no);
			reviewImgService.reviewImgDelete(re_no);
			reviewService.reviewDelete(re_no);
	
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
