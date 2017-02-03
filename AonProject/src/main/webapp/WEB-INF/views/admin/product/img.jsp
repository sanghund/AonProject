<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	var targetUrl = "";		//요청 url 지정
	var fileCnt = 1;
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
		fileInput.attr({"type":"file", "name":"p_file"+(fileCnt++)});
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
<style>
	/* .itemList {width:800px; height:500px; overflow-x:hidden; overflow-y:auto;} */
	table {border-collapse:collapes; }
	td {border:1px solid #222; padding:1em;}
</style>

	<h3>img 리스트</h3>
	<form id="detailForm" enctype="multipart/form-data">
		<table>
			<tbody>
				<tr>
					<td>상품번호</td>
					<td><input type="text" id="p_no" name="p_no" value="${productDetail.p_no}"></td>
				</tr>
				<tr>
					<td>상품이미지</td>
					<td>
						<div class="fileUploadContainer">
							<input type="file" id="p_file" name="p_file" multiple="multiple"><input type="button" class="addFileBtn" value="+">
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
	<div class="btnContainer">
		<input type="button" id="updateBtn" value="상품수정">
		<input type="button" id="deleteBtn" value="상품삭제">
		<input type="button" id="listBtn" value="목록">
	</div>
	
	
	<div class="itemList">
		<c:choose>
			<c:when test="${not empty uploadList}">
				<c:forEach var="uploadList" items="${uploadList}">
	
				</c:forEach>
			</c:when>
			<c:otherwise>
				<p>등록된 상품이 없습니다</p>
			</c:otherwise>
		</c:choose>

	</div>
