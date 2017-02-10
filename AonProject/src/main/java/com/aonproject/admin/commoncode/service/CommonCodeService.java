package com.aonproject.admin.commoncode.service;

import java.util.List;

import com.aonproject.admin.commoncode.vo.CommonCodeVO;

public interface CommonCodeService {
	// 怨듯넻 肄붾뱶 由ъ뒪�듃 援ы쁽
	public List<CommonCodeVO> CommonCodeList(CommonCodeVO cvo);
	// size, color, type 肄붾뱶 由ъ뒪�듃 援ы쁽
	public List<CommonCodeVO> sCommonCodeList(CommonCodeVO cvo);
	public List<CommonCodeVO> cCommonCodeList(CommonCodeVO cvo);
	public List<CommonCodeVO> tCommonCodeList(CommonCodeVO cvo);
	// size 肄붾뱶 �벑濡� 援ы쁽
	public int sCommonCodeInsert(CommonCodeVO cvo);
	// color 肄붾뱶 �벑濡� 援ы쁽
	public int cCommonCodeInsert(CommonCodeVO cvo);
	// type 肄붾뱶 �벑濡� 援ы쁽
	public int tCommonCodeInsert(CommonCodeVO cvo);
}