package com.aonproject.admin.stock.dao;

import com.aonproject.admin.stock.vo.StockVO;
import com.aonproject.client.order.vo.CartVO;

public interface StockDAO {
	public int stockChk(CartVO vo);
	public int stockOrder(StockVO ovo);
}
