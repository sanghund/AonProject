package com.aonproject.client.order.dao;


import java.util.List;

import com.aonproject.client.order.vo.CartVO;

import com.aonproject.client.order.vo.Product_orderVO;

public interface OrderDAO {
	public List<Product_orderVO> orderList(Product_orderVO povo);
	public CartVO cartList(CartVO vo);	
}
