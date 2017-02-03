package com.aonproject.admin.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aonproject.admin.notice.vo.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	@Autowired
	private SqlSession session;
	
	//글 목록 구현
	@Override
	public List<NoticeVO> noticeList(NoticeVO nvo){
		return session.selectList("noticeList", nvo);
	}
	
	//전체 레코드 수 구현
	@Override
	public int noticeListCnt(NoticeVO nvo) {
		return session.selectOne("noticeListCnt", nvo);
	}
	
	//입력 구현
	@Override
	public int noticeInsert(NoticeVO nvo){
	    return session.insert("noticeInsert", nvo);
	}
	
	//글 상세 페이지 구현
	@Override
	public NoticeVO detailForm(NoticeVO bvo){
		//형변환
		return (NoticeVO)session.selectOne("detailForm");
	}
	
	//수정 구현
	@Override
	public int noticeUpdate(NoticeVO nvo){
		return session.update("noticeUpdate");
	}
		
	//삭제 구현
	@Override
	public int noticeDelete(int no_num){
		return session.delete("noticeDelete");
	}

}
