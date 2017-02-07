package com.aonproject.admin.recomment.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aonproject.admin.recomment.vo.RecommentVO;

@Repository
public class RecommentDAOImpl implements RecommentDAO {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<RecommentVO> recommentList(RecommentVO comvo) {
		return session.selectList("recommentList",comvo);
	}

	@Override
	public int recommentInsert(RecommentVO comvo) {
		return session.insert("recommentInsert",comvo);
	}

	@Override
	public int recommentUpdate(RecommentVO comvo) {
		return session.update("recommentUpdate");
	}
	
	@Override
	public int recommentDelete(int re_no){
		return session.delete("recommentDelete");
	}
	
}
