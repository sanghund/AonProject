package com.aonproject.admin.aInfo.dao;

import com.aonproject.admin.aInfo.vo.AdminVO;

public interface AdminDAO {
	public int joinGo(AdminVO vo);
	public int overlapChk(AdminVO vo);
}
