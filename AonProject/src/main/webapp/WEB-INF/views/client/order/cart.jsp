<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style type = "text/css">
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
			margin : 50px 0;
			clear: both;
		}
		#cart dt{
			float: left;
		}
		.showImg{
			width: 150px;
			height: 150px;
		}
</style>
<script src = "/resources/include/js/jquery-1.12.4.min.js"></script>
<div class = "main">
	<div id = "showList">
		<h2 id = "aTitle">주문</h2>
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
		<form id = "cart">	
			<c:if test="${not empty cartShow }">
				<c:forEach items="${cartShow }" varStatus="status">
					<c:set var="p_no" scope="page" value="${cartShow[status.index].p_no }"/>
					<c:set var="flag" value="true"/>
					<c:forEach begin="0" step="1" end="${status.index }" var="chk">
						<c:if test="${flag }">
							<c:if test="${chk ne status.index}">
								<c:if test="${cartShow[status.index].p_no eq cartShow[chk].p_no }">
									<c:set var="flag" value="false"/>
								</c:if>
							</c:if>
						</c:if>
					</c:forEach>
					<c:if test="${flag }">
						<dl class = "showLow">
							<dt class = "imgDT">
								<a href="/detail?no=${cartShow[status.index].pi_file }">
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
									<input type = "checkbox" id = "checkBox${status.index }" class = "checkBoxs" value="${cartShow[status.index].p_no }">
									<label for = "CheckBox${status.index }">
										<span data-color = "${cartShow[status.index].color_code }" data-size = "${cartShow[status.index].size_code }">색상 : ${cartShow[status.index].p_color } / 사이즈 : ${cartShow[status.index].p_size } / ${cartShow[status.index].o_cnt }개</span>
									</label>
								</div>
							</dd>
							<dd class = "lowBottom">
								<div class = "prices">
									상품 금액 : <span><c:out value="${cartShow[status.index].p_price * cartShow[status.index].o_cnt}"/></span>원
								</div>
								<div class = "discounts">
									할인 금액 : <span><c:out value="${cartShow[status.index].p_price * cartShow[status.index].p_discount / 100 }"/></span>원
								</div>
							</dd>
						</dl>
					</c:if>	
				</c:forEach>	
			</c:if>
			<c:if test="${empty cartShow }">
				<dl>
					<dd class= "lowCenter">장바구니에 주문하실 상품을 담아주세요.</dd>
				</dl>
			</c:if>
		</form>
	</div>
</div>