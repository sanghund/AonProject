package com.aonproject.admin.aInfo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aonproject.admin.aInfo.dao.AdminDAO;
import com.aonproject.admin.aInfo.vo.AdminVO;

@Service
@Transactional
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDAO adminDAO;
	
	@Override
	public int joinGo(AdminVO vo) {
		// TODO Auto-generated method stub
		return adminDAO.joinGo(vo);
	}

	@Override
	public int overlapChk(AdminVO vo) {
		// TODO Auto-generated method stub
		return adminDAO.overlapChk(vo);
	}

	@Override
	public int myInfoUpdate(AdminVO vo) {
		// TODO Auto-generated method stub
		return adminDAO.myInfoUpdate(vo);
	}

	@Override
	public AdminVO adminInfo(AdminVO vo) {
		// TODO Auto-generated method stub
		return adminDAO.adminInfo(vo);
	}

}
