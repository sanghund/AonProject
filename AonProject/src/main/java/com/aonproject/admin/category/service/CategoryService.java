package com.aonproject.admin.category.service;

import java.util.List;

import com.aonproject.admin.category.vo.CategoryVO;
import com.aonproject.admin.category.vo.CommonCodeVO;

public interface CategoryService {
	public List<CategoryVO> categoryList(CategoryVO cvo);
	public List<CommonCodeVO> commonCodeList(CommonCodeVO cvo);
}
