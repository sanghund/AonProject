package com.aonproject.admin.category.service;

import java.util.List;

import com.aonproject.admin.category.vo.CategoryVO;

public interface CategoryService {
	public List<CategoryVO> categoryList(CategoryVO cvo);
	
//	public CategoryVO categorySelect(CategoryVO cvo);
	public int categoryInsert(CategoryVO cvo);
	public int caUpdate(CategoryVO cavo);
}
