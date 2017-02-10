package com.aonproject.admin.stock.dao;

import java.util.List;

import com.aonproject.admin.stock.vo.StockVO;
import com.aonproject.client.order.vo.CartVO;

public interface StockDAO {
	public int stockChk(CartVO vo);
	public int stockOrder(StockVO ovo);
	
	public List<StockVO> stockList();
	
	public int stockUpdate(StockVO svo);
	
	public int stockInsert(StockVO svo);
}
