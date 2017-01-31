package com.aonproject.admin.commoncode.dao;

import java.util.List;

import com.aonproject.admin.commoncode.vo.CommonCodeVO;

public interface CommonCodeDAO {
	//공통코드 관리
	public List<CommonCodeVO> commonCodeList(CommonCodeVO cvo);
}
