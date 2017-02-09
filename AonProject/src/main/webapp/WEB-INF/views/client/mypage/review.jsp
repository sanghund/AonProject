<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			width: 100%;
			height: 100%;
			display: inline-block;
		}
		.viewImg img{
			width: 100%;
			height: 100%;
			display: inline-block;
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
			$(".clickEvent").attr("display", "none");
			$(".hahaha").click(function(){
				if($(this).next().css("display") == "none"){
					$(this).next().css("display", "block");
				}else{
					$(this).next().css("display", "none");
				}	
			});
		});
	</script>