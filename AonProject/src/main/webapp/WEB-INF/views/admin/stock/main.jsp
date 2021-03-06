<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel = "stylesheet" href = "/resources/include/fontello/css/fontello.css">
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
	.listTable td {padding:1em;}
	.tc {text-align:center;}
</style>

	<h3>재고관리</h3>
	<!-- stock list-->
	<div class="stockList">
		<!-- 상품 디테일 확인 폼 -->
		<form id="detailForm">
			<input type="hidden" name="p_no" id="p_no">
			<table class="table table-striped jambo_table bulk_action">
				<thead>
					<tr class="headings">
						<td>카테고리</td>
						<td>상품유형</td>
						<td>상품번호</td>
						<td>상품명</td>
						<td>색상</td>
						<td>사이즈</td>
						<td>가격</td>
						<td>재고량</td>
						<td>등록일</td>
						<td>수량등록</td>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty stockList}">
							<c:if test="${stockVO.totalPage < stockVO.pageNum }">
								<tr>
									<td class="tc" colspan="10">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							<c:forEach var="stockList" items="${stockList}">
								<tr data-no="${stockList.p_no}" class="productPack">
									<td>${stockList.ca_name}</td>
									<td>${stockList.p_type_name}</td>
									<td>${stockList.p_no}</td>
									<td>${stockList.p_name}</td>
									<td>${stockList.color}</td>
									<td>${stockList.size}</td>
									<td>${stockList.p_price}</td>
									<td>${stockList.stock_cnt}</td>
									<td>${stockList.stock_date}</td>
									<td><span></span><input type="button" class="addStock btn btn-primary" value="등록"><input type="button" class="submit btn btn-success" value="완료"></td>
								</tr>
							</c:forEach>
						</c:when>
						<%-- <c:otherwise>
							<tr>
								<td colspan="11">등록된 상품이 없습니다</td>
							</tr>
						</c:otherwise> --%>
					</c:choose>
					<tr>
						<td colspan="10" id = "pageLow" class="tc">
							<c:if test = "${stockVO.totalPage < stockVO.pageNum }">
								<c:set var = "pNum" value= "${stockVO.totalPage }"/>
							</c:if>
							<c:if test = "${stockVO.totalPage >= stockVO.pageNum }">
								<c:set var = "pNum" value= "${stockVO.pageNum }"/>
							</c:if>
						
							<c:if test = "${stockVO.pageTotal[0] eq 1 and pNum eq 1}" >
								<span class = "icon-angle-double-left"></span>
							</c:if>
							<c:if test = "${stockVO.pageTotal[0] eq 1 and pNum ne 1}" >
								<a href = "/admin/stockList?pageNum=1" data-num = "1" class = "icon-angle-double-left"></a>
							</c:if>
							<c:if test = "${stockVO.pageTotal[0] ne 1}" >
								<a href = "/admin/stockList?pageNum=1" data-num = "1" class = "icon-angle-double-left"></a>
							</c:if>
							<c:if test = "${stockVO.pageTotal[0] eq 1}" >
								<span class = "icon-angle-left"></span>
							</c:if>
							<c:if test = "${stockVO.pageTotal[0] ne 1}" >
								<a href = "/admin/stockList?pageNum=${stockVO.pageTotal[0] - fn:length(stockVO.pageTotal) }" data-num = "${stockVO.pageTotal[0] - fn:length(stockVO.pageTotal) }" class = "icon-angle-left"></a>
							</c:if>
				
							<c:forEach items="${stockVO.pageTotal }" varStatus="status">
								<c:if test = "${stockVO.pageTotal[status.index] eq pNum}" >
									<span>${stockVO.pageTotal[status.index] }</span>
								</c:if>
								<c:if test = "${stockVO.pageTotal[status.index] ne pNum}" >
									<a href = "/admin/stockList?pageNum=${stockVO.pageTotal[status.index] }" data-num = "${stockVO.pageTotal[status.index]}">
				 						${stockVO.pageTotal[status.index] } 
									</a>
								</c:if>
							</c:forEach>
				
							<c:if test = "${stockVO.pageTotal[fn:length(stockVO.pageTotal) - 1] eq stockVO.totalPage}" >
								<span class = "icon-angle-right"></span>
							</c:if>
							<c:if test = "${stockVO.pageTotal[fn:length(stockVO.pageTotal) - 1] ne stockVO.totalPage}" >
								<a href = "/admin/stockList?pageNum=${stockVO.pageTotal[0] + fn:length(stockVO.pageTotal) }" data-num = "${stockVO.pageTotal[0] + fn:length(stockVO.pageTotal) }" class = "icon-angle-right"></a>
							</c:if>
							<c:if test = "${stockVO.pageTotal[fn:length(stockVO.pageTotal) - 1] eq stockVO.totalPage and stockVO.totalPage eq pNum}" >
								<span class = "icon-angle-double-right"></span>
							</c:if>
							<c:if test = "${stockVO.pageTotal[fn:length(stockVO.pageTotal) - 1] eq stockVO.totalPage and stockVO.totalPage ne pNum}" >
								<a href = "/admin/stockList?pageNum=${stockVO.totalPage }" data-num = "${stockVO.totalPage }" class = "icon-angle-double-right"></a>
							</c:if>
							<c:if test = "${stockVO.pageTotal[fn:length(stockVO.pageTotal) - 1] ne stockVO.totalPage}" >
								<a href = "/admin/stockList?pageNum=${stockVO.totalPage }" data-num = "${stockVO.totalPage }" class = "icon-angle-double-right"></a>
							</c:if>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<script>
		var on = false;
		
		$(function(){
			var p_no = "";
			$(".submit").hide();
			
			$(".addStock").click(function(){
				p_no = $(this).parents("tr").attr("data-no");
				
				var inputObj = $("<input>")
				inputObj.attr({"type":"number", "name":"stock_cnt"})
				inputObj.addClass("count");
				
				var inputArea = $(this).parent().find("span");
				inputArea.append(inputObj);
				
				var thisInputArea = $(this).parent().find(".count");
				
				var btnSubmit = $(this).parent().find(".submit");
				btnSubmit.show();
				
				var addStock = $(this).parent().children(".addStock");
				
				$(this).hide();
				$(".addStock").not(addStock).show();
				$(".count").not(thisInputArea).remove();
				$(".submit").not(btnSubmit).hide();
			});
			
			$(".submit").click(function(){
				console.log($(".count").val());
				if(!chkSubmit($(".count"), "상품수량을"))return;
				$.ajax({
					url	: "/admin/stockUpdate",
					type: "post",
					headers	: {
						'Accept': 'application/json',
	                    'Content-Type': 'application/json'
					},
					dataType: "text",
					data	: JSON.stringify({
						stock_cnt  : $(".count").val(),
						p_no	   : p_no
					}),
					error	: function(){	
						alert("시스템 오류입니다. 관리자에게 문의하세요.");
					},
					success	: function(stockUpdate){
						if(stockUpdate == "SUCCESS"){
							alert(" 등록이 완료 되었습니다.");
							location.href="/admin/stockList"
						}
					}
				});
				$(".count").remove();
				$(".submit").hide();
				$(".addStock").show();
			})
		})
	</script>
	