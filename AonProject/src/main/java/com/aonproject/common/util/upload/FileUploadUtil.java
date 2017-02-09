package com.aonproject.common.util.upload;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtil {
	static Logger logger = Logger.getLogger(FileUploadUtil.class);
	
	/*���� ���ε� �޼���*/
	public static String fileUpload(String fileOption, MultipartFile file, HttpServletRequest request) throws IOException{
		logger.info("fileUpload ȣ�⼺��");
		
		String real_name = null;
		String org_name = file.getOriginalFilename();
		logger.info("org_name= "+org_name);
		
		
		//���ϸ� ����
		if(org_name != null && (!org_name.equals(""))){
			//real_name = fileOption+"_"+System.currentTimeMillis()+"_"+org_name;
			/**********************************************************************
			 * ���ϸ� ��� ��Ģ - ����Ÿ��.����и���.���m���ϸ���Ȯ����(��:��ǰ�ڵ�_����и���.Ȯ����->TEST.14804650.jpg)
			 * ���� ����Ʈ�� ��½� '.'�� �����Ͽ� �ι��� �׸����� ��������
			 **********************************************************************/
			org_name = org_name.substring(org_name.lastIndexOf("."));
			real_name = fileOption+"."+System.currentTimeMillis()+org_name;
			String docRoot = request.getSession().getServletContext().getRealPath("/productUpload");
			File fileDir = new File(docRoot);
			if(!fileDir.exists()){
				fileDir.mkdirs();
			}
			File fileAdd = new File(docRoot+"/"+real_name);
			System.out.println(docRoot);
			logger.info("upload file= "+fileAdd);
			
			file.transferTo(fileAdd);
		}
		return real_name;
	}
	
	/*���� ���� �޼���*/
	public static void fileDelete(String fileName, HttpServletRequest request) throws IOException {
		logger.info("fileDelete ȣ�� ����");
		boolean result = false;
		String docRoot = request.getSession().getServletContext().getRealPath("/productUpload");
		
		File fileDelete = new File(docRoot+"/"+fileName);
		logger.info("delete file= "+fileDelete);
		
		if(fileDelete.exists() && fileDelete.isFile()){
			result = fileDelete.delete();
		}
		logger.info("��������(true/false): "+result);
	}
}
