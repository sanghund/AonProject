package com.aonproject.admin.mInfo.service;

import java.util.List;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aonproject.admin.mInfo.vo.mInfoVO;
import com.aonproject.admin.mInfo.dao.mInfoDAO;
 
@Service
@Transactional
public class mInfoServiceImpl implements mInfoService {
	Logger logger = Logger.getLogger(mInfoServiceImpl.class);
	
	@Autowired
	private mInfoDAO mInfoDAO;
	
	
	
	// member list
	@Override
	public List<mInfoVO> mInfoList(mInfoVO mvo) {
		List<mInfoVO> myList = null;
		myList = mInfoDAO.mInfoList(mvo);
		return myList;
	}
	
	// member detail
	@Override
	public mInfoVO mDetailForm(mInfoVO mvo) {
		// detail
		mInfoVO mDetail = null;
		//vo value -> detail
		mDetail = mInfoDAO.mDetailForm(mvo);
		return mDetail;
		}
	
	// user address
	@Override
	public int addAddr(mInfoVO mvo) {
		// TODO Auto-generated method stub
		return mInfoDAO.addAddr(mvo);
	}

	@Override
	public int memberExpire(mInfoVO mvo) {
		// TODO Auto-generated method stub
		return mInfoDAO.memberExpire(mvo);
	}

	@Override
	public int memberGoodBye(mInfoVO mvo) {
		// TODO Auto-generated method stub
		return mInfoDAO.memberGoodBye(mvo);
	}

	@Override
	public int memberAddrGoodBye(mInfoVO mvo) {
		// TODO Auto-generated method stub
		return mInfoDAO.memberAddrGoodBye(mvo);
	}

}
