package com.aonproject.client.product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.aonproject.client.product.vo.ProductVO;

public class ProductDAOImpl implements ProductDAO {
	
	Logger logger = Logger.getLogger(ProductDAOImpl.class);
	
	@Autowired
	private SqlSession session;
	
	//상품 리스트 구현
	@Override
	public List<ProductVO> productList(ProductVO pvo) {
		return session.selectList("productList");
	}

}
