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
	
	// 공통 코드 리스트 구현
	@Override
	public List<CommonCodeVO> commonCodeList(CommonCodeVO cvo) {
		return session.selectList("commonCodeList", cvo);
	}

}
