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
	
	// user address
	@Override
	public int addAddr(mInfoVO mvo) {
		return session.insert("addAddr", mvo);
	}

	@Override
	public int memberExpire(mInfoVO mvo) {
		// TODO Auto-generated method stub
		return session.insert("memberExpire", mvo);
	}

	@Override
	public int memberGoodBye(mInfoVO mvo) {
		// TODO Auto-generated method stub
		return session.update("memberGoodBye", mvo);
	}

	@Override
	public int memberAddrGoodBye(mInfoVO mvo) {
		// TODO Auto-generated method stub
		return session.delete("memberAddrGoodBye", mvo);
	}
}
