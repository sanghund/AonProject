package com.aonproject.admin.commoncode.dao;

import java.util.List;

import com.aonproject.admin.commoncode.vo.CommonCodeVO;

public interface CommonCodeDAO {
	// 공통 코드 리스트 구현
	public List<CommonCodeVO> CommonCodeList(CommonCodeVO cvo);
	// size, color, type 코드 리스트 구현
	public List<CommonCodeVO> sCommonCodeList(CommonCodeVO cvo);
	public List<CommonCodeVO> cCommonCodeList(CommonCodeVO cvo);
	public List<CommonCodeVO> tCommonCodeList(CommonCodeVO cvo);
	// size 코드 등록 구현
	public int sCommonCodeInsert(CommonCodeVO cvo);
	// color 코드 등록 구현
	public int cCommonCodeInsert(CommonCodeVO cvo);
	// type 코드 등록 구현
	public int tCommonCodeInsert(CommonCodeVO cvo);
}
