package com.aonproject.admin.review.dao;

import java.util.List;

import com.aonproject.admin.review.vo.ReviewVO;

public interface ReviewDAO {
	public List<ReviewVO> reviewList(ReviewVO rvo);
	public int reviewInsert(ReviewVO rvo);
	public int selectReno();
	public int pwdConfirm(ReviewVO rvo);
	public int reviewUpdate(ReviewVO rvo);
	public int reviewDelete(int re_no);
	public int reviewSelectNo();
	public int rechkUpdate(int re_no);
	public int cntList();

}
