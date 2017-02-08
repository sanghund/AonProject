package com.aonproject.admin.commoncode.service;

import java.util.List;

import com.aonproject.admin.commoncode.vo.CommonCodeVO;

public interface CommonCodeService {
	// 공통 코드 리스트 구현
	public List<CommonCodeVO> commonCodeList(CommonCodeVO cvo);
}
