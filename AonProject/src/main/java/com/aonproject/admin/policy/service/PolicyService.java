package com.aonproject.admin.policy.service;

import com.aonproject.admin.policy.vo.PolicyVO;

public interface PolicyService {
	public int newPolicy(PolicyVO vo);
	public PolicyVO policyView1();
	public PolicyVO policyView2();
}
