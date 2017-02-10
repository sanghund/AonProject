package com.aonproject.admin.stock.service;

import com.aonproject.admin.stock.vo.StockVO;
import com.aonproject.client.order.vo.CartVO;

public interface StockService {
	public int stockChk(CartVO vo);
	
	public int stockOrder(StockVO ovo);
}
