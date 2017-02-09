package com.aonproject.client.order.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aonproject.client.order.vo.CartVO;

@Repository
public class OrderDAOImpl implements OrderDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public CartVO cartList(CartVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("cartList", vo);
	}

}
