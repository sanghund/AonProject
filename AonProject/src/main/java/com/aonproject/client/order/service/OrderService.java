package com.aonproject.client.order.service;


import java.util.List;

import com.aonproject.client.order.vo.Product_orderVO;
import com.aonproject.client.mInfo.vo.MemberVO;
import com.aonproject.client.order.vo.CartVO;


public interface OrderService {
	public List<Product_orderVO> orderList(Product_orderVO povo);
	public CartVO cartList(CartVO vo);
	public String checkOnum();
	public int orderInsert(Product_orderVO ovo);
	public List<Product_orderVO> myOrder(MemberVO vo);
	public int myOrderCnt(MemberVO vo);
	public List<Product_orderVO> orderview(Product_orderVO povo);
	
}
