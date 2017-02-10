package com.aonproject.admin.recomment.dao;

import java.util.List;

import com.aonproject.admin.recomment.vo.RecommentVO;

public interface RecommentDAO {
	public List<RecommentVO> recommentList(RecommentVO comvo);
	public int recommentInsert(RecommentVO comvo);
	public int recommentUpdate(RecommentVO comvo);
	public int recommentDelete(int re_no);

}
