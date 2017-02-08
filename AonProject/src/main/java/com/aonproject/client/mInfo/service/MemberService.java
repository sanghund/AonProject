package com.aonproject.client.mInfo.service;

import java.util.List;

import com.aonproject.client.mInfo.vo.MemberVO;
import com.aonproject.common.util.vo.Numbers;

public interface MemberService {
	public int joinGo(MemberVO vo);
	public int newNo();
	public int addAddr(MemberVO vo);
	public MemberVO memberInfo(MemberVO vo);
	public int memberExpire(MemberVO vo);
	public int memberGoodBye(MemberVO vo);
	public int memberAddrGoodBye(MemberVO vo);
	public List<Numbers> numbers();
}
