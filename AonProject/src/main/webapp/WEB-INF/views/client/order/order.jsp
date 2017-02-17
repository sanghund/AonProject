<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" type="text/css" href="/resources/include/css/font-awesome.min.css">

<style>
#aTitle {
			font-size: 25px;
			padding : 10px 0;
			padding-left : 5px;
			border : 1px solid graytext;
			display: block;
			border-bottom: 1px solid #73879C;
			margin-bottom: 15px;
		}
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
	
	/* .orderDesc {float:left;} */
	.orderDesc > ul {padding-top:0.1em;}
	.orderDesc > ul li {margin:0.4em 0;}
	.orderDesc > ul li:first-child {margin-bottom:0.8em;}
	.orderDesc > ul li label {width:84px; display:block; float:left; color:#888;}
	
	.priceDetail {width:33%;}
	
	.creditInfo {margin:1em 0; padding:0 20px;}
	
	.w100 {width:100%;}
	.w100 > div {width:50%; float:left; padding:10px 0; text-align:center; height:38px; border-top:1px solid #ccc; box-sizing:border-box;}
	.w100 > div:nth-child(odd) {border-right:1px solid #ccc;}
	.w100 > p {height:17px; text-align:center; border-top:1px solid #ccc; padding:10px; margin:0;}
	
	.deleteProduct{position:absolute; right:0px; margin:-0.4em 0.4em;}
	
	.sizeAdd {width:1em; display:inline-block; padding:0 0.3em; border-right:1px solid #9a9a9a;}
	.sizeAdd:last-child {border-right:0;}
	.cntAdd {width:1em; display:inline-block; padding:0 0.3em; border-right:1px solid #9a9a9a;}
	.cntAdd:last-child {border-right:0;}
	
	.none {display:none;}
	
	.userInfo > div, .userDetail > div {margin-bottom:1em;}
	.userInfo > div > label {width:90px; display:inline-block;}
	.userDetail > div > label {width:90px; display:inline-block;}
	.userDetail > div > .array {float:left; line-height:26px; width:95px;}
	
	#a_addr2 {width:270px;}
	
	input[type='text'] {height:22px;}
	.btnContainer {width:100%; text-align:center;}
</style>

<div class="content">
	<div class="orderInfo">
		<h2 id = "aTitle">Order</h2>
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
		<h4 class="bold">주문 상품 확인</h4>
		<!-- orderList repeat area start-->
		<c:choose>
			<c:when test="${not empty orderList}">
				<c:forEach varStatus="status" items="${orderList}">
					<c:set var="flag" value="true" />
					<c:forEach var="chk" begin="0" end="${status.index}" step="1">
						<c:if test="${flag eq true}">
							<c:if test="${chk ne status.index}">
								<c:if test="${orderList[status.index].p_no eq orderList[chk].p_no}">
									<c:set var="flag" value="false"/>
									<script type="text/javascript">
										$(document).ready(function(){											
											var sizeAdd = $("<span>");
											sizeAdd.addClass("sizeAdd");
											sizeAdd.html("${orderList[status.index].size}");
											
											$("."+"${orderList[status.index].p_no} > ul li").eq(1).append(sizeAdd);
											
											var sizeCodeAdd = $("<span class='none'>");
											sizeCodeAdd.addClass("sizeCodeAdd");
											sizeCodeAdd.html("${fn:toUpperCase(orderList[status.index].size_code)}");
											$("."+"${orderList[status.index].p_no} > ul li").eq(6).append(sizeCodeAdd);
											
											var cntAdd = $("<span>");
											cntAdd.addClass("cntAdd");
											cntAdd.html("${orderList[status.index].o_cnt}");
	
											$("."+"${orderList[status.index].p_no} > ul li").eq(2).append(cntAdd);
										})
									</script>
								</c:if>
							</c:if>
						</c:if>
					</c:forEach>
					<c:if test="${flag eq true}">
						<c:forEach var="chk" begin="0" end="${status.index}" step="1">
							<c:if test="${orderList[status.index].p_no eq orderList[chk].p_no}">
								
							</c:if>
						</c:forEach>
						
						<div class="preview">
							<div class="orderContainer">
								<div class="orderImg">
									<a href="/detail?no=${orderList[status.index].p_no}">
										<img src="/productUpload/${orderList[status.index].pi_file}" />
									</a>
								</div>
								<div class="orderDesc ${orderList[status.index].p_no}">
									<h5>${orderList[status.index].p_name}</h5>
									<span class="none">${orderList[status.index].p_no}</span>
									<ul>
										<li>${orderList[status.index].p_info}</li>
										<li><label>SIZE: </label><span class="sizeAdd">${orderList[status.index].size}</span></li>
										<li><label>COUNT: </label><span class="cntAdd">${orderList[status.index].o_cnt}</span></li>
										<li><label>COLOR: </label><span>${orderList[status.index].color}</span></li>
										<li><label>PRICE: </label><span>${orderList[status.index].p_price}</span></li>
										<li><label>DISCOUNT: </label><span>${orderList[status.index].p_discount}%</span></li>
										<li class="none"><span class="none sizeCodeAdd">${fn:toUpperCase(orderList[status.index].size_code)}</span></li>
									</ul>
								</div>
								<div class="deleteProduct">
									<span class="fa fa-window-close" aria-hidden="true"></span>
								</div>
							</div>
						</div>
					</c:if>
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
				<div></div>
			</div>
		</div>
		<div class="priceDetail floatL">
			<div class="priceTitle">할인 금액 합계</div>
			<div class="w100">
				<div>할인금액</div>
				<div></div>
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
	<!-- form1 -->
	<form name="orderForm" id="orderForm">
		<div class="hidden none">
			<c:if test="${not empty mode }">
				<input type = "hidden" id = "mode" name ="mode" value="${mode}">
			</c:if>
			<input type="hidden" name="m_addr" id="m_addr">
			<input type="hidden" name="o_mode" id="o_mode">
			<input type="hidden" name="o_confirm" id="o_confirm">
			<input type="hidden" name="o_price" id="o_price">
			<input type="hidden" name="addrChk" id="addrChk">
		</div>
	</form>
	<!-- form1 -->
	<div class="userDetail">
		<h4 class="bold">배송 정보</h4>
		<div>
			<input type="radio" name="addrChkM" class="addrChkM" value="y" checked="checked"><label>주문자와 동일</label>
			<input type="radio" name="addrChkM" class="addrChkM" value="n"><label>새로입력</label>
		</div>
		<div>
			<label for="m_name">주문자</label>
			<input type="text" name="m_name" class="m_name" readonly>
		</div>
		<!-- address -->
		<div>
			<label class = "array" id = "forAddr">주소</label>
			<div id = "forAdress">
				<span id = "daumApi">
					<input type = "text" id = "a_addr1" name = "a_addr1" readonly="readonly">
					<input type = "button" id = "go" name = "go" class="btn btn-dark btn-sm" value = "주소 검색">
					<span id = "addrChkMsg1"></span>
				</span>
				<input type = "text" id = "a_addr2" name = "a_addr2" readonly="readonly">
				<input type = "text" id = "a_addr3" name = "a_addr3">
				<span id = "addrChkMsg2"></span>
			</div>
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
			<input type="radio" name="o_modes" class="o_modes" value="credit"><label>신용카드</label>
			<input type="radio" name="o_modes" class="o_modes" value="banking"><label>계좌이체</label>
			<input type="radio" name="o_modes" class="o_modes" value="noaccount"><label>무통장입금</label>
		</div>
	</div>
	<div class="btnContainer">
		<input type="button" name="order" id="order" class="btn btn-dark" value="주문">
		<input type="button" name="cancel" id="cancel" class="btn btn-default" value="취소">
	</div>
</div>

<script src = "/resources/include/js/daumAddr.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	var pnoCnt = 0;
	var totalPrice = 0;
	var discountPrice = 0;
	var orderPrice = 0;
	var itemCnt = 0;
	var cntSum = 0;
	var omg = "#!@@!#";
	var cnt = 0;
	
	$(function(){
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
		$("#a_addr1").val(addrs[0]);
		$("#a_addr2").val(addrs[1]);
		$("#a_addr3").val(addrs[2]);
		//default add member address add btn disabled
		$("#go").prop("disabled", true);
		
		$("input[name='addrChkM']").change(function(){
			if($(this).val() == 'y'){
				$("#a_addr1").val(addrs[0]);
				$("#a_addr2").val(addrs[1]);
				$("#a_addr3").val(addrs[2]);
				$("#go").prop("disabled", true);
			}else if($(this).val() == 'n'){
				$("#a_addr1").val("");
				$("#a_addr2").val("");
				$("#a_addr3").val("");
				$("#go").prop("disabled", false);
			}
		});
		orderPriceCal();
		
		//order cancel
		$("#cancel").click(function(){
			history.go(-1);
		})
	})

	
	//전송 버튼 이벤트
	$(document).ready(function(){
		$("#order").click(function(){
			var productCnt = $(".preview").length;
			if(productCnt < 1){
				alert("주문 상품이 없습니다.");
				return;
			}
			if($("input[name='o_modes']:checked").val() == "" || $("input[name='o_modes']:checked").val() == null){
				alert("결제방법을 선택해 주세요");
				return;
			}
			var info = false;
			if(info == false){
				makeHidden();
				var o_mode = $("input[name='o_modes']:checked").val();
				$("#o_mode").val(o_mode);
				if(o_mode != 'noaccount'){
					$("#o_confirm").val("Y");
				}else if(o_mode == 'noaccount'){
					$("#o_confirm").val("N");
				}
				$("#o_price").val(orderPrice);
				
				var addr = $("#a_addr1").val()+omg+$("#a_addr2").val()+omg+$("#a_addr3").val();
				var addrChk = $("input[name='addrChkM']:checked").val();
				$("#addrChk").val(addrChk);
				
				$("#m_addr").val(addr);
				info = true;
			}
			
			if(info == true){
				$("#orderForm").attr({
					"method" : "post",
					"action" : "/order/orderResult"
				})
				$("#orderForm").submit();
			}
		});
		
	});
	
	
	//상품번호 수량 생성
	function makeHidden(){
		var orderListLength = "${fn:length(orderList)}";
		
		for(var i=0; i<orderListLength; i++){
			var targetSpan = $(".orderContainer").eq(i).find("ul li").eq(2).find("span")
			var targetSpanP = $(".orderContainer").eq(i).children(".orderDesc").children("span")
			var targetSpanNo = $(".orderContainer").eq(i).find("ul li").eq(6).find(".sizeCodeAdd")
			var len = targetSpan.length;
			var arrPno = new Array();
			var arrCnt = new Array();

			for(var j=0; j<len; j++){
				var p = targetSpanP.text();
				var no = targetSpanNo.eq(j).text();
				
				arrPno = p+no;
				var inputPno = $("<input type='hidden' name='p_nos["+cnt+"]'>")
				inputPno.val(arrPno);
				
				arrCnt = targetSpan.eq(j).text();
				var inputCnt = $("<input type='hidden' name='o_cnts["+cnt+"]'>")
				inputCnt.val(arrCnt);
				cnt++;
				$(".hidden").append(inputCnt).append(inputPno);
			}
		}
	}
	
	//상품 가격 연산
	function orderPriceCal(){
		var totalPrice = 0;
		var sumTotal = 0;
		//상품 등록 갯수 확인
		itemCnt = $('.orderContainer').length;
		
		console.log("itemCnt: "+itemCnt);
		
		for(var i=0; i<itemCnt; i++){
			var itemPrice = $('.orderContainer').eq(i).find('.orderDesc ul > li').eq(4).find("span").text();
			var itemDiscount = $('.orderContainer').eq(i).find('.orderDesc ul > li').eq(5).find("span").text();
			var productCnt = $('.orderContainer').eq(i).find(".cntAdd").length;
			
			cntSum = 0;
			for(var j=0; j<productCnt; j++){
				cntSum += ($('.orderContainer').eq(i).find(".cntAdd").eq(j).text())*1;
				totalPrice = parseInt(itemPrice) * cntSum;
			} 
			sumTotal += totalPrice;
			
			discountPrice += ((parseInt(itemPrice) * parseInt(itemDiscount) / 100) * productCnt);
		} 
		orderPrice = sumTotal - discountPrice;
		$(".w100").eq(0).find("div").eq(1).text(sumTotal+"원");
		$(".w100").eq(1).find("div").eq(1).text(discountPrice+"원");
		$(".w100").eq(2).find("p").text(orderPrice+"원");
	}
</script>