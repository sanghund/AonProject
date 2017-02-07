package com.aonproject.admin.reviewImg.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aonproject.admin.reviewImg.vo.ReviewImgVO;

@Repository
public class ReviewImgDAOImpl implements ReviewImgDAO{
	
	@Autowired
	private SqlSession session;

	@Override
	public List<ReviewImgVO> reviewImgList(ReviewImgVO revo) {
		return session.selectList("reviewImgList", revo);
	}

	@Override	
	public int reviewImgInsert(ReviewImgVO revo) {
		return session.insert("reviewImgInsert", revo);
	}

	@Override
	public int reviewImgUpdate(ReviewImgVO revo) {
		return session.update("reviewImgUpdate");
	}

	@Override
	public int reviewImgDelete(int re_no) {
		return session.delete("reviewImgDelete");
	}

	@Override
	public List<ReviewImgVO> reviewImgFilename(int re_no) {
		return session.selectList("reviewImgFilename", re_no);
	}

}
