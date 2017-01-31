package com.aonproject.admin.product.dao;

import java.util.List;

import com.aonproject.admin.product.vo.ProductVO;

public interface ProductDAO {
	public List<ProductVO> productList(ProductVO pvo);
	public ProductVO productDetail(ProductVO pvo);
	public int productInsert(ProductVO pvo);
	public int productUpdate(ProductVO pvo);
	public int productDelete(ProductVO pvo);
}
