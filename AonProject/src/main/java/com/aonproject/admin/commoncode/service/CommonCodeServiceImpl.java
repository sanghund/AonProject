package com.aonproject.admin.commoncode.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aonproject.admin.commoncode.dao.CommonCodeDAO;
import com.aonproject.admin.commoncode.vo.CommonCodeVO;

@Service
@Transactional
public class CommonCodeServiceImpl implements CommonCodeService {
	
	@Autowired
	private CommonCodeDAO commonCodeDAO;
	
	// common code list
	@Override
	public List<CommonCodeVO> CommonCodeList(CommonCodeVO cvo) {
		List<CommonCodeVO> commonCodeList = null;
		commonCodeList = commonCodeDAO.CommonCodeList(cvo);
		return commonCodeList;
	}
	
	// size, color, type code list
	@Override
	public List<CommonCodeVO> sCommonCodeList(CommonCodeVO cvo) {
		List<CommonCodeVO> sCommonCodeList = null;
		sCommonCodeList = commonCodeDAO.sCommonCodeList(cvo);
		return sCommonCodeList;
	}
	@Override
	public List<CommonCodeVO> cCommonCodeList(CommonCodeVO cvo) {
		List<CommonCodeVO> cCommonCodeList = null;
		cCommonCodeList = commonCodeDAO.cCommonCodeList(cvo);
		return cCommonCodeList;
	}
	@Override
	public List<CommonCodeVO> tCommonCodeList(CommonCodeVO cvo) {
		List<CommonCodeVO> tCommonCodeList = null;
		tCommonCodeList = commonCodeDAO.tCommonCodeList(cvo);
		return tCommonCodeList;
	}
	
	// size code insert
	@Override
	public int sCommonCodeInsert(CommonCodeVO cvo) {
		int result = 0;
		result = commonCodeDAO.sCommonCodeInsert(cvo);
		System.out.println(result);
		return result;
	}
	
	// color code insert
	@Override
	public int cCommonCodeInsert(CommonCodeVO cvo) {
		int result = 0;
		result = commonCodeDAO.cCommonCodeInsert(cvo);
		System.out.println(result);
		return result;
	}
	
	// size code insert
	@Override
	public int tCommonCodeInsert(CommonCodeVO cvo) {
		int result = 0;
		result = commonCodeDAO.tCommonCodeInsert(cvo);
		System.out.println(result);
		return result;
	}
}
