<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %>

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
			width : 24.9206%;
			cursor : pointer;
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
		
		#orderTable{
			width: 100%;
			border: 2px solid lightgrey;
			font-size: 15px;
		}
		#orderTable tr.viewImg{
			border-bottom: 1px solid black;
			height: 100px;
		}
		#orderTable tr.viewImg:LAST-CHILD{
			border-bottom: none;
		}
		#orderTable tr > *{
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
		.hahaha td{
			border-bottom: 1px solid grey;
		}
		.pagingNumbers{
			font-size: 25px;
			margin-top: 15px;
		}
		.viewImg{
			border-left: 1px solid black;		
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
		.karkar{
			color: red;
		}
		.hihihi{
			color:black;
			margin-bottom: 10px;
			font-weight: bold;
			text-decoration: underline;
		}
		.o_numLine{
			margin-bottom: 10px;
		}
		.forbold{
			display : inline-block;
			font-weight: bold;
		}
		.arrayLine > div{
			margin-bottom: 10px;
		}
		.o_info2{
			margin-bottom: 0px;
		}
</style>
<div class = "main">
	<h2 id = "aTitle">MyPage</h2>
	<div class = "step-panels">
		<div id = "align">
			<div class = "step action">
				<span>주문내역</span>
			</div>
			<div class = "step">
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
	<div class= "orderList">
		<table id = "orderTable">
			<colgroup>
				<col width="20%">
				<col width="15%">
				<col width="30%">
				<col width="25%">
				<col width="20%">
			</colgroup>
			<tr id = "tableH">
				<th>주문번호/일자</th>
				<th colspan="2">상품 정보</th>
				<th>결제금액/방법</th>
				<th>진행현황</th>
			</tr>
			<c:if test="${empty orderList }">
				<tr>
					<td colspan="5">등록된 주문이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty orderList }">
				<c:forEach items="${orderList }" varStatus="status">
					<tr class = "hahaha">
						<td class= "o_num${orderList[status.index].o_num }">
							<div class= "o_numLine">
								<form class = "gogogomove"><input type = "hidden" class = "forO_num" name = "o_num" value="${orderList[status.index].o_num }" /><a href = "#" class="hihihi">${orderList[status.index].o_num }</a></form>
							</div>
							<div class = "o_dateLine">
								${orderList[status.index].o_date }	
							</div>
						</td>
						<td class= "viewImg" data-num = "${orderList[status.index].o_no }"><a href = "/detail?no=${orderList[status.index].p_no }"><img src = "/productUpload/${orderList[status.index].pi_file }"></a></td>
						<td class = "arrayLine">
							<div class= "o_nameLine">
								${orderList[status.index].p_type }
							</div>
							<div class= "o_info">
								[${orderList[status.index].p_name }] <span class = "forbold">${orderList[status.index].p_no }</span>
							</div>
							<div class= "o_info2">
								${orderList[status.index].p_size }/${orderList[status.index].p_color }/${orderList[status.index].o_cnt }(개)
							</div>
						</td>
						<td>
							<div class ="o_priceLine">
								${orderList[status.index].o_price }
							</div>
							<div class ="o_modeLine">
								${orderList[status.index].o_mode }
							</div>
						</td>
						<c:if test="${orderList[status.index].o_confirm eq 'Y' }">
							<td>결제완료</td>
						</c:if>
						<c:if test="${orderList[status.index].o_confirm eq 'N' }">
							<td>입금대기</td>
						</c:if>
						<c:if test="${orderList[status.index].o_confirm eq 'R' }">
							<td>환불대기</td>
						</c:if>
						<c:if test="${orderList[status.index].o_confirm eq 'F' }">
							<td>환불완료</td>
						</c:if>
					</tr>
				</c:forEach>
				<tr class= "pagingNumbers">
							<td colspan="5" id = "pageLow">
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
									<a href = "/member/mypage/orderlist?pageNum=1" data-num = "1" class = "icon-angle-double-left"></a>
								</c:if>
								<c:if test = "${memberVO.pageTotal[0] ne 1}" >
									<a href = "/member/mypage/orderlist?pageNum=1" data-num = "1" class = "icon-angle-double-left"></a>
								</c:if>
								<c:if test = "${memberVO.pageTotal[0] eq 1}" >
									<span class = "icon-angle-left"></span>
								</c:if>
								<c:if test = "${memberVO.pageTotal[0] ne 1}" >
									<a href = "/member/mypage/orderlist?pageNum=${memberVO.pageTotal[0] - fn:length(memberVO.pageTotal) }" data-num = "${memberVO.pageTotal[0] - fn:length(memberVO.pageTotal) }" class = "icon-angle-left"></a>
								</c:if>
					
								<c:forEach items="${memberVO.pageTotal }" varStatus="status">
									<c:if test = "${memberVO.pageTotal[status.index] eq pNum}" >
										<span class = "karkar">${memberVO.pageTotal[status.index] }</span>
									</c:if>
									<c:if test = "${memberVO.pageTotal[status.index] ne pNum}" >
										<a href = "/member/mypage/orderlist?pageNum=${memberVO.pageTotal[status.index] }" data-num = "${memberVO.pageTotal[status.index]}">
					 						${memberVO.pageTotal[status.index] } 
										</a>
									</c:if>
								</c:forEach>
	
								<c:if test = "${memberVO.pageTotal[fn:length(memberVO.pageTotal) - 1] eq memberVO.totalPage}" >
									<span class = "icon-angle-right"></span>
								</c:if>
								<c:if test = "${memberVO.pageTotal[fn:length(memberVO.pageTotal) - 1] ne memberVO.totalPage}" >
									<a href = "/member/mypage/orderlist?pageNum=${memberVO.pageTotal[0] + fn:length(memberVO.pageTotal) }" data-num = "${memberVO.pageTotal[0] + fn:length(memberVO.pageTotal) }" class = "icon-angle-right"></a>
								</c:if>
								<c:if test = "${memberVO.pageTotal[fn:length(memberVO.pageTotal) - 1] eq memberVO.totalPage and memberVO.totalPage eq pNum}" >
									<span class = "icon-angle-double-right"></span>
								</c:if>
								<c:if test = "${memberVO.pageTotal[fn:length(memberVO.pageTotal) - 1] eq memberVO.totalPage and memberVO.totalPage ne pNum}" >
									<a href = "/member/mypage/orderlist?pageNum=${memberVO.totalPage }" data-num = "${memberVO.totalPage }" class = "icon-angle-double-right"></a>
								</c:if>
								<c:if test = "${memberVO.pageTotal[fn:length(memberVO.pageTotal) - 1] ne memberVO.totalPage}" >
									<a href = "/member/mypage/orderlist?pageNum=${memberVO.totalPage }" data-num = "${memberVO.totalPage }" class = "icon-angle-double-right"></a>
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
			var loopGo = $(".hahaha").length;
			
			for(var i = 0; i < loopGo; i++){
				var test = $(".hahaha").eq(i).find("td").eq(0).attr("class");
				var test2 = $("."+test+"").length;
				if(test2 != 1){
					$(".hahaha").eq(i).find("td").eq(0).attr("rowspan", test2);
					$("."+test+"").not($("."+test+"").eq(0)).remove();
					i = i + test2 - 1;
				}	
				
			}
			
			$(".hihihi").click(function(event){
				event.preventDefault();
				$(this).closest(".gogogomove").attr({
					"method" : "get",
					"action" : "/member/mypage/orderview"
				});
				$(this).closest(".gogogomove").submit();
			});
		});
	</script>