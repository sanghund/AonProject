package com.aonproject.client.mInfo.dao;

import com.aonproject.client.mInfo.vo.MemberVO;

public interface MemberDAO {
	public int joinGo(MemberVO vo);
	public int newNo();
	public int addAddr(MemberVO vo);
	public MemberVO memberInfo(MemberVO vo);
	public int memberExpire(MemberVO vo);
	public int memberGoodBye(MemberVO vo);
	public int memberAddrGoodBye(MemberVO vo);
}
