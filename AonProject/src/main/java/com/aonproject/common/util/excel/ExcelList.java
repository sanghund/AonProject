package com.aonproject.common.util.excel;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import net.sf.jxls.transformer.XLSTransformer;

public class ExcelList extends AbstractExcelView {
	static Logger logger = Logger.getLogger(ExcelList.class);

	@Override
	protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook arg1, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		response.setHeader("Content-Disposition", "attachment; fileName=\""+model.get("file_name")+"_"+new SimpleDateFormat("yyyyMMdd").format(Calendar.getInstance().getTime())+".xlsx" + "\"");
		response.setContentType("application/x-msexcel; charset=utf-8");
		
		XLSTransformer trans = new XLSTransformer();
		String docRoot = request.getSession().getServletContext().getRealPath("/WEB-INF/excel/");
		logger.info("경로 체크(docRoot) : " + docRoot);
		InputStream is = new BufferedInputStream(new FileInputStream(docRoot+model.get("template")));
		Workbook workbook = trans.transformXLS(is, model);
		is.close();
		workbook.write(response.getOutputStream());
	}
	
	
}
