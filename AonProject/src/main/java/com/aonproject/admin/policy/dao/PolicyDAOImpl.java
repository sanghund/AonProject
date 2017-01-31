package com.aonproject.admin.policy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aonproject.admin.aInfo.vo.AdminVO;
import com.aonproject.admin.policy.vo.PolicyVO;

@Repository
public class PolicyDAOImpl implements PolicyDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int newPolicy(PolicyVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("newPolicy", vo);
	}

	@Override
	public PolicyVO policyView1() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("policyView1");
	}

	@Override
	public PolicyVO policyView2() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("policyView2");
	}

	@Override
	public int pagr(AdminVO avo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("pagr", avo);
	}

	@Override
	public List<AdminVO> adminList(AdminVO avo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminList", avo);
	}
}
