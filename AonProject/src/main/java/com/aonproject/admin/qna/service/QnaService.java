package com.aonproject.admin.qna.service;

import java.util.List;

import com.aonproject.admin.qna.vo.QnaVO;

public interface QnaService {
	public List<QnaVO> qnaList(QnaVO qvo);
	
	public int qnaDelete(int q_no);
	public int qnaQconfirm(int q_no);
}
