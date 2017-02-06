package com.aonproject.client.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aonproject.client.order.dao.OrderDAO;
import com.aonproject.client.order.vo.Product_orderVO;

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
}
