package com.aonproject.admin.review;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtil {
	static Logger logger = Logger.getLogger(FileUploadUtil.class);
	
	/*파일 업로드 메서드*/
	public static String fileUpload(int fileOption, MultipartFile file, HttpServletRequest request)throws IOException{
		logger.info("fileUpload 호출 성공");
		
		String real_name = null;
		//MultipartFile 클래스의 getFilr() 메서드로 클라이언트가 업로드한 파일명
		String org_name = file.getOriginalFilename();
		logger.info("org_name : " + org_name );
		
		//파일명 변경(중복되지 않게)
		if(org_name != null && (!org_name.equals(""))){
			//real_name = "review_"+System.currentTimeMillis() + "_" + org_name; 
			//저장할 파일 이름
			//System.currentTimeMillis()은 밀리초까지 지정되어서 중복될 수 없다
			org_name = org_name.substring(org_name.lastIndexOf("."));
			real_name = fileOption+"."+System.currentTimeMillis()+org_name;
			String docRoot = request.getSession().getServletContext().getRealPath("/reviewUpload");
			//(/UploadStorage)라는 파일이 없다
			
			File fileDir = new File(docRoot);
			if(!fileDir.exists()){ //파일이 존재하는지 여부
				fileDir.mkdir();//파일생성
			}
			
			logger.info("업로드할 파일 경로(docRoot) : " + docRoot);
			File fileAdd = new File(docRoot + "/" + real_name); //파일 생성후
			logger.info(fileAdd);
			
			file.transferTo(fileAdd); //특정 파일 저장
		}
		return real_name;
	}
	
	/*파일 삭제 메서드*/
	public static void fileDelete(String fileName, HttpServletRequest request)throws IOException{
		logger.info("fileDelete 호출 성공");
		boolean result = false;
		String docRoot = request.getSession().getServletContext().getRealPath("/reviewUpload");
		
		File fileDelete = new File(docRoot + "/" + fileName );
		logger.info("삭제할 파일 경로(fileDelete) : " + fileDelete);
		if(fileDelete.exists() && fileDelete.isFile()){
			result = fileDelete.delete();
		}
		
		logger.info("삭제 여부(true/false) : " + result);
	}
}
