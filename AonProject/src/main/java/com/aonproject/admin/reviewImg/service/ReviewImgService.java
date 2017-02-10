package com.aonproject.admin.reviewImg.service;

import java.util.List;

import com.aonproject.admin.reviewImg.vo.ReviewImgVO;

public interface ReviewImgService {
	public List<ReviewImgVO> reviewImgList(ReviewImgVO revo);
	public int reviewImgInsert(ReviewImgVO revo);
	public int reviewImgUpdate(ReviewImgVO revo);
	public int reviewImgDelete(int re_no);
	public List<ReviewImgVO> reviewImgFilename(int re_no);
}
