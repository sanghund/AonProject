package com.aonproject.client.order.service;

import java.util.List;

import com.aonproject.client.order.vo.Product_orderVO;

public interface OrderService {
	public List<Product_orderVO> orderList(Product_orderVO povo);
}
