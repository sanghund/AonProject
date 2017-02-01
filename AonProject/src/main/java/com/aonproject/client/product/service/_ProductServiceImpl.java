package com.aonproject.client.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aonproject.admin.product.dao.ProductDAO;
import com.aonproject.admin.product.vo.ProductVO;

@Service
@Transactional
public class _ProductServiceImpl implements _ProductService {
	
	@Autowired
	private ProductDAO productDAO;
	
	/*상품 리스트 구현*/
	@Override
	public List<ProductVO> productList(ProductVO pvo) {
		List<ProductVO> productList = null;
		productList = productDAO.productList(pvo);
		return productList;
	}

}
