package com.aonproject.admin.review.service;

import java.util.List;

import com.aonproject.admin.review.vo.ReviewVO;


public interface ReviewService {
	public List<ReviewVO> reviewList(ReviewVO rvo);
	public int reviewInsert(ReviewVO rvo);
	public int pwdConfirm(ReviewVO rvo);
	public int reviewUpdate(ReviewVO rvo);
	public int reviewDelete(int re_no);
	
}
