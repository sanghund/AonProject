package com.aonproject.admin.category.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aonproject.admin.category.controller.CategoryController;
import com.aonproject.admin.category.vo.CategoryVO;

@Repository
public class CategoryDAOImpl implements CategoryDAO {

	Logger logger = Logger.getLogger(CategoryController.class);
	
	@Autowired
	private SqlSession session;
	
	//카테고리 리스트 구현
	@Override
	public List<CategoryVO> categoryList(CategoryVO cvo) {
		return session.selectList("categoryList", cvo);
	}

	@Override
	public int categoryInsert(CategoryVO cvo) {
		return session.insert("categoryInsert",cvo);
	}

	@Override
	public int caUpdate(CategoryVO cavo) {
		return session.update("caUpdate");
	}

	@Override
	public int caDelete(CategoryVO cavo) {
		return session.update("caDelete");
	}

//	@Override
//	public CategoryVO categorySelect(CategoryVO cvo) {
//		return session.selectOne("categorySelect", cvo);
//	}
	

}
