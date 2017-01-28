package com.aonproject.admin.category.dao;

import java.util.List;

import com.aonproject.admin.category.vo.CategoryVO;
import com.aonproject.admin.commoncode.vo.CommonCodeVO;

public interface CategoryDAO {
	//카테고리관리
	public List<CategoryVO> categoryList(CategoryVO cvo);
	
}
