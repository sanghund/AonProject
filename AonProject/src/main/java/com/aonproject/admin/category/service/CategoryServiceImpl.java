package com.aonproject.admin.category.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aonproject.admin.category.dao.CategoryDAO;
import com.aonproject.admin.category.vo.CategoryVO;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	/*카테고리 리스트 구현*/
	@Override
	public List<CategoryVO> categoryList(CategoryVO cvo) {
		List<CategoryVO> categoryList = null;
		categoryList = categoryDAO.categoryList(cvo);
		return categoryList;
	}

	@Override
	public int categoryInsert(CategoryVO cvo) {
		int result = 0;
		result = categoryDAO.categoryInsert(cvo);
		return result;
	}

	@Override
	public int caUpdate(CategoryVO cavo) {
		int result = 0;
		result = categoryDAO.caUpdate(cavo);
		return result;
	}

	@Override
	public int caDelete(CategoryVO cavo) {
		int result = 0;
		result = categoryDAO.caDelete(cavo);
		return result;
	}

//	@Override
//	public CategoryVO categorySelect(CategoryVO cvo) {
//		CategoryVO categorySelect = null;
//		categorySelect = categoryDAO.categorySelect(cvo);
//		return categorySelect;
//	}
	
	
}
