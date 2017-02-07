package com.aonproject.admin.commentQnA.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aonproject.admin.commentQnA.vo.CommentQnAVO;

@Repository
public class CommentQnADAOImpl implements CommentQnADAO{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<CommentQnAVO> commentQnAList(CommentQnAVO cqvo) {
		return session.selectList("commentQnAList", cqvo);
	}

	@Override
	public int commentQnAInsert(CommentQnAVO cqvo) {
		return session.insert("commentQnAInsert", cqvo);
	}

	@Override
	public int commentQnAUpdate(CommentQnAVO cqvo) {
		return session.update("commentQnAUpdate");
	}

	@Override
	public int commentQnADelete(int q_no) {
		return session.delete("commentQnADelete");
	}

}
