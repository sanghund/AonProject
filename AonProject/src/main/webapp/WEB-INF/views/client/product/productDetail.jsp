<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="0" var="iSize" scope="page" />
<c:forEach var="commonCodeList" items="${commonCodeList}">
	<c:if test="${commonCodeList.cc_group eq 'size' && commonCodeList.cc_name ne 'F'}">
			<c:set value="${iSize + 1 }" var="iSize" scope="page" />				
		</c:if>

</c:forEach>
<style>
	.width40 {width:40%;}
	.content {width:100%;}
	.imgContainer {float:left; margin-right:2%; margin-bottom:2em; border-right:1px solid #dedede;}
	.imgContainer img {margin:0 auto; display:block;}
	.itemOption {float:left;}
		.itemOption form > h3 {font-size:1.4rem; padding:0 0 10px 0; border-bottom:1px solid #e1e1e1;}
	.productImg {width:82%; clear:both;}
	.productImg img {margin:10px auto; display:block;}
	
	.orderDetail {margin:2rem 0 1rem 0; border-bottom:1px solid #e1e1e1;}
	td {height:2rem;}
	
	.discountPrice {color:red;}
</style>
<script type="text/javascript">
	var totalCnt = 1;
	var discountPrice = "${productDetail.p_price}" * ("${productDetail.p_discount}" / 100);
	var resultPrice = "${productDetail.p_price}" - discountPrice;
	var totalPrice = resultPrice;
	var i = "<c:out value = '${iSize}'/>";
	
	$(function(){
		$(".discountPrice").text(resultPrice);
		$("#size").change(function(){
			if($("#size").val()!=""){
				var orderOption = $("<tr>");
				var td = $("<td>");
				var orderCnt = $("<td><input class='cnt' type='number' value='1'><input type='hidden' class='arrayP_no'><input type='button' class='cntUp' value='+'><input type='button' class='cntDown' value='-'></td>");
				
				orderOption.html("<td class='orderChk'>${productDetail.color}"+$("#size option:selected").html()+"</td>");
				td.append(orderCnt)
				orderOption.append(td);
				totalCount()
				
				var temp = $("#size option:selected").html(); 
				console.log("selected option: "+temp);
				
				var eachResult = true;
				$(".orderChk").each(function(){
					console.log("each:"+temp);
					console.log("charAt:"+($(this).html().charAt($(this).html().length -1)));
					if(temp == ($(this).html().charAt($(this).html().length -1))){
						eachResult = false;
						return;
					}
				})
				if(!eachResult) return;
				$(".orderDetail").after(orderOption);
				$(".orderBtnContainer").prepend(orderPrice);
				
			}
		})
		
		//선택상품  수량 증가
		$(document).on("click", ".cntUp", function(){
			var cntInput = $(this).parent().find(".cnt");
			var addCnt = parseInt(cntInput.val()) + 1;
			cntInput.val(addCnt);
			totalCount();
			//totalPrice = (resultPrice * (addCnt));
			console.log(totalPrice);
			//$("#price").html("총 주문액<br>"+totalPrice+"원")
		});
		
		//선택상품  수량 감소
		$(document).on("click", ".cntDown", function(){
			var cntInput = $(this).parent().find(".cnt");
			if(parseInt(cntInput.val())>0) {
				var addCnt = parseInt(cntInput.val()) - 1;
				cntInput.val(addCnt);
				totalCount();
			}else if(parseInt(cntInput.val())<=1){
				alert("수량은 1보다 작아질 수 없습니다.");
				cntInput.val(1);
				totalCount();
			}
			//totalPrice = (resultPrice * (addCnt));
			console.log(totalPrice);
			//$("#price").html("총 주문액<br>"+totalPrice+"원")
			
		});
		
		var orderPrice = $("<div id='price'>");
		orderPrice.css("margin", "1em 0");
		orderPrice.html("총 주문액<br>")
		orderPrice.append(totalPrice+"원");
		
		//구매버튼 클릭 처리 이벤트
		$("#order").click(function(){
			for(var j = 0; j < i; j++){
				$(".cnt").eq(j).attr("name", "o_cnt[" + j + "]");
				$(".arrayP_no").eq(j).attr("name", "p_no[" + j + "]");
			};
			
			$("#orderForm").attr({
				"method" : "post",
				"action" : "/order/order"
			});
			$("#order").submit();
		});
		
		//장바구니 클릭 처리 이벤트
		$("#cart").click(function(){
			
			$("#orderForm").attr({
				"method" : "post",
				"action" : "/order/wish"
			});
			$("#order").submit();
		});
		
	})
	//총 상품 수량 연산
	function totalCount(){
		var temp = 0;
		for(var i=0; i<$(".cnt").size(); i++){
			temp += parseInt(($(".cnt:eq("+i+")").val()));
		}
		console.log(temp);
		totalPrice = resultPrice * temp;
		$("#price").html("총 주문액<br>"+totalPrice+"원")
		//console.log(totalCnt);
	}
</script>

<%-- <div class="menuTit">
	<c:choose>
		<c:when test="${not empty categorySelect}">
			<c:forEach var="categorySelect" items="${categorySelect}">
				<p>${categorySelect.ca_name}</p>
			</c:forEach>		
		</c:when>
	</c:choose>
</div> --%>
<div class="content">
	<div class="imgContainer width40">
		<c:forEach var="uploadList" begin="0" end="0" items="${uploadList}">
			<img src="/productUpload/${uploadList.pi_file}" />
		</c:forEach>
	</div>
	<div class="itemOption width40">
		<form name="orderForm" id="orderForm">
			<input type="hidden" name="p_no">
			<input type="hidden" name="o_cnt">
		</form>	
		<h3>${productDetail.p_name}</h3>
		<table class="orderDetail">
			<tbody>
				<tr>
					<td>PRODUCT NUMBER</td>
					<td>${productDetail.p_no}</td>
				</tr>
				<tr>
					<td>CONSUMER PRICE</td>
					<td>${productDetail.p_price}원</td>
				</tr>
				<c:if test="${productDetail.p_discount ne 0}">
					<tr>
						<td>DISCOUNT PRICE</td>
						<td><span class="discountPrice"></span>원</td>
					</tr>
				</c:if>
				<tr>
					<td>COLOR</td>
					<td>
						<c:forEach items="${commonCodeList}"  varStatus="status">
							<c:if test="${commonCodeList[status.index].cc_no eq productDetail.color_code}">
								${commonCodeList[status.index].cc_name}
							</c:if>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td>size</td>
					<td>
						<select name="size" id="size">
							<option value="">사이즈선택</option>
							<c:forEach var="commonCodeList" items="${commonCodeList}">
								<c:if test="${commonCodeList.cc_group eq 'size' && commonCodeList.cc_name ne 'F'}">
									<c:set value="${iSize + 1 }" var="iSize" scope="page" />
									<option value="${commonCodeList.cc_no}" class="temp">${commonCodeList.cc_name}</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
				</tr>
			</tbody>
		</table>
		<table class="orderInfo">
		</table>
		<div class="orderBtnContainer">
			<input type="button" id="order" value="구매하기">
			<input type="button" id="cart" value="장바구니">
		</div>
		
	</div>
	<div class="productImg">
		<c:forEach var="uploadList" begin="1" items="${uploadList}">
			<img src="/productUpload/${uploadList.pi_file}" />
		</c:forEach>
	</div>
		
</div>
