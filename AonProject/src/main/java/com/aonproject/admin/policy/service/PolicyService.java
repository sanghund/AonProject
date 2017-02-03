package com.aonproject.admin.policy.service;

import java.util.List;

import com.aonproject.admin.aInfo.vo.AdminVO;
import com.aonproject.admin.policy.vo.PolicyVO;

public interface PolicyService {
	public int newPolicy(PolicyVO vo);
	public PolicyVO policyView1();
	public PolicyVO policyView2();
	public int pagr(AdminVO avo);
	public List<AdminVO> adminList(AdminVO avo);
	public int adminListCnt(AdminVO avo);
}
