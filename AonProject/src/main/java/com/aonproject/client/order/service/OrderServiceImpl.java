package com.aonproject.client.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
}
