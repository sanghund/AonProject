package com.aonproject.admin.mInfo.dao;

import java.util.List;
 

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aonproject.admin.mInfo.vo.mInfoVO;

@Repository
public class mInfoDAOImpl implements mInfoDAO {
	
	@Autowired
	private SqlSession session;
	
	// member list
	@Override
	public List<mInfoVO> mInfoList(mInfoVO mvo) {
		return session.selectList("mInfoList", mvo);
	}
	
	// member detail
	@Override
	public mInfoVO mDetailForm(mInfoVO mvo){
		// type change
		return (mInfoVO)session.selectOne("mDetailForm");
	}
	
	// member delete
	@Override
	public int mInfoDelete(int m_no) {
		return session.delete("mInfoDelete");
	}
}
