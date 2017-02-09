package com.aonproject.admin.qna.service;

import java.util.List;

import com.aonproject.admin.qna.vo.QnaVO;
import com.aonproject.client.mInfo.vo.MemberVO;

public interface QnaService {
	public List<QnaVO> qnaList(QnaVO qvo);
	public List<QnaVO> qnacommentList(QnaVO qvo);
	
	public int qnaDelete(int q_no);
	public int qnaQconfirm(int q_no);
	public int qnaUserInsert(QnaVO qvo);
	public int qnaConfirm(QnaVO qvo);
	public int qnaQname(QnaVO qvo);
	public int qnaPwdConfirm(QnaVO qvo);
	public List<QnaVO> myQnA(MemberVO vo);
}
