package com.aonproject.admin.aInfo.vo;

import java.io.Serializable;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.SpringSecurityCoreVersion;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.util.Assert;

import com.aonproject.common.util.vo.PolicyAgrVO;

public class AdminVO extends PolicyAgrVO implements UserDetails{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int a_no = 0; // 관리자 번호
	private String a_id = ""; // 관리자 id
	private String a_pwd = ""; // 관리자 비밀번호
	private String a_name = ""; // 관리자 이름
	private String a_addr = ""; // 관리자 주소
	private String a_tel = ""; // 관리자 연락처
	private String a_email = ""; // 관리자 이메일
	private String a_date = ""; // 등록일
	private Set<GrantedAuthority> authorities; // 계정이 가지고 있는 권한 목록
	
	private String adminSearch = ""; // 아이디 검색
	
	public String getAdminSearch() {
		return adminSearch;
	}

	public void setAdminSearch(String adminSearch) {
		this.adminSearch = adminSearch;
	}

	@Override
	public String toString() {
		return "AdminVO [a_no=" + a_no + ", a_id=" + a_id + ", a_pwd=" + a_pwd + ", a_name=" + a_name + ", a_addr="
				+ a_addr + ", a_tel=" + a_tel + ", a_email=" + a_email + ", a_date=" + a_date + ", authorities="
				+ authorities + ", pageNum=" + pageNum + ", totalCount=" + totalCount + ", countList=" + countList
				+ ", countPage=" + countPage + ", totalPage=" + totalPage + ", pageTotal=" + Arrays.toString(pageTotal)
				+ ", start_data=" + start_data + ", end_data=" + end_data + "]";
	}

	public AdminVO() {}
	
	public AdminVO(int a_no, String a_id, String a_pwd, Collection<? extends GrantedAuthority> authorities) {
		super();
		this.a_no = a_no;
		this.a_id = a_id;
		this.a_pwd = a_pwd;
		this.authorities = Collections.unmodifiableSet(sortAuthorities(authorities));
	}


	private static SortedSet<GrantedAuthority> sortAuthorities(Collection<? extends GrantedAuthority> authorities){
		Assert.notNull(authorities, "Cannot pass a null GrantedAuthority collection");
		
		SortedSet<GrantedAuthority> sortedAuthorities = new TreeSet<GrantedAuthority>(new AuthorityComparator());
		
		for(GrantedAuthority grantedAuthority : authorities){
			Assert.notNull(grantedAuthority, "GrantedAuthority list cannot contain any null elements");
			sortedAuthorities.add(grantedAuthority);
		}
		
		return sortedAuthorities;
	}
	
	private static class AuthorityComparator implements Comparator<GrantedAuthority>, Serializable{
		private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;
		
		public int compare(GrantedAuthority g1, GrantedAuthority g2){
			if(g2.getAuthority() == null){
				return -1;
			}
			if(g1.getAuthority() == null){
				return -1;
			}
			return g1.getAuthority().compareTo(g2.getAuthority());
		}
		
	}
	
	public int getA_no() {
		return a_no;
	}

	public void setA_no(int a_no) {
		this.a_no = a_no;
	}

	public String getA_id() {
		return a_id;
	}

	public void setA_id(String a_id) {
		this.a_id = a_id;
	}

	public String getA_pwd() {
		return a_pwd;
	}

	public void setA_pwd(String a_pwd) {
		this.a_pwd = a_pwd;
	}

	public String getA_name() {
		return a_name;
	}

	public void setA_name(String a_name) {
		this.a_name = a_name;
	}

	public String getA_addr() {
		return a_addr;
	}

	public void setA_addr(String a_addr) {
		this.a_addr = a_addr;
	}

	public String getA_tel() {
		return a_tel;
	}

	public void setA_tel(String a_tel) {
		this.a_tel = a_tel;
	}

	public String getA_email() {
		return a_email;
	}

	public void setA_email(String a_email) {
		this.a_email = a_email;
	}


	public String getA_date() {
		return a_date;
	}

	public void setA_date(String a_date) {
		this.a_date = a_date;
	}
	
	public void setAuthorities(Collection<? extends GrantedAuthority> authorities) {
		this.authorities = Collections.unmodifiableSet(sortAuthorities(authorities));
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return authorities;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return a_pwd;
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return a_id;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
	
	// 클래스 관계 설계 미스... 페이징
	private String pageNum = "0"; // 페이지 번호
	private int totalCount = 0; // 총 데이터 수
	private int countList = 0; // 한 페이지당 보여줄 데이터 개수
	private int countPage = 0; // 한 페이지당 보여줄 페이지 번호 수
	private int totalPage = 0; // 보여줄 페이지 번호의 마지막 번호
	private int[] pageTotal = null; // 보여줄 페이지 번호들
	private int start_data = 0; // 한 페이지에 보여줄 데이터 시작 번호
	private int end_data = 0; // // 한 페이지에 보여줄 데이터 끝 번호
	
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
