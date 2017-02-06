package com.aonproject.admin.aInfo.service;

import java.util.List;

import com.aonproject.admin.aInfo.vo.AdminVO;
import com.aonproject.common.util.vo.Numbers;

public interface AdminService {
	public int joinGo(AdminVO vo);
	public int overlapChk(AdminVO vo);
	public int myInfoUpdate(AdminVO vo);
	public AdminVO adminInfo(AdminVO vo);
	public int newNo();
	public List<Numbers> numbers();
}
