package com.aonproject.admin.commoncode.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aonproject.admin.category.controller.CategoryController;
import com.aonproject.admin.commoncode.vo.CommonCodeVO;

@Repository
public class CommonCodeDAOImpl implements CommonCodeDAO {
	
	Logger logger = Logger.getLogger(CategoryController.class);
	
	@Autowired
	private SqlSession session;
	
	// 怨듯넻 肄붾뱶 由ъ뒪�듃 援ы쁽
	@Override
	public List<CommonCodeVO> CommonCodeList(CommonCodeVO cvo) {
		return session.selectList("CommonCodeList", cvo);
	}
	
	// size, color, type 肄붾뱶 由ъ뒪�듃 援ы쁽
	@Override
	public List<CommonCodeVO> sCommonCodeList(CommonCodeVO cvo) {
		return session.selectList("sCommonCodeList", cvo);
	}
	@Override
	public List<CommonCodeVO> cCommonCodeList(CommonCodeVO cvo) {
		return session.selectList("cCommonCodeList", cvo);
	}
	@Override
	public List<CommonCodeVO> tCommonCodeList(CommonCodeVO cvo) {
		return session.selectList("tCommonCodeList", cvo);
	}
	
	// size 肄붾뱶 �벑濡� 援ы쁽
	@Override
	public int sCommonCodeInsert(CommonCodeVO cvo) {
		return session.insert("sCommonCodeInsert", cvo);
	}
	
	// color 肄붾뱶 �벑濡� 援ы쁽
	@Override
	public int cCommonCodeInsert(CommonCodeVO cvo) {
		return session.insert("cCommonCodeInsert", cvo);
	}
	
	// type 肄붾뱶 �벑濡� 援ы쁽
	@Override
	public int tCommonCodeInsert(CommonCodeVO cvo) {
		return session.insert("tCommonCodeInsert", cvo);
	}

}
