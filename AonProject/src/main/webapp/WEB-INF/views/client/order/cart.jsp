<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			width : 33%;
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
		
		#cart{
			margin-top : 50px;
			clear: both;
		}
		#cart dt{
			float: left;
		}
		.showLow{
			border: 1px solid lightgray;
			border-bottom: none;
			padding: 15px;
			min-height: 150px;
	
		}
		
		.showLow dt{
			margin-right: 15px;
			
		}
		
		.aimg{
			display: inline-block;
			width: 150px;
			height: 150px;
		}
		.showImg{	
			width : 100%;
			height : 100%;
			display: inline-block;
			
		}
		#cart{
			font-size: 15px;
		}
		.lowTop{
			margin-bottom: 10px;
		}
		.lowCenter{
			margin-bottom: 10px;
			border: 1px solid gray;
			display: inline-block;
		}
		.lowCenter > *{
			border-bottom: 1px solid gray;
		}
		.lowCenter > *:LAST-CHILD{
			border-bottom: none;
		}
		.lowBottom .prices span{
			color: gray;
			text-decoration: line-through;
			margin-bottom: 5px;
		}
		.lowBottom .rowPrice{
			font-weight: bold;
		}
		.btnGroup{
			display : inline-block;
			text-align : center;
			width: 100%;
		}
		.abtns{
			text-decoration: none;
			color : white;
			background-color: gray;
			font-size : 20px;
			padding : 15px 0;
			width : 33.199999999999%;
			display: inline-block;
		}
		.abtns:FIRST-CHILD{
			border-right: 1px solid white;
		}
		.abtns:LAST-CHILD{
			border-left: 1px solid white;

		}
		.calculation{
			margin-top: 30px;	
		}
		.calculation table{
			width: 100%;
			border-collapse: collapse;
		}
		.calculation table tr{
			text-align: center;
			border: 1px solid lightgray;
		}
		.calculation table td{
			padding : 15px;
			border: 1px solid lightgray;
		}
		.pageBtn{
			margin-top: 30px;
			margin-bottom: 50px;
			width: 100%;
			text-align: center;
		}
		.pageBtn > input{
			border : 1px solid gray;
			background-color : black;
			color : white;
			font-size: 15px;
			padding: 15px;
			width: 150px;
			text-align: center;
			cursor : pointer;
		}
		
		.pageBtn2{
			text-align : center;
			margin-top: 30px;
			margin-bottom: 50px;
			width: 100%;
			text-align: center;
		}
		
		.pageBtn2 > input{
			border : 1px solid gray;
			background-color : white;
			color : black;
			font-size: 15px;
			padding: 15px;
			width: 150px;
			text-align: center;
			cursor : pointer;
		}
		
		.pageBtn > input:FIRST-CHILD {
			background-color : white;
			color : black;	
			margin-left: 10px;
		}
		
		.miniTitle{
			font-size: 12px;
		}
		.totlaTitle{
			font-size: 18px;
			color : red;
		}
		.totlaTitle:FIRST-CHILD {
			color: black;
		}
		.rowDiscount{
			display: inline-block;
			background: #337ab7;
			color : white !important;
			margin-left: 8px;
	
		}
		.nullView{
			margin: 30px 0;
			width: 100%;
			text-align: center;
			font-size: 24px;
			border: 1px solid lightgray;
			padding: 150px 0;
		}
		.names{
			font-size : 20px;
			font-weight: bold;
		}
		#totalName{
			color : gray;
		};
		
</style>
<script src = "/resources/include/js/jquery-1.12.4.min.js"></script>
<div class = "main">
	<div id = "showList">
		<h2 id = "aTitle">Order</h2>
		<div class = "step-panels">
			<div id = "align">
				<div class = "step action">
					<span>장바구니</span>
				</div>
				<div class = "step">
					<span>주문 작성/결제</span>
				</div>
				<div class = "step">
					<span>주문완료</span>
				</div>
			</div>
		</div>
		<c:if test="${not empty cartShow }">
				<form id = "cart">	
				<c:forEach items="${cartShow }" varStatus="status">
					<c:set var="p_no" scope="page" value="${cartShow[status.index].p_no }"/>
					<c:set var="flag" value="true"/>
					<c:forEach begin="0" step="1" end="${status.index }" var="chk">
						<c:if test="${flag eq true}">
							<c:if test="${chk ne status.index}">
								<c:if test="${cartShow[status.index].p_no eq cartShow[chk].p_no }">
									<c:set var="flag" value="false"/>
									<c:set var = "price" value="${cartShow[status.index].p_price * cartShow[status.index].o_cnt - (cartShow[status.index].p_price * cartShow[status.index].p_discount / 100 * cartShow[status.index].o_cnt)}" />
									<c:set var = "discount" value="${cartShow[status.index].p_price * cartShow[status.index].p_discount / 100 * cartShow[status.index].o_cnt }" />		
									
									<script type = "text/javascript">
										$(document).ready(function(){
											$("#${cartShow[status.index].p_no}").find(".lowCenter").append('<div class = "centerLow" data-price = "${cartShow[status.index].p_price }" data-discount = "${cartShow[status.index].p_discount }"><input type = "checkbox" id = "checkBox${status.index }" class = "checkBoxs" value="${cartShow[status.index].p_no}${cartShow[status.index].size_code}"><label for = "checkBox${status.index }"><span data-color = "${cartShow[status.index].color_code }" data-size = "${cartShow[status.index].size_code }">색상 : ${cartShow[status.index].p_color } / 사이즈 : ${cartShow[status.index].p_size } / ${cartShow[status.index].o_cnt }개</span></label></div>')});
											var price = $("#${cartShow[status.index].p_no}").find(".lowBottom").find(".rowPrice").text();
											var discount = $("#${cartShow[status.index].p_no}").find(".lowBottom").find(".rowDiscount").text();
											var newPrice = <fmt:parseNumber integerOnly="true" value="${price}"/>;
											var newDiscount = -<fmt:parseNumber integerOnly="true" value="${discount}"/>;
							
											var addPrice = (price * 1) + newPrice;
											var addDiscount = (discount * 1) + newDiscount;
											var sum = addPrice - addDiscount;
											$("#${cartShow[status.index].p_no}").find(".lowBottom").find(".prices span").html(sum);
											$("#${cartShow[status.index].p_no}").find(".lowBottom").find(".rowPrice").html(addPrice);
											$("#${cartShow[status.index].p_no}").find(".lowBottom").find(".rowDiscount").html(addDiscount);
									</script>
								</c:if>
							</c:if>
						</c:if>
					</c:forEach>
					<c:if test="${flag eq true}">
						 <dl id = "${cartShow[status.index].p_no}" class = "showLow">
							<dt class = "imgDT">
								<a class= "aimg" href="/detail?no=${cartShow[status.index].p_no }">
									<img class = "showImg" src="/productUpload/${cartShow[status.index].pi_file }" />
								</a>
							</dt>
							<dd class = "lowTop">
								<div>
									<span class = "names">${cartShow[status.index].p_name }</span>
								</div>
								<div>
									<span class= "numbers">${cartShow[status.index].p_no }</span>
									<span class= "types">(${cartShow[status.index].p_type })</span>
								</div>
							</dd>
							<dd class = "lowCenter">
								<div class = "centerLow" data-price = "${cartShow[status.index].p_price }" data-discount = "${cartShow[status.index].p_discount }">
									<input type = "checkbox" id = "checkBox${status.index }" class = "checkBoxs" value="${cartShow[status.index].p_no}${cartShow[status.index].size_code}"><label for = "checkBox${status.index }"><span data-color = "${cartShow[status.index].color_code }" data-size = "${cartShow[status.index].size_code }">색상 : ${cartShow[status.index].p_color } / 사이즈 : ${cartShow[status.index].p_size } / ${cartShow[status.index].o_cnt }개</span></label>
								</div>
							</dd>
							<dd class = "lowBottom">
								<div class = "prices">
									상품 금액 : <span><c:out value="${cartShow[status.index].p_price * cartShow[status.index].o_cnt}"/></span>원
								</div>
								<div class = "discounts">
									<c:set var = "price" value="${cartShow[status.index].p_price * cartShow[status.index].o_cnt - (cartShow[status.index].p_price * cartShow[status.index].p_discount / 100 * cartShow[status.index].o_cnt)}" />
									<c:set var = "discount" value="${cartShow[status.index].p_price * cartShow[status.index].p_discount / 100 * cartShow[status.index].o_cnt }" />
									할인 금액 : <span class = "rowPrice"><fmt:parseNumber integerOnly="true" value="${price}"/></span>원<span class= "rowDiscount">-<fmt:parseNumber value="${discount}" integerOnly="true"/></span>
								</div>
							</dd>
						</dl>
					</c:if>	
				</c:forEach>	
			</form>
			<div class = "btnGroup">
				<a href="#" class= "abtns" id = "allc">전체 선택</a><a id = "allnc" href="#" class= "abtns">전체 해체</a><a id = "checkedD" href="#" class= "abtns">선택 삭제</a>
			</div>	
		</c:if>
	</div>
	<c:if test="${not empty cartShow }">
		<div class = "calculation">	
			<table id = "showTotal">
				<tr id = "totalName">
					<td>
						<div class = "miniTitle">주문 합계 금액</div>
						<div class = "totlaTitle"></div>	
					</td>
					<td>
						<div class = "miniTitle">할인 금액 합계</div>
						<div class = "totlaTitle"></div>
					</td>
					<td>
						<div class = "miniTitle">최종 결제 금액</div>
						<div class = "totlaTitle"></div>
					</td>
				</tr>
				<tr id = "totalPriceView">
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
		<div class = "pageBtn">
			<input type = "button" id = "goPage" value="쇼핑 계속하기">
			<input type = "button" id = "goOrder" value="다음 단계">
		</div>
	</c:if>
	<c:if test="${empty cartShow }">
		<dl>
			<dd class= "nullView">장바구니에 주문하실 상품을 담아주세요.</dd>
		</dl>
		<div class = "pageBtn2">
			<input type = "button" id = "nullBtn" value="쇼핑 계속하기">
		</div>
	</c:if>
</div>
<script type = "text/javascript">
	$(document).ready(function(){
		$(".showLow").last().css("border", "1px solid lightgray");
		
		var url = "<c:out value='${goodNo}'/>";
		
		var forShowTotal = $(".showLow").length;
		
		var t1 = 0, t2 = 0, t3 = 0;
		for(var i = 0; i < forShowTotal; i++){
			t1 += ($(".showLow").eq(i).find(".prices span").text()) * 1;
			t2 += ($(".showLow").eq(i).find(".rowPrice").text()) * 1;
			t3 += ($(".showLow").eq(i).find(".rowDiscount").text()) * 1;
		}
		
		$("#totalPriceView td").eq(0).html(t1);
		$("#totalPriceView td").eq(1).html(t2);
		$("#totalPriceView td").eq(2).html(t3);
		
		$("#totalPriceView td").css("color", "red");
		$("#totalPriceView td").css("font-weight", "bold");
		$("#nullBtn").click(function(){
			if(url != ""){
				location.href = "/detail?no="+url;
			}
			else{
				location.href = "/";
			}
		});
		
		$("#goPage").click(function(){
			if(url != ""){
				location.href = "/detail?no="+url;
			}
			else{
				location.href = "/";
			}
		});
		
		$("#goOrder").click(function(){
			var hiddenLoop = '<c:out value = "${fn:length(cartShow)}" />'
			
			for(var i = 0; i < hiddenLoop; i++){
				$("#cart").append("<input type = 'hidden' class = 'p_nos' name = 'p_nos["+i+"]' value = '${cartShow[fn:length(i)].p_no}${cartShow[fn:length(i)].size_code}'>");
				$("#cart").append("<input type = 'hidden' class = 'p_nos' name = 'o_cnts["+i+"]' value = '${cartShow[fn:length(i)].o_cnt}'>")
			}
			
			$("#cart").attr({
				"method" : "post",
				"action" : "/order/order"
			});
			
			$("#cart").submit();
		});
		
		$(".abtns").click(function(event){
			event.preventDefault();
			var btnId = $(this).attr("id");
			if(btnId == "allc"){
				$(".checkBoxs").click();
			}
			else if(btnId == "allnc"){
				$(".checkBoxs").removeAttr("checked");
			}
			else if(btnId == "checkedD"){
				var cleng = $(".checkBoxs:checked").length;
				for(var j = 0; j < cleng; j++){
					$(".checkBoxs:checked").attr("name", "cd["+j+"]");
				}
				$("#cart").attr({
					"action" : "/order/cartD",
					"method" : "post"
				});
				$("#cart").submit();
			};
		});
	});
</script>