package com.aonproject.client.order.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aonproject.client.order.vo.Product_orderVO;
import com.aonproject.client.mInfo.vo.MemberVO;
import com.aonproject.client.order.vo.CartVO;

@Repository
public class OrderDAOImpl implements OrderDAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Product_orderVO> orderList(Product_orderVO povo) {
		return sqlSession.selectList("orderList", povo);
	}
	
	@Override
	public CartVO cartList(CartVO vo) {
		return sqlSession.selectOne("cartList", vo);
	}

	@Override
	public int orderInsert(Product_orderVO ovo) {
		return sqlSession.insert("orderInsert", ovo);
	}

	@Override
	public String checkOnum() {
		return sqlSession.selectOne("checkOnum");
	}

	@Override
	public List<Product_orderVO> myOrder(MemberVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("myOrder", vo);
	}

	@Override
	public int myOrderCnt(MemberVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("myOrder", vo);
	}

	@Override
	public List<Product_orderVO> orderview(Product_orderVO povo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("orderview", povo);
	}
}
