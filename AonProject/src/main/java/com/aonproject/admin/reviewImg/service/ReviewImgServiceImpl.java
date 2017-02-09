package com.aonproject.admin.reviewImg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aonproject.admin.reviewImg.dao.ReviewImgDAO;
import com.aonproject.admin.reviewImg.vo.ReviewImgVO;

@Service
@Transactional
public class ReviewImgServiceImpl implements ReviewImgService{

	@Autowired
	private ReviewImgDAO reviewImgDAO;
	
	@Override
	public List<ReviewImgVO> reviewImgList(ReviewImgVO revo) {
		List<ReviewImgVO> reviewImgList = null;
		reviewImgList = reviewImgDAO.reviewImgList(revo);
		return reviewImgList;
	}

	@Override
	public int reviewImgInsert(ReviewImgVO revo) {
		int result = 0;
		result = reviewImgDAO.reviewImgInsert(revo);
		return result;
	}

	@Override
	public int reviewImgUpdate(ReviewImgVO revo) {
		int result = 0;
		result = reviewImgDAO.reviewImgUpdate(revo);
		return result;
	}

	@Override
	public int reviewImgDelete(int re_no) {
		int result = 0;
		result = reviewImgDAO.reviewImgDelete(re_no);
		return result;
	}

	@Override
	public List<ReviewImgVO> reviewImgFilename(int re_no) {
		List<ReviewImgVO> reviewImgFilename = null;
		reviewImgFilename = reviewImgDAO.reviewImgFilename(re_no);
		return reviewImgFilename;
	}
	
}
