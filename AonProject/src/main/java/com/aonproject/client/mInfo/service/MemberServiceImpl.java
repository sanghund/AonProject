package com.aonproject.client.mInfo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aonproject.client.mInfo.dao.MemberDAO;
import com.aonproject.client.mInfo.vo.MemberVO;

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

}
