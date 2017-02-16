package com.aonproject.client.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aonproject.client.mInfo.vo.MemberVO;
import com.aonproject.client.order.dao.OrderDAO;
import com.aonproject.client.order.vo.Product_orderVO;
import com.aonproject.client.order.vo.CartVO;


@Service
@Transactional
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderDAO orderDAO;

	@Override
	public List<Product_orderVO> orderList(Product_orderVO povo) {
		List<Product_orderVO> orderList = orderDAO.orderList(povo); 
		return orderList;
	}
	
	public CartVO cartList(CartVO vo) {
		// TODO Auto-generated method stub
		return orderDAO.cartList(vo);
	}

	@Override
	public int orderInsert(Product_orderVO ovo) {
		int orderInsert = orderDAO.orderInsert(ovo);
		return orderInsert;
	}

	@Override
	public String checkOnum() {
		String checkOnum = orderDAO.checkOnum();
		return checkOnum;
	}

	@Override
	public List<Product_orderVO> myOrder(MemberVO vo) {
		// TODO Auto-generated method stub
		return orderDAO.myOrder(vo);
	}

	@Override
	public int myOrderCnt(MemberVO vo) {
		// TODO Auto-generated method stub
		return orderDAO.myOrderCnt(vo);
	}

	@Override
	public List<Product_orderVO> orderview(Product_orderVO povo) {
		// TODO Auto-generated method stub
		return orderDAO.orderview(povo);
	}

	@Override
	public int odrerRefundRequest(int o_num) {
		// TODO Auto-generated method stub
		return orderDAO.odrerRefundRequest(o_num);
	}

	@Override
	public List<Product_orderVO> adminOrderList(Product_orderVO povo) {
		// TODO Auto-generated method stub
		return orderDAO.adminOrderList(povo);
	}

	@Override
	public int adminOrderListCnt(Product_orderVO povo) {
		// TODO Auto-generated method stub
		return orderDAO.adminOrderListCnt(povo);
	}

	@Override
	public List<Product_orderVO> orderPaymentList(Product_orderVO povo) {
		// TODO Auto-generated method stub
		return orderDAO.orderPaymentList(povo);
	}

	@Override
	public List<Product_orderVO> orderRefundList(Product_orderVO povo) {
		// TODO Auto-generated method stub
		return orderDAO.orderRefundList(povo);
	}

	@Override
	public int orderPaymentListCnt(Product_orderVO povo) {
		// TODO Auto-generated method stub
		return orderDAO.orderPaymentListCnt(povo);
	}

	@Override
	public int orderRefundListCnt(Product_orderVO povo) {
		// TODO Auto-generated method stub
		return orderDAO.orderRefundListCnt(povo);
	}

	@Override
	public int orderPaymentListY(int o_num) {
		// TODO Auto-generated method stub
		return orderDAO.orderPaymentListY(o_num);
	}

	@Override
	public int orderRefundListF(int o_num) {
		// TODO Auto-generated method stub
		return orderDAO.orderRefundListF(o_num);
	}

}
