package com.aonproject.admin.commoncode.dao;

import java.util.List;

import com.aonproject.admin.commoncode.vo.CommonCodeVO;

public interface CommonCodeDAO {
	// 공통 코드 리스트 구현
	public List<CommonCodeVO> commonCodeList(CommonCodeVO cvo);
}
