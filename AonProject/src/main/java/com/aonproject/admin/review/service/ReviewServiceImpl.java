package com.aonproject.admin.review.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aonproject.admin.review.dao.ReviewDAO;
import com.aonproject.admin.review.vo.ReviewVO;
import com.aonproject.client.mInfo.vo.MemberVO;

@Service
@Transactional
public class ReviewServiceImpl implements ReviewService{
	Logger logger = Logger.getLogger(ReviewServiceImpl.class);
	
	@Autowired
	private ReviewDAO reviewDAO;
	
	//리뷰 리스트 목록
	@Override
	public List<ReviewVO> reviewList(ReviewVO rvo){
		List<ReviewVO> myList = null;
		myList = reviewDAO.reviewList(rvo);
		return myList;
	}
	@Override
	public List<ReviewVO> reviewuserList(ReviewVO rvo){
		List<ReviewVO> myList = null;
		myList = reviewDAO.reviewuserList(rvo);
		return myList;
	}
	
	//글입력
	@Override
	public int reviewInsert(ReviewVO rvo){
		int result = 0;
		result = reviewDAO.reviewInsert(rvo);
		System.out.println(result);
		return result;
	}
	@Override
	public int selectReno(){
		int result = 0;
		result = reviewDAO.selectReno();
		return result;
	}
	
	@Override
	public int pwdConfirm(ReviewVO rvo) {
		int result = 0;
		result = reviewDAO.pwdConfirm(rvo);
		return result;
	}

	@Override
	public int reviewUpdate(ReviewVO rvo) {
		int result = 0;
		result = reviewDAO.reviewUpdate(rvo);
		return result;
	}

	@Override
	public int reviewDelete(int re_no) {
		int result = 0;
		result = reviewDAO.reviewDelete(re_no);
		return result;	
	}

	@Override
	public int reviewSelectNo() {
		int result = 0;
		result = reviewDAO.reviewSelectNo();
		return result;
	}

	@Override
	public int rechkUpdate(int re_no) {
		int result  = 0;
		result  = reviewDAO.rechkUpdate(re_no);
		return result;
	}

	@Override
	public int cntList() {
		int result = 0;
		result = reviewDAO.cntList();
		return result;
	}

	@Override
	public int mnoList() {
		int result=0;
		result = reviewDAO.mnoList();
		return result;
	}

	@Override
	public int onoList() {
		int result=0;
		result = reviewDAO.onoList();
		return result;
	}

	@Override
	public int reviewUserInsert(ReviewVO rvo) {
		int result = 0;
		result = reviewDAO.reviewUserInsert(rvo);
		return result;
	}

	@Override
	public int reviewUserUpdate(ReviewVO rvo) {
		int result = 0;
		result = reviewDAO.reviewUserUpdate(rvo);
		return result;
	}

	@Override
	public int InsertID(ReviewVO rvo) {
		int result = 0;
		result = reviewDAO.InsertID(rvo);
		return result;
	}
	@Override
	public int confirmMno(ReviewVO rvo) {
		int result = 0;
		result = reviewDAO.confirmMno(rvo);
		return result;
	}
	@Override
	public List<ReviewVO> myReview(MemberVO vo) {
		// TODO Auto-generated method stub
		return reviewDAO.myReview(vo);
	}

}
