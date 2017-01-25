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
		inputDisable();

		/* 수정버튼 클릭 - 수정폼 활성화 */
		$("#updateBtn").click(function(){
			inputEnable();
			$("#updateBtn").attr({"id":"update", "value":"수정완료"});
		})
		
		/* 수정사항 업데이트 */
		$(document).on("click", "#update", function(){
			alert($("#p_name").val());
			/* alert( "p_no :"+ $("#p_no").val()+
					"ca_no :"+ $("#ca_no").val()+
					"p_type :"+  $("#p_type").val()+
					"p_name :"+  $("#p_name").val()+
					"color_code :"+  $("#color_code").val()+
					"size_code :"+  $("#size_code").val()+
					"p_price :"+  $("#p_price").val()+
					"p_discount :"+  $("#p_discount").val()+
					"p_fabric :"+  $("#p_fabric").val()+
					"p_caution :"+  $("#p_caution").val()+
					"pu_no :"+  $("#pu_no").val()) */
			if(!chkSubmit($("#ca_no"),"카테고리 번호를")) return;
			else if(!chkSubmit($("#p_type"),"상품타입을")) return;
			/* else if(!chkSubmit($("#p_name"),"상품명을")) return
			else if(!chkSubmit($("#ca_no"),"상품색상을")) return
			else if(!chkSubmit($("#p_name"),"상품사이즈를")) return
			else if(!chkSubmit($("#p_price"),"가격을")) return
			else if(!chkSubmit($("#p_fabric"),"소재를")) return
			else if(!chkSubmit($("#p_caution"), "주의사항을")) return
			else if(!chkSubmit($("#pu_no"), "거래처를")) return */
			else {
				$.ajax({
					url		: "/admin/productUpdate",
					type	: "post",
					headers	: {
						"Content-Type":"application/json",
						"X-HTTP-Method-Override" : "post",
					},
					dataType: "text",
					data	: JSON.stringify({
						p_no 		: $("#p_no").val(),
						ca_no		: $("#ca_no").val(),
						p_type		: $("#p_type").val(),
						p_name		: $("#p_name").val(),
						color_code	: $("#color_code").val(),
						size_code	: $("#size_code").val(),
						p_price		: $("#p_price").val(),
						p_discount	: $("#p_discount").val(),
						p_fabric	: $("#p_fabric").val(),
						p_caution	: $("#p_caution").val(),
					}),
					error	: function(){
						alert("시스템 오류");
					},
					success : function(result){
						alert(result);
					}
				})
			}
		});

		
		//상품 삭제
		$("#deleteBtn").click(function(){
			alert("hi");
		});
	
	})
	
	function inputDisable(){
		$("input[type='text']").attr("disabled","disabled");
		$("input[type='number']").attr("disabled","disabled");
		$("textarea").attr("disabled","disabled");
		$("select option").not(":selected").attr("disabled","disabled");
	}
	
	function inputEnable(){
		$("input[type='text']").removeAttr("disabled");
		$("input[type='number']").removeAttr("disabled");
		$("textarea").removeAttr("disabled");
		$("select option").not(":selected").removeAttr("disabled");
	}
</script>
</head>
<style>
	table {border-collapse:collapes; width:800px;}
	td {border:1px solid #222; padding:1em;}
</style>
<body>
	<h3>상품 디테일</h3>
	<!-- 상품 등록, 수정, 삭제 입력 폼 -->
	<div id="detailContainer">
		<form id="detailForm">
			<input type="hidden" id="p_no" name="p_no" value="${productDetail.p_no}">
			<table>
				<tbody>
					<tr>
						<td>상품번호</td>
						<td>${productDetail.p_no}</td>
					</tr>
					<tr>
						<td>카테고리분류</td>
						<td>
							<select name="ca_no" id="ca_no" value="${category.ca_no}">
								<c:choose>
									<c:when test="${not empty category}">
										<!-- 사이즈 리스트 출력 -->
									</c:when>
									<c:otherwise>
										<option value="" selected="selected">등록된 카테고리가 없습니다.</option>
										<option value="2">2</option>
									</c:otherwise>
								</c:choose>
							</select>
						</td>
					</tr>
					<tr>
						<td>상품타입</td>
						<td>
							<select id="p_type" name="p_type" value="${product}">
								<c:choose>
									<c:when test="${not empty product}">
										<!-- 사이즈 리스트 출력 -->
									</c:when>
									<c:otherwise>
										<option value="">등록된 사이즈가 없습니다.</option>
										<option value="T">상의</option>
									</c:otherwise>
								</c:choose>
							</select>
						</td>
					</tr>
					<tr>
						<td>상품명</td>
						<td><input type="text" name="p_name" id="p_name" value="${productDetail.p_name}"/></td>
					</tr>
					<tr>
						<td>색상</td>
						<td>
							<select id="color_code" name="color_code" id="color_code" value="${common_cd.cc_name}">
								<c:choose>
									<c:when test="${not empty common}">
										<!-- 색상리스트 출력 -->
									</c:when>
									<c:otherwise>
										<option value="">등록된 색상이 없습니다.</option>
										<option value="C1">NAVI</option>
									</c:otherwise>
								</c:choose>
							</select>
						</td>
					</tr>
					<tr>
						<td>사이즈</td>
						<td>
							<select id="size_code" name="size_code" id="size_code" value="${common_cd.cc_name}">
								<c:choose>
									<c:when test="${not empty category}">
										<!-- 사이즈 리스트 출력 -->
									</c:when>
									<c:otherwise>
										<option value="">등록된 사이즈가 없습니다.</option>
										<option value="S1">M</option>
									</c:otherwise>
								</c:choose>
							</select>
						</td>
					</tr>
					<tr>
						<td>상품가격</td>
						<td><input type="number" name="p_price" id="p_price" value="${productDetail.p_price}"></td>
					</tr>
					<tr>
						<td>할인율</td>
						<td>
							<select id="p_discount" value="${product.p_discount}">
								<option value="0">0%</option>
								<option value="10">10%</option>
								<option value="20">20%</option>
								<option value="30">30%</option>
								<option value="50">50%</option>
								<option value="70">70%</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>소재</td>
						<td><input type="text" id="p_fabric" name="p_fabric" value="${productDetail.p_fabric}"></td>
					</tr>
					<tr>
						<td>주의사항</td>
						<td><textarea id="p_caution" name="p_caution">${productDetail.p_caution}</textarea></td>
					</tr>
					<tr>
						<td>거래처</td>
						<td>
							<select id="pu_no" name="pu_no" value="${purchase.pu_no}">
								<c:choose>
									<c:when test="${not empty purchase}">
										<!-- 사이즈 리스트 출력 -->
									</c:when>
									<c:otherwise>
										<option value="">등록된 거래처가 없습니다.</option>
										<option value="2">서울 현대</option>
									</c:otherwise>
								</c:choose>
							</select>
						</td>
					</tr>
					<tr>
						<td>등록일</td>
						<td>${productDetail.p_date}</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<!-- 상품 등록, 수정, 삭제 제어 버튼 -->
	<div class="btnContainer">
		<input type="button" id="updateBtn" value="수정">
		<input type="button" id="deleteBtn" value="상품삭제">
	</div>

</body>
</html>