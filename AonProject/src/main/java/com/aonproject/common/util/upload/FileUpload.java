package com.aonproject.common.util.upload;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;

public class FileUpload {
	static Logger logger = Logger.getLogger(FileUpload.class);
	
	/*파일 업로드 메서드*/
	public static String fileUpload(MultipartFile file, HttpServletRequest request) throws IOException{
		logger.info("fileUpload 호출성공");
		
		String real_name = null;
		String org_name = file.getOriginalFilename();
		logger.info("org_name= "+org_name);
		
		//파일명 변경
		if(org_name != null && (!org_name.equals(""))){
			real_name = System.currentTimeMillis()+"_"+org_name; 
			
			String docRoot = request.getSession().getServletContext().getRealPath("/productUpload");
			File fileDir = new File(docRoot);
			if(!fileDir.exists()){
				fileDir.mkdirs();
			}
			File fileAdd = new File(docRoot+"/"+real_name);
			logger.info("upload file= "+fileAdd);
			
			file.transferTo(fileAdd);
		}
		return real_name;
	}
	
	/*파일 삭제 메서드*/
	public static void fileDelete(String fileName, HttpServletRequest request) throws IOException {
		logger.info("fileDelete 호출 성공");
		boolean result = false;
		String docRoot = request.getSession().getServletContext().getRealPath("/productUpload");
		
		File fileDelete = new File(docRoot+"/"+fileName);
		logger.info("delete file= "+fileDelete);
		
		if(fileDelete.exists() && fileDelete.isFile()){
			result = fileDelete.delete();
		}
		logger.info("삭제여부(true/false): "+result);
	}
}
