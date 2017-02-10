package com.aonproject.client.mInfo.dao;

import java.util.List;

import com.aonproject.client.mInfo.vo.MemberSubAddressVO;
import com.aonproject.client.mInfo.vo.MemberVO;
import com.aonproject.common.util.vo.Numbers;

public interface MemberDAO {
	public int joinGo(MemberVO vo);
	public int newNo();
	public int addAddr(MemberVO vo);
	public MemberVO memberInfo(MemberVO vo);
	public int memberExpire(MemberVO vo);
	public int memberGoodBye(MemberVO vo);
	public int memberAddrGoodBye(MemberVO vo);
	public List<Numbers> numbers();
	public int myInfoUpdate(MemberVO vo);
	public int myAddrUpdate(MemberVO vo);
	public List<MemberSubAddressVO> mSubAddrs(MemberVO vo);
	public int msaD(MemberSubAddressVO vo);
	public int lostIdChk(MemberVO vo);
	public int lostPwdChk(MemberVO vo);
	public String sendId(MemberVO vo);
	public int sendPwd(MemberVO vo);
	public int emailChk(MemberVO vo);
	public int emailChk2(MemberVO vo);
	public int idChk(MemberVO vo);
}
