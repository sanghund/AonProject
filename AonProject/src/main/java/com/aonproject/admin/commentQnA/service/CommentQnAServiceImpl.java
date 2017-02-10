package com.aonproject.admin.commentQnA.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aonproject.admin.commentQnA.dao.CommentQnADAO;
import com.aonproject.admin.commentQnA.vo.CommentQnAVO;

@Service
@Transactional
public class CommentQnAServiceImpl implements CommentQnAService{
	
	@Autowired
	private CommentQnADAO commentQnADAO;

	@Override
	public List<CommentQnAVO> commentQnAList(CommentQnAVO cqvo) {
		List<CommentQnAVO> commentQnAList = null;
		commentQnAList = commentQnADAO.commentQnAList(cqvo);
		return commentQnAList;
	}

	@Override
	public int commentQnAInsert(CommentQnAVO cqvo) {
		int result = 0;
		result = commentQnADAO.commentQnAInsert(cqvo);
		return result;
	}

	@Override
	public int commentQnAUpdate(CommentQnAVO cqvo) {
		int result = 0;
		result = commentQnADAO.commentQnAUpdate(cqvo);
		return result;
	}

	@Override
	public int commentQnADelete(int q_no) {
		int result = 0;
		result = commentQnADAO.commentQnADelete(q_no);
		return result;
	}
	
	@Override
	public int cntList() {
		int result = 0;
		result = commentQnADAO.cntList();
		return result;
	}

}
