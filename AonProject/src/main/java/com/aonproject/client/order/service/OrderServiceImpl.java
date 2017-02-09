package com.aonproject.client.order.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aonproject.client.order.dao.OrderDAO;
import com.aonproject.client.order.vo.CartVO;


@Service
@Transactional
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderDAO orderDAO;

	@Override
	public CartVO cartList(CartVO vo) {
		// TODO Auto-generated method stub
		return orderDAO.cartList(vo);
	}
}
