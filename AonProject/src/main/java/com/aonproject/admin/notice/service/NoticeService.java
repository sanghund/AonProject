package com.aonproject.admin.notice.service;

import java.util.List;

import com.aonproject.admin.notice.vo.NoticeVO;

public interface NoticeService {
	
	public List<NoticeVO> noticeList(NoticeVO nvo);
	public int noticeListCnt(NoticeVO nvo);
	public int noticeInsert(NoticeVO nvo);
	public NoticeVO detailForm(NoticeVO nvo);
	public int noticeUpdate(NoticeVO nvo);
	public int noticeDelete(int no_num);

}
