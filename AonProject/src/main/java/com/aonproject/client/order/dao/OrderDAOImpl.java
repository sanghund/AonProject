package com.aonproject.client.order.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aonproject.client.order.vo.Product_orderVO;

@Repository
public class OrderDAOImpl implements OrderDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Product_orderVO> orderList(Product_orderVO povo) {
		return sqlSession.selectList("orderList", povo);
	}
}
