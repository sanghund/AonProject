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
	
	// memeber delete
	@Override
	public int mInfoDelete(int m_no) {
		int result = 0;
		result = mInfoDAO.mInfoDelete(m_no);
		
		return result;
	}

}
