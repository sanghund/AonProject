package com.aonproject.admin.stock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aonproject.admin.stock.dao.StockDAO;
import com.aonproject.admin.stock.vo.StockVO;
import com.aonproject.client.order.vo.CartVO;

@Service
@Transactional
public class StockServiceImpl implements StockService{

	@Autowired
	private StockDAO stockDAO;
	
	@Override
	public int stockChk(CartVO vo) {
		// TODO Auto-generated method stub
		return stockDAO.stockChk(vo);
	}

	@Override
	public int stockOrder(StockVO ovo) {
		return stockDAO.stockOrder(ovo);
	}

	@Override
	public List<StockVO> stockList(StockVO svo) {
		return stockDAO.stockList(svo);
	}

	@Override
	public int stockUpdate(StockVO svo) {
		return stockDAO.stockUpdate(svo);
	}

	@Override
	public int stockInsert(StockVO svo) {
		return stockDAO.stockInsert(svo);
	}

	@Override
	public int productCnt(StockVO svo) {
		return stockDAO.productCnt(svo);
	}

}
