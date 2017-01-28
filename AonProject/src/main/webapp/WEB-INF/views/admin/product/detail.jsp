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
	var targetUrl = "";		//요청 url 지정
	var fileCnt = 0;
	$(function(){
		if("${mode}" == "insert"){
			targetUrl = "/admin/productInsert"
			inputEnable();
			$("#deleteBtn").hide();
			$("#updateBtn").attr("value", "등록");
		}else if("${mode}" == "update"){
			targetUrl = "/admin/productUpdate"
			inputDisable();	
			$("input[name='p_no']").attr("readonly","readonly");
		}

		/* 수정버튼 클릭 - 수정폼 활성화 */
		$("#updateBtn").click(function(){
			inputEnable();
			$("#updateBtn").attr({"id":"update", "value":"수정완료"});
		})
		
		/* 수정사항 업데이트 */
		$(document).on("click", "#update", function(){
			if("${mode}" == "insert"){
				if(!chkSubmit($("#p_no"),"상품 번호를")) return;
			}
			
			if(!chkSubmit($("#ca_no"),"카테고리 번호를")) return;
			else if(!chkSubmit($("#p_type"),"상품타입을")) return;
			else if(!chkSubmit($("#p_name"),"상품명을")) return
			else if(!chkSubmit($("#ca_no"),"상품색상을")) return
			else if(!chkSubmit($("#p_name"),"상품사이즈를")) return
			else if(!chkSubmit($("#p_price"),"가격을")) return
			else if(!chkSubmit($("#p_fabric"),"소재를")) return
			else if(!chkSubmit($("#p_caution"), "주의사항을")) return
			else {
				var imgFirst = $(".p_file0").val();
				var imgContainer = "";
				
				if(fileCnt>=1){
					for(var i=1; i<=fileCnt; i++){
						if($(".p_file"+i).val()==""){
							i++;
						}
						imgContainer = imgContainer+"@"+$(".p_file"+i).val();
					}
					imgFirst += imgContainer
				}
				
				alert(imgFirst);
				
				$.ajax({
					url		: targetUrl,
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
						pi_file		: imgFirst
						//pi_file		: $(".p_file").val()
					}),
					error	: function(){
						alert("시스템 오류");
					},
					success : function(result){
						if("${mode}" == "insert"){
							location.href="/admin/product"
						}
					}
				})//end ajax
			}
		});

		
		//상품 삭제
		$("#deleteBtn").click(function(){
			alert("hi");
		});
		
		//listBtn click event
		$("#listBtn").click(function(){
			location.href = "/admin/product";
		});
		
		//addFileBtn click event
		$(document).on("click", ".addFileBtn", function(){
			addFile();
		});
		
		//removeFileBtn click event
		$(document).on("click", ".removeFileBtn", function(){
			$(this).parent().remove();
		})
	
	})
	
	//파일첨부 추가 버튼 생성
	function addFile(){
		var fileInput = $("<input>");
		fileInput.attr({"type":"file", "name":"p_file"+(++fileCnt), "class":"p_file"+(fileCnt)});
		var fileAddBtn = $("<input>")
		fileAddBtn.attr({"type":"button", "class":"addFileBtn", "value":"+"});
		var fileRemoveBtn = $("<input>")
		fileRemoveBtn.attr({"type":"button", "class":"removeFileBtn", "value":"-"});
		var fileContainer = $("<div>");
		fileContainer.append(fileInput).append(fileAddBtn).append(fileRemoveBtn);
		$(".fileUploadContainer").append(fileContainer);
	}
	
	//텍스트입력 비활성화
	function inputDisable(){
		$("input[type='text']").attr("disabled","disabled");
		$("input[type='number']").attr("disabled","disabled");
		$("textarea").attr("disabled","disabled");
		$("select option").not(":selected").attr("disabled","disabled");
	}
	
	//텍스트입력 활성화
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
	<h2>상품 디테일</h2>
	<!-- 상품 등록, 수정, 삭제 입력 폼 -->
	<div id="detailContainer">
		<form id="detailForm" enctype="multipart/form-data">
			<table>
				<tbody>
					<tr>
						<td>상품번호</td>
						<td><input type="text" id="p_no" name="p_no" value="${productDetail.p_no}"></td>
					</tr>
					<tr>
						<td>카테고리분류</td>
						<td>
							<select name="ca_no" id="ca_no">
								<c:choose>
									<c:when test="${not empty categoryList}">
										<c:forEach var="categoryList" items="${categoryList}">
											<c:if test="${categoryList.ca_no != productDetail.ca_no}">
												<option value="${categoryList.ca_no}">${categoryList.ca_name}</option>
											</c:if>
											<c:if test="${categoryList.ca_no == productDetail.ca_no}">
												<option value="${categoryList.ca_no}" selected="selected">${categoryList.ca_name}</option>
											</c:if>
										</c:forEach>
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
							<select id="p_type" name="p_type">
								<c:choose>
									<c:when test="${not empty commonCodeList}">
										<c:forEach var="commonCodeList" items="${commonCodeList}">
											<c:if test="${commonCodeList.cc_group eq 'p_type'}">
												<c:if test="${commonCodeList.cc_no ne productDetail.p_type}">
													<option value="${commonCodeList.cc_no}">${commonCodeList.cc_name}</option>
												</c:if>
												<c:if test="${commonCodeList.cc_no eq productDetail.p_type}">
													<option value="${commonCodeList.cc_no}" selected="selected">${commonCodeList.cc_name}</option>
												</c:if>
											</c:if>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<option value="">등록된 색상이 없습니다.</option>
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
							<select id="color_code" name="color_code" id="color_code">
								<c:choose>
									<c:when test="${not empty commonCodeList}">
										<c:forEach var="commonCodeList" items="${commonCodeList}">
											<c:if test="${commonCodeList.cc_group eq 'color'}">
												<c:if test="${commonCodeList.cc_no ne productDetail.color_code}">
													<option value="${commonCodeList.cc_no}">${commonCodeList.cc_name}</option>
												</c:if>
												<c:if test="${commonCodeList.cc_no eq productDetail.color_code}">
													<option value="${commonCodeList.cc_no}" selected="selected">${commonCodeList.cc_name}</option>
												</c:if>
											</c:if>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<option value="">등록된 색상이 없습니다.</option>
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
									<c:when test="${not empty commonCodeList}">
										<c:forEach var="commonCodeList" items="${commonCodeList}">
											<c:if test="${commonCodeList.cc_group eq 'size'}">
												<c:if test="${commonCodeList.cc_no ne productDetail.size_code}">
													<option value="${commonCodeList.cc_no}">${commonCodeList.cc_name}</option>
												</c:if>
												<c:if test="${commonCodeList.cc_no eq productDetail.size_code}">
													<option value="${commonCodeList.cc_no}" selected="selected">${commonCodeList.cc_name}</option>
												</c:if>
											</c:if>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<option value="">등록된 사이즈가 없습니다.</option>
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
							<select id="p_discount">
								<c:choose>
									<c:when test="${not empty productDetail}">
										<c:if test="${productDetail.p_discount ne '0'}">
											<option value="${productDetail.p_discount}" selected="selected" style="background:pink;">${productDetail.p_discount}%</option>
										</c:if>	
									</c:when>
								</c:choose>
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
						<td>상품이미지</td>
						<td>
							<div class="fileUploadContainer">
								<input type="file" class="p_file0" name="p_file" multiple="multiple"><input type="button" class="addFileBtn" value="+">
							</div>
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
		<input type="button" id="updateBtn" value="상품수정">
		<input type="button" id="deleteBtn" value="상품삭제">
		<input type="button" id="listBtn" value="목록">
	</div>

</body>
</html>