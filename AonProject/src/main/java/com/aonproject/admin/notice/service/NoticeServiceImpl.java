package com.aonproject.admin.notice.service;

import java.util.List;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aonproject.admin.notice.dao.NoticeDAO;
import com.aonproject.admin.notice.vo.NoticeVO;

@Service
@Transactional
public class NoticeServiceImpl implements NoticeService {
	
Logger logger = Logger.getLogger(NoticeServiceImpl.class);
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	//글목록 구현
	@Override
	public List<NoticeVO> noticeList(NoticeVO nvo) {
		List<NoticeVO> myList = null;
		myList = noticeDAO.noticeList(nvo);
		return myList;
	}
	
	//전체 레코드 수 구현
	@Override
	public int noticeListCnt(NoticeVO nvo) {
		return noticeDAO.noticeListCnt(nvo);
	}
	
	//입력 구현
	@Override
	public int noticeInsert(NoticeVO nvo){
		int result = 0;
		result = noticeDAO.noticeInsert(nvo);
		System.out.println(result);
		return result;	
	}
	
	//글 상세 페이지 구현
	@Override
	public NoticeVO detailForm(NoticeVO nvo) {
		//detail선언
		NoticeVO detail = null;
		//vo값 얻어서 detail에 넘기기
		detail = noticeDAO.detailForm(nvo);
		return detail;
	}
	
	//글 수정 구현
	@Override
	public int noticeUpdate(NoticeVO nvo){
		int result = 0;
		result = noticeDAO.noticeUpdate(nvo);
		return result;
	}
		
	//글 삭제 구현
	@Override
	public int noticeDelete(int no_num){
		int result = 0;
		result = noticeDAO.noticeDelete(no_num);
			
		return result;
	}

}
