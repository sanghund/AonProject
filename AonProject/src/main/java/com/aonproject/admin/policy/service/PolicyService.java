package com.aonproject.admin.policy.service;

import java.util.List;

import com.aonproject.admin.aInfo.vo.AdminVO;
import com.aonproject.admin.policy.vo.PolicyVO;
import com.aonproject.client.mInfo.vo.MemberVO;
import com.aonproject.common.util.vo.Numbers;
import com.aonproject.common.util.vo.PolicyAgrVO;

public interface PolicyService {
	public int newPolicy(PolicyVO vo);
	public PolicyVO policyView1();
	public PolicyVO policyView2();
	public int pagr(AdminVO avo);
	public int pagr2(PolicyAgrVO avo);
	public List<AdminVO> adminList(AdminVO avo);
	public int adminListCnt(AdminVO avo);
	public int memberListCnt(MemberVO mvo);
	public List<PolicyAgrVO> memberList(MemberVO mvo);
	public int policyAgrDenial(PolicyAgrVO vo);
	public List<Numbers> numbers();
	public List<PolicyAgrVO> excelList(PolicyVO vo);
	public int forLoop();
}
