package com.aonproject.common.util.vo;

public class CommonPagingVO {
	protected String pageNum = "0"; // 페이지 번호
	protected int totalCount = 0; // 총 데이터 수
	protected int countList = 0; // 한 페이지당 보여줄 데이터 개수
	protected int countPage = 0; // 한 페이지당 보여줄 페이지 번호 수
	protected int totalPage = 0; // 보여줄 페이지 번호의 마지막 번호
	protected int[] pageTotal = null; // 보여줄 페이지 번호들
	protected int start_data = 0; // 한 페이지에 보여줄 데이터 시작 번호
	protected int end_data = 0; // // 한 페이지에 보여줄 데이터 끝 번호
	
	public String getPageNum() {
		return pageNum;
	}
	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getCountList() {
		return countList;
	}
	public void setCountList(int countList) {
		this.countList = countList;
	}
	public int getCountPage() {
		return countPage;
	}
	public void setCountPage(int countPage) {
		this.countPage = countPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int[] getPageTotal() {
		return pageTotal;
	}
	public void setPageTotal(int[] pageTotal) {
		this.pageTotal = pageTotal;
	}
	public int getStart_data() {
		return start_data;
	}
	public void setStart_data(int start_data) {
		this.start_data = start_data;
	}
	public int getEnd_data() {
		return end_data;
	}
	public void setEnd_data(int end_data) {
		this.end_data = end_data;
	}
	
	
}
