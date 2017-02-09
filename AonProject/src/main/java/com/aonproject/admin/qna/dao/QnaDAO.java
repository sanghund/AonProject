package com.aonproject.admin.qna.dao;

import java.util.List;

import com.aonproject.admin.qna.vo.QnaVO;

public interface QnaDAO {
	List<QnaVO> qnaList(QnaVO qvo);
	List<QnaVO> qnacommentList(QnaVO qvo);
	public int qnaDelete(int q_no);
	public int qnaQconfirm(int q_no);
	public int qnaUserInsert(QnaVO qvo);
	public int qnaConfirm(QnaVO qvo);
	public int qnaQname(QnaVO qvo);
	public int qnaPwdConfirm(QnaVO qvo);
}
