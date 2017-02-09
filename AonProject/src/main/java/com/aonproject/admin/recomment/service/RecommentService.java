package com.aonproject.admin.recomment.service;

import java.util.List;

import com.aonproject.admin.recomment.vo.RecommentVO;

public interface RecommentService {
	public List<RecommentVO> recommentList(RecommentVO comvo);
	public int recommentInsert(RecommentVO comvo);
	public int recommentUpdate(RecommentVO comvo);
	public int recommentDelete(int re_no);
}
