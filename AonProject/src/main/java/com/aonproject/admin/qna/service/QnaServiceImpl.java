package com.aonproject.admin.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aonproject.admin.qna.dao.QnaDAO;
import com.aonproject.admin.qna.vo.QnaVO;

@Service
@Transactional
public class QnaServiceImpl implements QnaService{

	@Autowired
	private QnaDAO qnaDAO;
	
	@Override
	public List<QnaVO> qnaList(QnaVO qvo) {
		List<QnaVO> result = null;
		result = qnaDAO.qnaList(qvo);
		return result;
	}

	@Override
	public int qnaDelete(int q_no) {
		int result = 0;
		result = qnaDAO.qnaDelete(q_no);
		return result;
	}

	@Override
	public int qnaQconfirm(int q_no) {
		int result = 0;
		result = qnaDAO.qnaQconfirm(q_no);
		return result;
	}

}
