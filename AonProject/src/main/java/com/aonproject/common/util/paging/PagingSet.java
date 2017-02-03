package com.aonproject.common.util.paging;

import com.aonproject.admin.aInfo.vo.AdminVO;
import com.aonproject.common.util.vo.CommonPagingVO;

public class PagingSet {
	public static void setPageing(CommonPagingVO vo, int cnt){
		int pageNum;
		vo.setTotalCount(cnt);
		
		if(vo.getCountList() == 0) vo.setCountList(1);
		if(vo.getCountPage() == 0) vo.setCountPage(1);
		
		vo.setTotalPage(vo.getTotalCount() / vo.getCountList());
		
		if(vo.getTotalCount() % vo.getCountList() != 0){
			int total = vo.getTotalCount();
			total++;
			vo.setTotalPage(total);
		}
		
		if(vo.getPageNum().equals("0") || vo.getPageNum() == null){
			vo.setPageNum("1");
			pageNum = Integer.parseInt(vo.getPageNum());
		}
		else{
			try{
				pageNum = Integer.parseInt(vo.getPageNum());
				if(pageNum < 1) pageNum = 1;
			}
			catch(NumberFormatException e){
				pageNum = 1;
			}
		}
		if(pageNum > vo.getTotalPage()){ // 현재 페이지 번호가 총 페이지에 번호보다 크다면, 마지막 페이지 번호로 지정
			pageNum = vo.getTotalPage();
		}
		
		if(vo.getTotalCount() != 0){
			int[] result = null; // 반환할 페이지 번호들
			
			int startPage = ((pageNum - 1) / vo.getCountPage()) * vo.getCountPage() + 1; // 보여줄 페이지 번호의 개수의 시작 번호
			int lastPage = startPage + vo.getCountPage() - 1; 
			
			if(lastPage > vo.getTotalPage()){ // 보여줄 페이지 번호의 개수의 마지막 번호가 총 페이지 개수보다 크면, 총 페이지 개수로 대입
				lastPage = vo.getTotalPage();
			}
			
			result = new int[lastPage - startPage + 1];
			int resultSize = result.length;
			for(int i = 0; i < resultSize; i++){ // 보여줄 페이지 번호들을 result에 대입
				result[i] = startPage + i;
			}
			
			vo.setPageTotal(result);
		}
		
		vo.setStart_data((pageNum -1) * vo.getCountList() + 1);
		vo.setEnd_data(pageNum * vo.getCountList());
	}
	
	public static void setPageing(AdminVO vo, int cnt){
		int pageNum;
		vo.setTotalCount(cnt);
		
		if(vo.getCountList() == 0) vo.setCountList(5);
		if(vo.getCountPage() == 0) vo.setCountPage(5);
		
		vo.setTotalPage(vo.getTotalCount() / vo.getCountList());
		
		if(vo.getTotalCount() % vo.getCountList() != 0){
			int total = vo.getTotalPage();
			total++;
			vo.setTotalPage(total);
		}
		
		if(vo.getPageNum().equals("0") || vo.getPageNum() == null){
			vo.setPageNum("1");
			pageNum = Integer.parseInt(vo.getPageNum());
		}
		else{
			try{
				pageNum = Integer.parseInt(vo.getPageNum());
				if(pageNum < 1) pageNum = 1;
			}
			catch(NumberFormatException e){
				pageNum = 1;
			}
		}
		if(pageNum > vo.getTotalPage()){ // 현재 페이지 번호가 총 페이지에 번호보다 크다면, 마지막 페이지 번호로 지정
			pageNum = vo.getTotalPage();
		}
		
		if(vo.getTotalCount() != 0){
			int[] result = null; // 반환할 페이지 번호들
			
			int startPage = ((pageNum - 1) / vo.getCountPage()) * vo.getCountPage() + 1; // 보여줄 페이지 번호의 개수의 시작 번호
			int lastPage = startPage + vo.getCountPage() - 1; 
			
			if(lastPage > vo.getTotalPage()){ // 보여줄 페이지 번호의 개수의 마지막 번호가 총 페이지 개수보다 크면, 총 페이지 개수로 대입
				lastPage = vo.getTotalPage();
			}
			
			result = new int[lastPage - startPage + 1];
			int resultSize = result.length;
			for(int i = 0; i < resultSize; i++){ // 보여줄 페이지 번호들을 result에 대입
				result[i] = startPage + i;
			}
			
			vo.setPageTotal(result);
		}
		
		vo.setStart_data((pageNum -1) * vo.getCountList() + 1);
		vo.setEnd_data(pageNum * vo.getCountList());
	}
}
