package com.aonproject.client.mInfo.dao;

import com.aonproject.client.mInfo.vo.MemberVO;

public interface MemberDAO {
	public int joinGo(MemberVO vo);
	public int newNo();
}
