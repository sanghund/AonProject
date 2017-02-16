package com.aonproject.admin.mInfo.dao;

import java.util.List;

import com.aonproject.admin.mInfo.vo.mInfoVO;

public interface mInfoDAO { 
	// member list
	public List<mInfoVO> mInfoList(mInfoVO mvo);
	// member detail
	public mInfoVO mDetailForm(mInfoVO mvo);
	// user address
	public int addAddr(mInfoVO mvo);
	
	public int memberExpire(mInfoVO mvo);
	public int memberGoodBye(mInfoVO mvo);
	public int memberAddrGoodBye(mInfoVO mvo);

}
