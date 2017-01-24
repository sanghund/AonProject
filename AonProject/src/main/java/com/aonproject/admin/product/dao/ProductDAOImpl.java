package com.aonproject.admin.product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aonproject.admin.product.controller.ProductController;
import com.aonproject.admin.product.vo.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO {
	
	Logger logger = Logger.getLogger(ProductController.class);
	
	@Autowired
	private SqlSession session;
	
	//상품 리스트 구현
	@Override
	public List<ProductVO> productList(ProductVO pvo) {
		return session.selectList("productList");
	}

	@Override
	public ProductVO productDetail(ProductVO pvo) {
		return (ProductVO)session.selectOne("productDetail", pvo);
	}

}
