package com.aonproject.admin.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aonproject.admin.product.dao.ProductDAO;
import com.aonproject.admin.product.vo.ProductVO;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDAO productDAO;
	
	/*상품 리스트 구현*/
	@Override
	public List<ProductVO> productList(ProductVO pvo) {
		List<ProductVO> productList = null;
		productList = productDAO.productList(pvo);
		return productList;
	}
	
	/*상품  디테일 구현*/
	@Override
	public ProductVO productDetail(ProductVO pvo) {
		ProductVO productDetail = null;
		productDetail = productDAO.productDetail(pvo);
		return productDetail;
	}
	
	/*상품 업데이트 구현*/
	@Override
	public int productUpdate(ProductVO pvo) {
		int result = 0; 
		result = productDAO.productUpdate(pvo);
		return result;
	}

}
