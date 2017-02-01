package com.aonproject.common.util.upload;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtil {
	static Logger logger = Logger.getLogger(FileUploadUtil.class);
	
	/*파일 업로드 메서드*/
	public static String fileUpload(String fileOption, MultipartFile file, HttpServletRequest request) throws IOException{
		logger.info("fileUpload 호출성공");
		
		String real_name = null;
		String org_name = file.getOriginalFilename();
		logger.info("org_name= "+org_name);
		
		
		//파일명 변경
		if(org_name != null && (!org_name.equals(""))){
			//real_name = fileOption+"_"+System.currentTimeMillis()+"_"+org_name;
			/**********************************************************************
			 * 파일명 명명 규칙 - 파일타입.현재밀리초.원럐파일명의확장자(예:상품코드_현재밀리초.확장자->TEST.14804650.jpg)
			 * 파일 리스트에 출력시 '.'로 분할하여 두번쨰 항목으로 오름차순
			 **********************************************************************/
			org_name = org_name.substring(org_name.lastIndexOf("."));
			real_name = fileOption+"."+System.currentTimeMillis()+org_name;
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
