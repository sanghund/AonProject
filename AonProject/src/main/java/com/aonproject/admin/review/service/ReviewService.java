package com.aonproject.admin.review.service;

import java.util.List;

import com.aonproject.admin.review.vo.ReviewVO;

public interface ReviewService {
	public List<ReviewVO> reviewList(ReviewVO rvo);
	public List<ReviewVO> reviewuserList(ReviewVO rvo);
	public int reviewInsert(ReviewVO rvo);
	public int selectReno();
	public int pwdConfirm(ReviewVO rvo);
	public int reviewUpdate(ReviewVO rvo);
	public int reviewDelete(int re_no);
	public int reviewSelectNo();
	public int rechkUpdate(int re_no);
	public int cntList();
	public int mnoList();
	public int onoList();
	public int reviewUserInsert(ReviewVO rvo);
	public int reviewUserUpdate(ReviewVO rvo);
	public int InsertID(ReviewVO rvo);
	public int confirmMno(ReviewVO rvo);
}
