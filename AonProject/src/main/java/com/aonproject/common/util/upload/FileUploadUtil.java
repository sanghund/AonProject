package com.aonproject.common.util.upload;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtil {
	static Logger logger = Logger.getLogger(FileUploadUtil.class);
	
	public static String fileUpload(String fileOption, String fileRoute, MultipartFile file, HttpServletRequest request) throws IOException{
		logger.info("fileUpload calling");
		
		String real_name = null;
		String org_name = file.getOriginalFilename();
		String docRoot = "";
		String dummyRoot = "";
		
		if(org_name != null && (!org_name.equals(""))){
			
			org_name = org_name.substring(org_name.lastIndexOf("."));
			real_name = fileOption+"."+System.currentTimeMillis()+org_name;
			dummyRoot = request.getSession().getServletContext().getRealPath("/"+fileRoute);
			docRoot = fileRoute;
			File fileDir = new File(docRoot);
			if(!fileDir.exists()){
				fileDir.mkdirs();
			}
			File fileAdd = new File(docRoot+"/"+real_name);
			System.out.println(docRoot);
			logger.info(dummyRoot);
			logger.info("upload file= "+fileAdd);
			
			file.transferTo(fileAdd);
		}
		return docRoot+"@@@"+real_name;
	}
	
	public static void fileDelete(String fileName, HttpServletRequest request) throws IOException {
		logger.info("fileDelete calling");
		boolean result = false;
		String docRoot = request.getSession().getServletContext().getRealPath("/productUpload");
		
		File fileDelete = new File(docRoot+"/"+fileName);
		logger.info("delete file= "+fileDelete);
		
		if(fileDelete.exists() && fileDelete.isFile()){
			result = fileDelete.delete();
		}
		logger.info("fileDelete(true/false): "+result);
	}
}
