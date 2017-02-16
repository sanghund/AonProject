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

	@Override
	public int odrerRefundRequest(int o_num) {
		// TODO Auto-generated method stub
		return sqlSession.update("odrerRefundRequest", o_num);
	}

	@Override
	public List<Product_orderVO> adminOrderList(Product_orderVO povo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminOrderList", povo);
	}

	@Override
	public int adminOrderListCnt(Product_orderVO povo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminOrderListCnt", povo);
	}

	@Override
	public List<Product_orderVO> orderPaymentList(Product_orderVO povo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("orderPaymentList", povo);
	}

	@Override
	public List<Product_orderVO> orderRefundList(Product_orderVO povo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("orderRefundList", povo);
	}

	@Override
	public int orderPaymentListCnt(Product_orderVO povo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("orderPaymentListCnt", povo);
	}

	@Override
	public int orderRefundListCnt(Product_orderVO povo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("orderRefundListCnt", povo);
	}

	@Override
	public int orderPaymentListY(int o_num) {
		// TODO Auto-generated method stub
		return sqlSession.update("orderPaymentListY", o_num);
	}

	@Override
	public int orderRefundListF(int o_num) {
		// TODO Auto-generated method stub
		return sqlSession.update("orderRefundListF", o_num);
	}
}
