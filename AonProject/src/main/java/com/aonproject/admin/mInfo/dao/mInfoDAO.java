package com.aonproject.admin.mInfo.dao;

import java.util.List;
 
import com.aonproject.admin.mInfo.vo.mInfoVO;

public interface mInfoDAO {
	// member list
	public List<mInfoVO> mInfoList(mInfoVO mvo);
	// member detail
	public mInfoVO mDetailForm(mInfoVO mvo);
	// member delete
	public int mInfoDelete(int m_no);

}
