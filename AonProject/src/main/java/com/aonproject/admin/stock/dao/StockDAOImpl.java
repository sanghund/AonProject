package com.aonproject.admin.stock.dao;

import java.util.List;

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
		return sqlSession.selectOne("stockChk", vo);
	}

	@Override
	public int stockOrder(StockVO ovo) {
		return sqlSession.update("stockOrder", ovo);
	}

	@Override
	public List<StockVO> stockList() {
		return sqlSession.selectList("stockList");
	}

	@Override
	public int stockUpdate(StockVO svo) {
		return sqlSession.update("stockUpdate", svo);
	}

	@Override
	public int stockInsert(StockVO svo) {
		return sqlSession.update("stockInsert", svo);
	}

}
