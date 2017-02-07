<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!-- <link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="/resources/bootstrap/css/bootstrap-theme.css"> -->

<style>
	.content h4 {margin:20px 0 10px;}
	
	.orderInfo {margin:1em 0; padding:0 20px; width:100%;}
	.priceInfo {margin:1em 0; padding:0 20px;}
	.orderInfo h5 {margin:5px 0; font-weight:bold; font-size:1.2em;}
		.preview {padding:1em 0; border:1px solid #ddd;} 
		.preview em {display:block;}
	.priceInfo > div {position:relative; padding:0; border:1px solid #ddd;}
	
	.priceTitle {text-align:center; padding:20px 0; color:#888;}
	.col-xs-10 {width:41.6666666%; border-right:1px solid #ccc;}
	.priceDetail > div {padding:10px 0; text-align:center; height:38px; border-top:1px solid #ccc;}
	.priceDetail > p {height:76px; text-align:center; border-top:1px solid #ccc; padding:20px; margin:0;}
	
	.userInfo {margin:1em 0; padding:0 20px;}
	.userDetail {margin:1em 0; padding:0 20px;}
	
	@media (min-width:992px){
		.col-md-8 {width: 33.333333%;}
	}
</style>

<div class="content">
	<div class="orderInfo">
		<h4 class="bold">주문 상품 확인</h4>
		<div class="preview col-md-12">
			<!-- orderList repeat area start-->
			<div class="orderContainer">
				<div class="col-md-2">
				<a href="">
					<img src="http://dummyimage.com/150x150" />
				</a>
				</div>
				<div class="col-md-10">
					<h5>title</h5>
					<ul>
					<li>description</li>
					<li>70,000won</li>
					<li>option</li>
					<li>price: 70,000</li>
					<li>discount: 10,000</li>
					<li>shipping: 0</li>
					</ul>
				</div>
			</div>
			<!-- orderList repeat area end-->
		</div>
	</div>
	<div class="priceInfo col-md-12">
		<h4 class="bold">결제 정보</h4>
		<div class="col-md-8">
			<div class="priceTitle">주문 합계 금액</div>
			<div class="priceDetail clearfix ">
				<div class="col-xs-10">productPrice</div>
				<div class="col-xs-14">productPrice</div>
				<div class="col-xs-10">productPrice</div>
				<div class="col-xs-14">productPrice</div>
			</div>
		</div>
		<div class="col-md-8">
			<div class="priceTitle">할인 금액 합계</div>
			<div class="priceDetail clearfix ">
				<div class="col-xs-10">productPrice</div>
				<div class="col-xs-14">productPrice</div>
				<div class="col-xs-10">productPrice</div>
				<div class="col-xs-14">productPrice</div>
			</div>
		</div>
		<div class="col-md-8">
			<div class="priceTitle">최종 결제 금액</div>
			<div class="priceDetail clearfix ">
				<p>야옹야옹</p>
			</div>
		</div>
	</div>
	<div class="userInfo col-md-12">
		<h4 class="bold">주문 고객 정보</h4>
		<div>
			<label for="m_name">주문자</label>
			<input type="text" name="m_name" id="m_name">
		</div>
		<div>
			<label for="m_tel">연락처</label>
			<input type="text" name="m_tel1" id="m_tel1">
			<input type="text" name="m_tel2" id="m_tel2">
			<input type="text" name="m_tel3" id="m_tel3">
		</div>
		<div>
			<label for="m_name">메일주소</label>
			<input type="text" name="m_email" id="m_email">
		</div>
	</div>
	<div class="userDetail col-md-12">
		<h4 class="bold">배송 정보</h4>
		<div>
			<input type="radio" name="userChk" class="userChk" value="y"><label>주문자와 동일</label>
			<input type="radio" name="userChk" class="userChk" value="n"><label>새로입력</label>
		</div>
		<div>
			<label for="m_name">주문자</label>
			<input type="text" name="m_name" id="m_name">
		</div>
		<!-- address -->
		<span class = "array" id = "forAddr">주소</span>
		<div id = "forAdress">
			<span id = "daumApi">
				<input type = "text" id = "a_addr1" name = "a_addr1" readonly="readonly">
				<input type = "button" id = "go" name = "go" value = "주소 검색">
				<span id = "addrChkMsg1"></span>
			</span>
			<input type = "text" width="500px" id = "a_addr2" name = "a_addr2" readonly="readonly">
			<input type = "text" width="500px" id = "a_addr3" name = "a_addr3">
			<span id = "addrChkMsg2"></span>
		</div>
		<!-- address -->
		<div>
			<label for="m_tel">연락처</label>
			<input type="text" name="m_tel1" id="m_tel1">
			<input type="text" name="m_tel2" id="m_tel2">
			<input type="text" name="m_tel3" id="m_tel3">
		</div>
	</div>
</div>