package com.aonproject.common.util.excel;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.aonproject.common.util.vo.Numbers;
import com.aonproject.common.util.vo.PolicyAgrVO;


public class ExcelList extends AbstractExcelView {
	static Logger logger = Logger.getLogger(ExcelList.class);

	@Override
	protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String file_name = (String) model.get("file_name");
		response.setHeader("Content-Disposition", "attachment; fileName=\""+file_name+"_"+new SimpleDateFormat("yyyyMMdd").format(Calendar.getInstance().getTime())+".xlsx" + "\"");
		response.setContentType("application/x-msexcel; charset=utf-8");
		HSSFSheet worksheet = null;
		HSSFRow row = null;
		if(file_name.equals("약관 동의 목록")){
			@SuppressWarnings("unchecked")
			ArrayList<List<PolicyAgrVO>> list = (ArrayList<List<PolicyAgrVO>>) model.get("pagrList");
			@SuppressWarnings("unchecked")
			List<Numbers> nList = (List<Numbers>) model.get("nList");
			for(int i = 0; i < list.size(); i++){	
				List<PolicyAgrVO> eList = list.get(i);
				worksheet = workbook.createSheet(file_name + nList.get(i).getNo());
				row = worksheet.createRow(0);
				row.createCell(0).setCellValue("약관 번호");
				row.createCell(1).setCellValue("약관명");
				row.createCell(2).setCellValue("약관 등록일");
				row.createCell(3).setCellValue("관리자 번호");
				row.createCell(4).setCellValue("관리자 아이디");
				row.createCell(5).setCellValue("약관 동의여부");
				row.createCell(6).setCellValue("등록일");
			
				int j = 1;
				
				for(j = 1; j < eList.size() + 1; j++){
					if(eList.get(j-1).getA_no() == 0){
						break;
					}
					row = worksheet.createRow(j);
					row.createCell(0).setCellValue(eList.get(j-1).getPo_no());
					row.createCell(1).setCellValue(eList.get(j-1).getPo_name());
					row.createCell(2).setCellValue(eList.get(j-1).getPo_date());
					row.createCell(3).setCellValue(eList.get(j-1).getA_no());
					row.createCell(4).setCellValue(eList.get(j-1).getA_id());
					row.createCell(5).setCellValue(eList.get(j-1).getPa_confirm());
					row.createCell(6).setCellValue(eList.get(j-1).getPa_date());
				}
				
				int k = 1;
				if(j != (eList.size() + 1) ){
					row = worksheet.createRow(j + 1);
					row.createCell(0).setCellValue("약관 번호");
					row.createCell(1).setCellValue("약관명");
					row.createCell(2).setCellValue("약관 등록일");
					row.createCell(3).setCellValue("회원 번호");
					row.createCell(4).setCellValue("회원 아이디");
					row.createCell(5).setCellValue("약관 동의여부");
					row.createCell(6).setCellValue("등록일");
					
					
					for(k = j; k < eList.size() + 1; k++){
						row = worksheet.createRow(k + 2);
						row.createCell(0).setCellValue(eList.get(k-1).getPo_no());
						row.createCell(1).setCellValue(eList.get(k-1).getPo_name());
						row.createCell(2).setCellValue(eList.get(k-1).getPo_date());
						row.createCell(3).setCellValue(eList.get(k-1).getM_no());
						row.createCell(4).setCellValue(eList.get(k-1).getM_id());
						row.createCell(5).setCellValue(eList.get(k-1).getPa_confirm());
						row.createCell(6).setCellValue(eList.get(k-1).getPa_date());
					};
				}
				
			}
		}
	}
}
