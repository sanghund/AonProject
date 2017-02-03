package com.aonproject.admin.policy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aonproject.admin.aInfo.vo.AdminVO;
import com.aonproject.admin.policy.dao.PolicyDAO;
import com.aonproject.admin.policy.vo.PolicyVO;

@Service
@Transactional
public class PolicyServiceImpl implements PolicyService{
	
	@Autowired
	private PolicyDAO policyDAO;
	
	@Override
	public int newPolicy(PolicyVO vo) {
		// TODO Auto-generated method stub
		return policyDAO.newPolicy(vo);
	}

	@Override
	public PolicyVO policyView1() {
		// TODO Auto-generated method stub
		return policyDAO.policyView1();
	}

	@Override
	public PolicyVO policyView2() {
		// TODO Auto-generated method stub
		return policyDAO.policyView2();
	}

	@Override
	public int pagr(AdminVO avo) {
		// TODO Auto-generated method stub
		return policyDAO.pagr(avo);
	}

	@Override
	public List<AdminVO> adminList(AdminVO avo) {
		// TODO Auto-generated method stub
		return policyDAO.adminList(avo);
	}

	@Override
	public int adminListCnt(AdminVO avo) {
		// TODO Auto-generated method stub
		return policyDAO.adminListCnt(avo);
	}

}
