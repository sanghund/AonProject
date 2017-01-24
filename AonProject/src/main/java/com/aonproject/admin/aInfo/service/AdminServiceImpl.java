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

}
