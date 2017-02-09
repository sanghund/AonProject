package com.aonproject.admin.commentQnA.service;

import java.util.List;

import com.aonproject.admin.commentQnA.vo.CommentQnAVO;

public interface CommentQnAService {
	public List<CommentQnAVO> commentQnAList(CommentQnAVO cqvo);
	public int commentQnAInsert(CommentQnAVO cqvo);
	public int commentQnAUpdate(CommentQnAVO cqvo);
	public int commentQnADelete(int q_no);
	public int cntList();
	
}
