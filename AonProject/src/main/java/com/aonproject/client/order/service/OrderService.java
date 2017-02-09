package com.aonproject.client.order.service;


import java.util.List;

import com.aonproject.client.order.vo.Product_orderVO;
import com.aonproject.client.order.vo.CartVO;


public interface OrderService {
	public List<Product_orderVO> orderList(Product_orderVO povo);
	public CartVO cartList(CartVO vo);
	
	public String checkOnum();
	public int orderInsert(Product_orderVO ovo);
}
