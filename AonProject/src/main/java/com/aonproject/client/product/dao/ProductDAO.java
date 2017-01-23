package com.aonproject.client.product.dao;

import java.util.List;

import com.aonproject.client.product.vo.ProductVO;

public interface ProductDAO {
	public List<ProductVO> productList(ProductVO pvo);
}
