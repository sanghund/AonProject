<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css" href="/resources/include/css/font-awesome.min.css">
<style>
	.stepContainer {width:101%; height:38px;}
	.step {display : table; text-align : center; letter-spacing: -1px; height: 37px; float: left; width : 33%; border: 1px solid gray;}
	.step:FIRST-CHILD{border-right: none;}
	.step:LAST-CHILD{border-left:none; clear : right;}
	.step span{vertical-align: middle; display: table-cell;}
	.step.action {background-color: black; color : white;}

	.orderContainer {clear:both;}
	.content h4 {margin:20px 0 10px; padding-top:2em; border-top:1px solid #ccc;}
	
	.orderInfo {margin:1em 0; padding:0 20px; width:96.5%;}
	.priceInfo {margin:1em 0; padding:0 20px;}
	.orderInfo h5 {margin:5px 0; font-weight:bold; font-size:1.2em;}
		.preview {position:relative; padding:1em 0; margin-bottom:1em; border:1px solid #ddd; min-height:160px;} 
		.preview em {display:block;}
	.priceInfo > div {position:relative; padding:0; border:1px solid #ddd;}
	.priceInfo > div:nth-child(-n+3) {border-right:0;}
	
	.priceTitle {text-align:center; padding:20px 0; color:#888;}
	
	.userInfo {margin:1em 0; padding:1em 20px; clear:both}
	.userDetail {margin:1em 0; padding:0 20px;}
	
	.orderImg {width:150px; height:150px; overflow:hidden; padding:0 1em; float:left;}
	.orderImg img {width:150px;}
	
	.orderDesc {float:left;}
	.orderDesc > ul {padding-top:0.1em;}
	.orderDesc > ul li {margin:0.4em 0;}
	.orderDesc > ul li:first-child {margin-bottom:0.8em;}
	.orderDesc > ul li label {width:84px; display:block; float:left; color:#888;}
	
	.priceDetail {width:33%;}
	
	.creditInfo {margin:1em 0; padding:0 20px;}
	
	.w100 {width:100%;}
	.w100 > div {width:50%; float:left; padding:10px 0; text-align:center; height:38px; border-top:1px solid #ccc; box-sizing:border-box;}
	.w100 > div:nth-child(odd) {border-right:1px solid #ccc;}
	/* .w100 > p {height:35px; text-align:center; border-top:1px solid #ccc; padding:20px; margin:0;} */
	.w100 > p {height:17px; text-align:center; border-top:1px solid #ccc; padding:10px; margin:0;}
	
	.deleteProduct{position:absolute; right:0px; margin-right:1em;}
</style>

<script src = "/resources/include/js/daumAddr.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">
	var totalPrice = 0;
	var discountPrice = 0;
	var orderPrice = 0;
	var itemCnt = 0;
	
	$(function(){
		alert("hihihihi");
		// 주소 검색
		$("#go").click(function(){
			daumAddr();
		});
		
		//상품 삭제
		$(".deleteProduct").css("cursor", "pointer");
		$(".deleteProduct").click(function(){
			$(this).parents(".preview").remove();
			totalPrice = 0;
			discountPrice = 0;
			orderPrice = 0;
			orderPriceCal()
		});
		
		
		//주문자 정보 입력
		var telContainer = "${memberInfo.m_tel}";
		var emailContainer = "${memberInfo.m_email}";
		var addrContainer = "${memberInfo.m_addr}";
		var tels = telContainer.split("-");
		var emails = emailContainer.split("@");
		var addrs = addrContainer.split("#!@@!#");
		$(".m_name").val("${memberInfo.m_name}");
		$(".m_tel1").val(tels[0]);
		$(".m_tel2").val(tels[1]);
		$(".m_tel3").val(tels[2]);
		$("#m_email1").val(emails[0]);
		$("#m_email2").val(emails[1]);
		
		$("input[name='userChk']").change(function(){
			if($(this).val() == 'y'){
				$("#m_addr1").val(addrs[0]);
				$("#m_addr2").val(addrs[1]);
				$("#m_addr3").val(addrs[2]);
			}else if($(this).val() == 'n'){
				$("#m_addr1").val("");
				$("#m_addr2").val("");
				$("#m_addr3").val("");
			}
		});
		orderPriceCal();
	})
	
	function orderPriceCal(){
		//상품 등록 갯수 확인
		itemCnt = $('.orderContainer').length;
		console.log(itemCnt);
		
		for(var i=0; i<itemCnt; i++){
			var itemPrice = $('.orderContainer').eq(i).find('.orderDesc ul > li').eq(3).find("span").text();
			var itemDiscount = $('.orderContainer').eq(i).find('.orderDesc ul > li').eq(4).find("span").text();
			totalPrice += parseInt(itemPrice);
			discountPrice += (parseInt(itemPrice) * parseInt(itemDiscount) / 100);
		} 
		orderPrice = totalPrice - discountPrice;
		$(".w100").eq(0).find("div").eq(1).text(totalPrice+"원");
		$(".w100").eq(1).find("div").eq(1).text(discountPrice+"원");
		$(".w100").eq(2).find("p").text(orderPrice+"원");
		console.log(itemPrice+"-"+itemDiscount);
		console.log(totalPrice+"-"+discountPrice+"="+orderPrice);
	}
</script>

<div class="content">
	<div class="orderInfo">
		<h2 id = "aTitle">주문</h2>
		<!-- <div class = "step-panels"> -->
			<div class="stepContainer">
				<div class="step">
					<span>장바구니</span>
				</div>
				<div class="step action">
					<span>주문 작성/결제</span>
				</div>
				<div class="step">
					<span>주문완료</span>
				</div>
			</div>
		<!-- </div> -->
		<h4 class="bold">주문 상품 확인</h4>
		<!-- orderList repeat area start-->
		<c:choose>
			<c:when test="${not empty orderList}">
				<c:forEach var="orderList" items="${orderList}">
				<c:if test="${orderList.pno}"></c:if>
				<div class="preview col-md-12">
					<div class="orderContainer">
						<div class="orderImg">
							<a href="/detail?no=${orderList.p_no}">
								<img src="/productUpload/${orderList.pi_file}" />
							</a>
						</div>
						<div class="orderDesc">
							<h5>${orderList.p_name}</h5>
							<ul>
								<li>${orderList.p_info}</li>
								<li><label>SIZE: </label><span>${orderList.size}</span></li>
								<li><label>COLOR: </label><span>${orderList.color}</span></li>
								<li><label>PRICE: </label><span>${orderList.p_price}</span></li>
								<li><label>DISCOUNT: </label><span>${orderList.p_discount}%</span></li>
								<li><label>SHIPPING: </label>0원</li>
							</ul>
						</div>
						<div class="deleteProduct">
							<span class="fa fa-window-close" aria-hidden="true"></span>
						</div>
					</div>
				</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div>주문 목록이 없습니다.</div>
			</c:otherwise>
		</c:choose>
		<!-- orderList repeat area end-->
	</div>
	<div class="priceInfo">
		<h4 class="bold">결제 정보</h4>
		<div class="priceDetail floatL">
			<div class="priceTitle">주문 합계 금액</div>
			<div class="w100">
				<div>상품금액</div>
				<div>   </div>
				<!-- <div>배송료</div>
				<div>0원</div> -->
			</div>
		</div>
		<div class="priceDetail floatL">
			<div class="priceTitle">할인 금액 합계</div>
			<div class="w100">
				<div>할인금액</div>
				<div></div>
				<!-- <div>추가할인</div>
				<div>0원</div> -->
			</div>
		</div>
		<div class="priceDetail floatL">
			<div class="priceTitle">최종 결제 금액</div>
			<div class="w100">
				<p>야옹야옹</p>
			</div>
		</div>
	</div>
	<div class="userInfo">
		<h4 class="bold">주문 고객 정보</h4>
		<div>
			<label for="m_name">주문자</label>
			<input type="text" name="m_name" class="m_name" readonly>
		</div>
		<div>
			<label for="m_tel">연락처</label>
			<input type="text" name="m_tel1" class="m_tel1" readonly>
			<input type="text" name="m_tel2" class="m_tel2" readonly>
			<input type="text" name="m_tel3" class="m_tel3" readonly>
		</div>
		<div>
			<label for="m_name">메일주소</label>
			<input type="text" name="m_email1" id="m_email1">@
			<input type="text" name="m_email2" id="m_email2">
		</div>
	</div>
	<form name="orderForm" id="orderForm">
		<div class="userDetail">
			<h4 class="bold">배송 정보</h4>
			<div>
				<input type="radio" name="userChk" class="userChk" value="y"><label>주문자와 동일</label>
				<input type="radio" name="userChk" class="userChk" value="n"><label>새로입력</label>
			</div>
			<div>
				<label for="m_name">주문자</label>
				<input type="text" name="m_name" class="m_name" readonly>
			</div>
			<!-- address -->
			<span class = "array" id = "forAddr">주소</span>
			<div id = "forAdress">
				<span id = "daumApi">
					<input type = "text" id = "m_addr1" name = "m_addr1" readonly="readonly">
					<input type = "button" id = "go" name = "go" value = "주소 검색">
					<span id = "addrChkMsg1"></span>
				</span>
				<input type = "text" width="500px" id = "m_addr2" name = "m_addr2" readonly="readonly">
				<input type = "text" width="500px" id = "m_addr3" name = "m_addr3">
				<span id = "addrChkMsg2"></span>
			</div>
			<!-- address -->
			<div>
				<label for="m_tel">연락처</label>
				<input type="text" name="m_tel1" class="m_tel1" readonly>
				<input type="text" name="m_tel2" class="m_tel2" readonly>
				<input type="text" name="m_tel3" class="m_tel3" readonly>
			</div>
		</div>
		<div class="creditInfo">
			<h4 class="bold">결제방법 선택</h4>
			<div>
				<input type="radio" name="o_mode"><label>신용카드</label>
				<input type="radio" name="o_mode"><label>계좌이체</label>
				<input type="radio" name="o_mode"><label>무통장입금</label>
			</div>
		</div>
	</form>
	<div class="btnContainer">
		<input type="button" name="order" id="order" value="주문">
		<input type="button" name="cancel" id="cancel" value="취소">
	</div>
</div>
