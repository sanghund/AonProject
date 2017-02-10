package com.aonproject.admin.recomment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aonproject.admin.recomment.dao.RecommentDAO;
import com.aonproject.admin.recomment.vo.RecommentVO;

@Service
@Transactional
public class RecommentServiceImpl implements RecommentService{
    
	@Autowired
	private RecommentDAO recommentDAO;
	
	@Override
	public List<RecommentVO> recommentList(RecommentVO comvo) {
		List<RecommentVO> recommentList = null;
		recommentList = recommentDAO.recommentList(comvo);
		return recommentList;
	}

	@Override
	public int recommentInsert(RecommentVO comvo) {
		int result = 0;
		result = recommentDAO.recommentInsert(comvo);
		return result;
	}

	@Override
	public int recommentUpdate(RecommentVO comvo) {
		int result = 0;
		result = recommentDAO.recommentUpdate(comvo);
		return result;
	}

	@Override
	public int recommentDelete(int re_no) {
		int result = 0;
		result = recommentDAO.recommentDelete(re_no);
		return result;
	}
	
}
