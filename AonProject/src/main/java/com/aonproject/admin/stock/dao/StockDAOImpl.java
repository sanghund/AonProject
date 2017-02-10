package com.aonproject.admin.stock.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aonproject.admin.stock.vo.StockVO;
import com.aonproject.client.order.vo.CartVO;

@Repository
public class StockDAOImpl implements StockDAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int stockChk(CartVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("stockChk", vo);
	}

	@Override
	public int stockOrder(StockVO ovo) {
		return sqlSession.update("stockOrder", ovo);
	}

}
