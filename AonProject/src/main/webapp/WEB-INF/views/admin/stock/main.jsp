<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function(){
		//신규 등록 버튼 이벤트 처리
		$("#insertBtn").click(function(){
			location.href="/admin/writeForm";
		})
		
		//상품 디테일 호출(삭제, 업데이트)
		$(".productPack").hover(function(){
				$(this).children("td").css("background","pink");
			},
			function(){
				$(this).children("td").css("background","white");
		})

	})
</script>
<style>
	/* .itemList {width:800px; height:500px; overflow-x:hidden; overflow-y:auto;} */
	.listTable {border-collapse:collapes; width:500px;}
	.listTable td {border:1px solid #222; padding:1em;}
	.stockList {width:600px; background:#f00;}
</style>

	<h3>상품 리스트</h3>
	<div class="btnContainer">
		<input type="button" id="insertBtn" value="신규등록">
	</div>
	<!-- 상품 검색 제어 -->
	<div class="btnContainer">
		<!-- <div>
			<select name="search" id="search">
				<option value="all">전체</option>
				<option value="all">상품번호</option>
				<option value="all">카테고리</option>
				<option value="all">상품분류</option>
				<option value="all">상품명</option>
				<option value="all">사이즈</option>
				<option value="all">색상</option>
				<option value="all">할인율</option>
				<option value="all">소재</option>
				<option value="all">등록일</option>
			</select>
		</div>
		<div>
			<input type="text" id="keyword" name="keyword">
		</div> -->
	</div>
	<!-- stock list-->
	<div class="stockList">
		<!-- 상품 디테일 확인 폼 -->
		<form id="detailForm">
			<input type="hidden" id="p_no" name="p_no">
		</form>
		<table class="listTable">
			<thead>
				<tr>
					<td>상품번호</td>
					<td>상품재고</td>
					<td>등록일</td>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty stockList}">
						<c:forEach var="stockList" items="${stockList}">
							<tr data-no="${stockList.p_no}" class="productPack">
								<td>${stockList.p_no}</td>
								<td>${stockList.stock_cnt}</td>
								<td>${stockList.stock_date}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="11">등록된 상품이 없습니다</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
