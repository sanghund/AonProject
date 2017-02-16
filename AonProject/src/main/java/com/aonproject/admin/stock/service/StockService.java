package com.aonproject.admin.stock.service;

import java.util.List;

import com.aonproject.admin.stock.vo.StockVO;
import com.aonproject.client.order.vo.CartVO;

public interface StockService {
	public int stockChk(CartVO vo);
	
	public int stockOrder(StockVO ovo);
	
	public List<StockVO> stockList(StockVO svo);
	
	public int stockUpdate(StockVO svo);
	
	public int stockInsert(StockVO svo);
	
	public int productCnt(StockVO svo);
}
