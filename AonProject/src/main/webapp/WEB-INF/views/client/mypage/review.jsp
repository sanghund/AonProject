<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
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