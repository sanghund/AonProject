package com.aonproject.admin.policy.dao;

import com.aonproject.admin.policy.vo.PolicyVO;

public interface PolicyDAO {
	public int newPolicy(PolicyVO vo);
	public PolicyVO policyView1();
	public PolicyVO policyView2();	
}
