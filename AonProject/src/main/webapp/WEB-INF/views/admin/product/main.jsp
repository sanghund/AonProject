<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">   
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
<link rel="shortcut icon" href="/resources/image/default/icon.png" />
<link rel="apple-touch-icon" href="/resources/image/default/icon.png" />
<!--IE8이하 적용/--> 
<!--[if lt IE 9]>
   <script src="./js/html5shiv.js"></script>
<![endif]--> 
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/include/css/reset.css">
<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function(){
		/* 신청폼 디폴트 숨김 */
		$("#dataFormContainer").hide();
		
		//상품 등록창 호출 버튼
		$("#insertBtn").click(function(){
			$("#dataFormContainer").show();
		});
		
		//상품 등록
		$(".insertBtn").click(function(){
			if(!chkSubmit($("#ca_no"),"카테고리를")) return
			else if(!chkSubmit($("#p_type"),"상품타입을")) return
			else if(!chkSubmit($("#p_name"),"상품명을")) return
			else if(!chkSubmit($("#p_name"),"상품색상을")) return
			else if(!chkSubmit($("#p_name"),"상품사이즈를")) return
			else if(!chkSubmit($("#p_price"),"가격을")) return
			else if(!chkSubmit($("#p_fabric"),"소재를")) return
			else if(!chkSubmit($("#p_caution"), "주의사항을")) return
			else if(!chkSubmit($("#pu_no"), "거래처를")) return
			
		});
		
		//상품 디테일 호출
		$(".productPack").click(function(){
			var product_no = $(this).attr("data-no");
			$("#p_no").val(product_no);
			$("#detailForm").attr({"method":"post", "action":"/admin/productDetail"});
			$("#detailForm").submit(); 
			console.log(product_no);
			
			/* $("#dataFormContainer").show();
			var product_no = $(this).attr("data-no");
			alert(product_no);
			$.ajax({
				url		: "/admin/productDetail",
				type	: "post",
				dataType: "text",
				headers	: {
					"Content-Type"	: "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				data	: JSON.stringify({
					p_no	: product_no
				}),
				error	: function() {alert("시스템 장애 발생")},
				success	: function(productDetail){
					console.log(productDetail)
					console.log("${productDetail.p_no}")
				}
			}); */
		})
	})
</script>
<style>
	table {border-collapse:collapes; width:800px;}
	td {border:1px solid #222; padding:1em;}
</style>
</head>
<body>
	<h3>상품 리스트</h3>
	<!-- 상품 리스트 출력 -->
	<div class="itemList">
		<!-- 상품 디테일 확인 폼 -->
		<form id="detailForm">
			<input type="hidden" id="p_no" name="p_no">
		</form>
		
		<table>
			<thead>
				<tr>
					<td>상품번호</td>
					<td>카테고리</td>
					<td>상품분류</td>
					<td>상품명</td>
					<td>색상</td>
					<td>사이즈</td>
					<td>가격</td>
					<td>할인율</td>
					<td>소재</td>
					<td>주의사항</td>
					<td>등록일</td>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty productList}">
						<c:forEach var="product" items="${productList}">
							<tr data-no="${product.p_no}" class="productPack">
								<td>${product.p_no}</td>
								<td>${product.ca_no}</td>
								<%-- <td>${product.p_type}</td> --%>
								<td>temp</td>
								<td>${product.p_name}</td>
								<td>${product.color_code}</td>
								<td>${product.size_code}</td>
								<td>${product.p_price}</td>
								<td>${product.p_discount}</td>
								<td>${product.p_fabric}</td>
								<td>${product.p_caution}</td>
								<td>${product.p_date}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td>등록된 상품이 없습니다</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	<!-- 상품 등록, 수정, 삭제 제어 버튼 -->
	<div class="btnContainer">
		<input type="button" id="insertBtn" value="신규등록">
		<input type="button" id="updateBtn" value="상품수정">
		<input type="button" id="deleteBtn" value="상품삭제">
	</div>
	<!-- 상품 등록, 수정, 삭제 입력 폼 -->
	<%-- <div id="dataFormContainer">
		<form id="dataForm">
			<div>
				<label for="ca_no">카테고리 분류</label>
				<select id="ca_no" name="ca_no" id="ca_no" value="${category.ca_no}">
					<c:choose>
						<c:when test="${not empty category}">
							<!-- 사이즈 리스트 출력 -->
						</c:when>
						<c:otherwise>
							<option value="">등록된 사이즈가 없습니다.</option>
						</c:otherwise>
					</c:choose>
				</select>
			</div>
			<div>
				<label for="p_type">상품타입</label>
				<select id="p_type" name="p_type" id="p_type" value="${product}">
					<c:choose>
						<c:when test="${not empty product}">
							<!-- 사이즈 리스트 출력 -->
						</c:when>
						<c:otherwise>
							<option value="">등록된 사이즈가 없습니다.</option>
						</c:otherwise>
					</c:choose>
				</select>
			</div>
			<div>
				<label for="p_name">상품명</label>
				<input type="text" name="p_name" id="p_name" /> value="${productDetail.p_name}"
			</div>
			<div>
				<label for="color_code">색상</label>
				<select id="color_code" name="color_code" id="color_code" value="${common_cd.cc_name}">
					<c:choose>
						<c:when test="${not empty common}">
							<!-- 색상리스트 출력 -->
						</c:when>
						<c:otherwise>
							<option value="">등록된 색상이 없습니다.</option>
						</c:otherwise>
					</c:choose>
				</select>
			</div>
			<div>
				<label for="size_code">사이즈</label>
				<select id="size_code" name="size_code" id="size_code" value="${common_cd.cc_name}">
					<c:choose>
						<c:when test="${not empty common}">
							<!-- 사이즈 리스트 출력 -->
						</c:when>
						<c:otherwise>
							<option value="">등록된 사이즈가 없습니다.</option>
						</c:otherwise>
					</c:choose>
				</select>
			</div>
			<div>
				<label for="p_price">상품가격</label>
				<input type="number" name="p_price" id="p_price" value="${productDetail.p_price}">
			</div>
			<div>
				<label for="p_discount">할인율</label>
				<select id="p_discount" value="${product.p_discount}">
					<option value="0">0%</option>
					<option value="10">10%</option>
					<option value="10">20%</option>
					<option value="10">30%</option>
					<option value="10">50%</option>
					<option value="10">70%</option>
				</select>
			</div>
			<div>
				<label for="p_fablic">상품 소재</label>
				<input type="text" id="p_fablic" name="p_fabric" value="${productDetail.p_fabric}">
			</div>
			<div>
				<label for="p_caution">주의사항</label>
				<textarea id="p_caution" name="p_caution">${productDetail.p_caution}</textarea>
			</div>

			<div>
				<label for="pu_no">거래처</label>
				<select id="pu_no" name="pu_no" value="${purchase.pu_no}">
					<c:choose>
						<c:when test="${not empty purchase}">
							<!-- 사이즈 리스트 출력 -->
						</c:when>
						<c:otherwise>
							<option value="">등록된 거래처가 없습니다.</option>
						</c:otherwise>
					</c:choose>
				</select>
			</div>
		</form>
		<div class="btnContainer">
			<input type="button" class="insertBtn" value="등록완료">
			<input type="button" class="updateBtn" value="수정완료">
			<input type="button" class="deleteBtn" value="삭제">
		</div>
	</div> --%>
	
</body>
</html>