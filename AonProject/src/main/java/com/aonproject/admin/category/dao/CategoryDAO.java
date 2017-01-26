package com.aonproject.admin.category.dao;

import java.util.List;

import com.aonproject.admin.category.vo.CategoryVO;
import com.aonproject.admin.category.vo.CommonCodeVO;

public interface CategoryDAO {
	//墨抛绊府包府
	public List<CategoryVO> categoryList(CategoryVO cvo);
	
	
	//傍烹内靛 包府
	public List<CommonCodeVO> commonCodeList(CommonCodeVO cvo);
}
