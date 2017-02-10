package com.aonproject.client.order.dao;


import java.util.List;

import com.aonproject.client.mInfo.vo.MemberVO;
import com.aonproject.client.order.vo.CartVO;

import com.aonproject.client.order.vo.Product_orderVO;

public interface OrderDAO {
	public List<Product_orderVO> orderList(Product_orderVO povo);
	public CartVO cartList(CartVO vo);		
	public int orderInsert(Product_orderVO ovo);
	public String checkOnum();
	public List<Product_orderVO> myOrder(MemberVO vo);
	public int myOrderCnt(MemberVO vo);
}
