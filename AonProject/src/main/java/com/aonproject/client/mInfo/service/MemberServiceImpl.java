package com.aonproject.client.mInfo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aonproject.client.mInfo.dao.MemberDAO;
import com.aonproject.client.mInfo.vo.MemberSubAddressVO;
import com.aonproject.client.mInfo.vo.MemberVO;
import com.aonproject.common.util.vo.Numbers;

@Service
@Transactional
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public int joinGo(MemberVO vo) {
		// TODO Auto-generated method stub
		return memberDAO.joinGo(vo);
	}

	@Override
	public int newNo() {
		// TODO Auto-generated method stub
		return memberDAO.newNo();
	}

	@Override
	public int addAddr(MemberVO vo) {
		// TODO Auto-generated method stub
		return memberDAO.addAddr(vo);
	}

	@Override
	public MemberVO memberInfo(MemberVO vo) {
		// TODO Auto-generated method stub
		return memberDAO.memberInfo(vo);
	}

	@Override
	public int memberExpire(MemberVO vo) {
		// TODO Auto-generated method stub
		return memberDAO.memberExpire(vo);
	}

	@Override
	public int memberGoodBye(MemberVO vo) {
		// TODO Auto-generated method stub
		return memberDAO.memberGoodBye(vo);
	}

	@Override
	public int memberAddrGoodBye(MemberVO vo) {
		// TODO Auto-generated method stub
		return memberDAO.memberAddrGoodBye(vo);
	}

	@Override
	public List<Numbers> numbers() {
		// TODO Auto-generated method stub
		return memberDAO.numbers();
	}

	@Override
	public int myInfoUpdate(MemberVO vo) {
		// TODO Auto-generated method stub
		return memberDAO.myInfoUpdate(vo);
	}

	@Override
	public int myAddrUpdate(MemberVO vo) {
		// TODO Auto-generated method stub
		return memberDAO.myAddrUpdate(vo);
	}

	@Override
	public List<MemberSubAddressVO> mSubAddrs(MemberVO vo) {
		// TODO Auto-generated method stub
		return memberDAO.mSubAddrs(vo);
	}

	@Override
	public int msaD(MemberSubAddressVO vo) {
		// TODO Auto-generated method stub
		return memberDAO.msaD(vo);
	}

	@Override
	public int lostIdChk(MemberVO vo) {
		// TODO Auto-generated method stub
		return memberDAO.lostIdChk(vo);
	}

	@Override
	public int lostPwdChk(MemberVO vo) {
		// TODO Auto-generated method stub
		return memberDAO.lostPwdChk(vo);
	}

	@Override
	public String sendId(MemberVO vo) {
		// TODO Auto-generated method stub
		return memberDAO.sendId(vo);
	}

	@Override
	public int sendPwd(MemberVO vo) {
		// TODO Auto-generated method stub
		return memberDAO.sendPwd(vo);
	}

	@Override
	public int emailChk(MemberVO vo) {
		// TODO Auto-generated method stub
		return memberDAO.emailChk(vo);
	}

	@Override
	public int emailChk2(MemberVO vo) {
		// TODO Auto-generated method stub
		return memberDAO.emailChk2(vo);
	}

	@Override
	public int idChk(MemberVO vo) {
		// TODO Auto-generated method stub
		return memberDAO.idChk(vo);
	}

	@Override
	public Map<String, Integer> memberSexDistribution() {
		// TODO Auto-generated method stub
		return memberDAO.memberSexDistribution();
	}

	@Override
	public Map<String, Integer> memberCount(MemberVO vo) {
		// TODO Auto-generated method stub
		return memberDAO.memberCount(vo);
	}

	@Override
	public MemberVO memberAddAddr(MemberVO vo) {
		// TODO Auto-generated method stub
		return memberDAO.memberAddAddr(vo);
	}


}
