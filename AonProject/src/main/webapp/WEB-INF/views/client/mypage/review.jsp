<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel = "stylesheet" href = "/resources/include/fontello/css/fontello.css">
<style type = "text/css">
	.main{
		box-sizing: border-box;
		padding: 10px;
	}
	
	#aTitle {
			font-size: 25px;
			padding : 10px 0;
			padding-left : 5px;
			border : 1px solid graytext;
			display: block;
			border-bottom: 1px solid #73879C;
			margin-bottom: 15px;
		}
	#shonwList{
		font-size: 12px;
	}
	.step-panels{
			display: block;
			width : 100%;
			clear : both;
			height: 37px;
			margin-bottom: 30px;
		}
		#align{
			width : 99%;
			text-align: center;
			margin: 0 auto;
		}
		.step {
			display : table;
			text-align : center;
			letter-spacing: -1px;
			height: 37px;
			float: left;
			cursor : pointer;
			width : 24.9206%;
	
			border: 1px solid gray;
		}
		.step:FIRST-CHILD{
			border-right: none;
		}
		.step:LAST-CHILD{
			border-left:none;
			clear : right;
			
		}
		.step span{
			vertical-align: middle;
			display: table-cell;
		}
		
		.step.action {
			background-color: black;
			color : white;
		}
		
		
		#reviewTable{
			width: 100%;
			border: 2px solid lightgrey;
			font-size: 15px;
		}
		#reviewTable tr.viewImg{
			border-bottom: 1px solid black;
			height: 100px;
		}
		#reviewTable tr.viewImg:LAST-CHILD{
			border-bottom: none;
		}
		#reviewTable tr > *{
			text-align : center;
			padding: 15px 0px;
			vertical-align: middle;
		}
		.clickEvent{
			background-color : lightgray;
			height: auto;
			text-align: left;
		}
		#tableH{
			font-weight: bold;
			font-size: 18px;
			border-bottom: 1px solid black;

		}
		.viewImg a{
			width: 150px;
			height: 150px;
			display: inline-block;
		}
		.viewImg img{
			width: 100%;
			height: 100%;
			display: inline-block;
		}
		.pagingNumbers{
			height: auto;
			text-align: center;
			font-size: 15px;
		}
		.pagingNumbers a{
			text-decoration: none;
			color: black;
		}
		.pagingNumbers{
			font-size: 25px;
			margin-top: 15px;
		}
		.hahaha td{
			border-bottom: 1px solid lightgrey;
		}
		.clickEvent td{
			text-align: left !important;
		}
		.clickEvent{
			border-bottom: 1px solid lightgrey;
		}
		.karkar{
			color: red;
		}
</style>
<div class = "main">
	<h2 id = "aTitle">MyPage</h2>
	<div class = "step-panels">
		<div id = "align">
			<div class = "step">
				<span>주문내역</span>
			</div>
			<div class = "step action">
				<span>리뷰내역</span>
			</div>
			<div class = "step">
				<span>문의내역</span>
			</div>
			<div class = "step">
				<span>내 정보</span>
			</div>
		</div>
	</div>
	<div class= "reviewList">
		<table id = "reviewTable">
			<colgroup>
				<col width="25%">
				<col width="50%">
				<col width="25%">
			</colgroup>
			<tr id = "tableH">
				<th>상품</th>
				<th>후기 제목</th>
				<th>작성일자</th>
			</tr>
			<c:if test="${empty reviewList }">
				<tr>
					<td colspan="3">등록된 리뷰가 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty reviewList }">
				<c:forEach items="${reviewList }" varStatus="status">
					<tr class = "hahaha">
						<td class=  "viewImg">
							<a href = "/detail?no=${reviewList[status.index].p_no }"><img src = "/productUpload/${reviewList[status.index].pi_file }"></a>
						</td>
						<td>${reviewList[status.index].re_title }</td>
						<td>${reviewList[status.index].re_date }</td>
					</tr>
					<tr class = "clickEvent">
						<td colspan="3">${reviewList[status.index].re_content }</td>
					</tr>
				</c:forEach>
				<tr class= "pagingNumbers">
							<td colspan="3" id = "pageLow">
								<c:if test = "${memberVO.totalPage < memberVO.pageNum }">
									<c:set var = "pNum" value= "${memberVO.totalPage }"/>
								</c:if>
								<c:if test = "${memberVO.totalPage >= memberVO.pageNum }">
									<c:set var = "pNum" value= "${memberVO.pageNum }"/>
								</c:if>
							
								<c:if test = "${memberVO.pageTotal[0] eq 1 and pNum eq 1}" >
									<span class = "icon-angle-double-left"></span>
								</c:if>
								<c:if test = "${memberVO.pageTotal[0] eq 1 and pNum ne 1}" >
									<a href = "/member/mypage/review?pageNum=1" data-num = "1" class = "icon-angle-double-left"></a>
								</c:if>
								<c:if test = "${memberVO.pageTotal[0] ne 1}" >
									<a href = "/member/mypage/review?pageNum=1" data-num = "1" class = "icon-angle-double-left"></a>
								</c:if>
								<c:if test = "${memberVO.pageTotal[0] eq 1}" >
									<span class = "icon-angle-left"></span>
								</c:if>
								<c:if test = "${memberVO.pageTotal[0] ne 1}" >
									<a href = "/member/mypage/review?pageNum=${memberVO.pageTotal[0] - fn:length(memberVO.pageTotal) }" data-num = "${memberVO.pageTotal[0] - fn:length(memberVO.pageTotal) }" class = "icon-angle-left"></a>
								</c:if>
					
								<c:forEach items="${memberVO.pageTotal }" varStatus="status">
									<c:if test = "${memberVO.pageTotal[status.index] eq pNum}" >
										<span class = "karkar">${memberVO.pageTotal[status.index] }</span>
									</c:if>
									<c:if test = "${memberVO.pageTotal[status.index] ne pNum}" >
										<a href = "/member/mypage/review?pageNum=${memberVO.pageTotal[status.index] }" data-num = "${memberVO.pageTotal[status.index]}">
					 						${memberVO.pageTotal[status.index] } 
										</a>
									</c:if>
								</c:forEach>
	
								<c:if test = "${memberVO.pageTotal[fn:length(memberVO.pageTotal) - 1] eq memberVO.totalPage}" >
									<span class = "icon-angle-right"></span>
								</c:if>
								<c:if test = "${memberVO.pageTotal[fn:length(memberVO.pageTotal) - 1] ne memberVO.totalPage}" >
									<a href = "/member/mypage/review?pageNum=${memberVO.pageTotal[0] + fn:length(memberVO.pageTotal) }" data-num = "${memberVO.pageTotal[0] + fn:length(memberVO.pageTotal) }" class = "icon-angle-right"></a>
								</c:if>
								<c:if test = "${memberVO.pageTotal[fn:length(memberVO.pageTotal) - 1] eq memberVO.totalPage and memberVO.totalPage eq pNum}" >
									<span class = "icon-angle-double-right"></span>
								</c:if>
								<c:if test = "${memberVO.pageTotal[fn:length(memberVO.pageTotal) - 1] eq memberVO.totalPage and memberVO.totalPage ne pNum}" >
									<a href = "/member/mypage/review?pageNum=${memberVO.totalPage }" data-num = "${memberVO.totalPage }" class = "icon-angle-double-right"></a>
								</c:if>
								<c:if test = "${memberVO.pageTotal[fn:length(memberVO.pageTotal) - 1] ne memberVO.totalPage}" >
									<a href = "/member/mypage/review?pageNum=${memberVO.totalPage }" data-num = "${memberVO.totalPage }" class = "icon-angle-double-right"></a>
								</c:if>
							</td>
						</tr>
			</c:if>
		</table>
	</div>
</div>
<script src = "/resources/include/js/jquery-1.12.4.min.js"></script>
	<script type = "text/javascript">
		$(document).ready(function(){
			$(".step").eq(0).click(function(){
				location.href = "/member/mypage/orderlist";
			});
			$(".step").eq(1).click(function(){
				location.href = "/member/mypage/review";
			});
			$(".step").eq(2).click(function(){
				location.href = "/member/mypage/qna";
			});
			$(".step").eq(3).click(function(){
				location.href = "/member/mypage/myinfo";
			});
			$(".step").eq(1).css("border-right", "none");
		});
	</script>
	
	<script type = "text/javascript">
		$(document).ready(function(){
			$(".clickEvent").css("display", "none");
			$(".hahaha").click(function(){
				if($(this).next().css("display") == "none"){
					$(this).next().css("display", "table-row");
				}else{
					$(this).next().css("display", "none");
				}	
			});
		});
	</script>