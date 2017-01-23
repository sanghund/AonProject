package com.aonproject.client.product.service;

import java.util.List;

import com.aonproject.client.product.vo.ProductVO;

public interface ProductService {
	public List<ProductVO> productList(ProductVO pvo);
}
