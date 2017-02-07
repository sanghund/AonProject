package com.aonproject.admin.qna.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aonproject.admin.qna.vo.QnaVO;

@Repository
public class QnaDAOImpl implements QnaDAO{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<QnaVO> qnaList(QnaVO qvo) {
		return session.selectList("qnaList", qvo);
	}

	@Override
	public int qnaDelete(int q_no) {
		return session.delete("qnaDelete");
	}

	@Override
	public int qnaQconfirm(int q_no) {
		return session.update("qnaQconfirm");
	}

}
