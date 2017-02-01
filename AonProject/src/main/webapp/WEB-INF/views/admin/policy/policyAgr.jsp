<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %>
<link rel = "stylesheet" href = "/resources/include/fontello/css/fontello.css">

<div class = "main">
	<h2 id = "pTitle">약관 동의</h2>
	<form id = "searchForm">
		<div id = "admin">
			<h3>관리자 목록</h3>
			<div>
				<span>
					<label for="adminSearch">아이디 검색</label>
					<input type = "text" id = "adminSearch" name = "adminSearch">
					<input type = "button" class = "searchBtn" value = "검색">
				</span>
			</div>
			<table summary="관리자 개인정보 이용약관 동의 목록">
				<colgroup>
					<col width="5%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="20%">
					<col width="20%">
					<col width="10%">
					<col width="15%">
				</colgroup>
				<tr>
					<th>회원 번호</th>
					<th>회원 아이디</th>
					<th>회원 이름</th>
					<th>회원 전화번호</th>
					<th>회원 이메일</th>
					<th>약관 이름</th>
					<th>약관 동의여부</th>
					<th>약관 동의날짜</th>
				</tr>
				<c:if test="${not empty adminAgr}">
					<c:if test="${adminVO.totalPage < adminVO.pageNum }">
						<tr>
							<td colspan="8">데이터가 존재하지 않습니다.</td>
						</tr>
					</c:if>
					<c:forEach items="${adminAgr }" varStatus="status">
						<tr>
							<td>${adminAgr[status.index].a_no }</td>
							<td>${adminAgr[status.index].a_id }</td>
							<td>${adminAgr[status.index].a_name }</td>
							<td>${adminAgr[status.index].a_tel }</td>
							<td>${adminAgr[status.index].a_email }</td>
							<td>${adminAgr[status.index].po_name }</td>
							<td>${adminAgr[status.index].pa_confirm }</td>
							<td>${adminAgr[status.index].pa_date }</td>
						</tr>
					</c:forEach>
						<tr>
							<td colspan="8">
								<c:if test = "${adminVO.pageTotal[0] eq 1}" >
									<span class = "icon-angle-double-left"></span>
								</c:if>
								<c:if test = "${adminVO.pageTotal[0] ne 1}" >
									<a href = "/admin/policyAgr?pageNum=1" class = "icon-angle-double-left"></a>
								</c:if>
								<c:if test = "${adminVO.pageTotal[0] eq 1}" >
									<span class = "icon-angle-left"></span>
								</c:if>
								<c:if test = "${adminVO.pageTotal[0] ne 1}" >
									<a href = "/admin/policyAgr?pageNum=${adminVO.pageTotal[0] - fn:length(adminVO.pageTotal) }" class = "icon-angle-left"></a>
								</c:if>
					
								<c:if test = "${adminVO.totalPage < adminVO.pageNum }">
									<c:set var = "pNum" value= "${adminVO.totalPage }"/>
								</c:if>
								<c:if test = "${adminVO.totalPage >= adminVO.pageNum }">
									<c:set var = "pNum" value= "${adminVO.pageNum }"/>
								</c:if>
								<c:forEach items="${adminVO.pageTotal }" varStatus="status">
									<c:if test = "${adminVO.pageTotal[status.index] eq pNum}" >
										<span>${adminVO.pageTotal[status.index] }</span>
									</c:if>
									<c:if test = "${adminVO.pageTotal[status.index] ne pNum}" >
										<a href = "/admin/policyAgr?pageNum=${adminVO.pageTotal[status.index] }">
											${adminVO.pageTotal[status.index] } 
										</a>
									</c:if>
								</c:forEach>
	
								<c:if test = "${adminVO.pageTotal[fn:length(adminVO.pageTotal) - 1] eq adminVO.totalPage}" >
									<span class = "icon-angle-right"></span>
								</c:if>
								<c:if test = "${adminVO.pageTotal[fn:length(adminVO.pageTotal) - 1] ne adminVO.totalPage}" >
									<a href = "/admin/policyAgr?pageNum=${adminVO.pageTotal[0] + fn:length(adminVO.pageTotal) }" class = "icon-angle-right"></a>
								</c:if>
								<c:if test = "${adminVO.pageTotal[fn:length(adminVO.pageTotal) - 1] eq adminVO.totalPage}" >
									<span class = "icon-angle-double-right"></span>
								</c:if>
								<c:if test = "${adminVO.pageTotal[fn:length(adminVO.pageTotal) - 1] ne adminVO.totalPage}" >
									<a href = "/admin/policyAgr?pageNum=${adminVO.totalPage }" class = "icon-angle-double-right"></a>
								</c:if>
							</td>
						</tr>
				</c:if>
				<c:if test="${empty adminAgr }">
					<colgroup>
						<col width="100%">
					</colgroup>
					<tr>
						<td colspan="8">데이터가 존재하지 않습니다.</td>
					</tr>
					<tr>
						<td colspan="8">
							<span class = "icon-angle-double-left"></span>
								<span class = "icon-angle-left"></span>
								<span>1</span>
								<span class = "icon-angle-right"></span>
								<span class = "icon-angle-double-right">
							</span>
						</td>
					</tr>
				</c:if>
			</table>
		</div>
	</form>
</div>
