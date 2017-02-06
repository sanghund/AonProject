package com.aonproject.client.mInfo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aonproject.client.mInfo.dao.MemberDAO;
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

}
