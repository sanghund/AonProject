package com.aonproject.admin.aInfo.service;

import com.aonproject.admin.aInfo.vo.AdminVO;

public interface AdminService {
	public int joinGo(AdminVO vo);
	public int overlapChk(AdminVO vo);
	public int myInfoUpdate(AdminVO vo);
	public AdminVO adminInfo(AdminVO vo);
}
