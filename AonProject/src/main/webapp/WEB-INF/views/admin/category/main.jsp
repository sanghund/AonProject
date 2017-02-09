<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<link rel="stylesheet" type="text/css" href="/resources/include/css/admincategory.css">
	<link rel="stylesheet" type="text/css" href="/resources/include/css/reset.css">
	<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="/resources/include/js/board.js"></script>
	<script type="text/javascript" src="/resources/include/js/chkFile.js"></script>
	<script type="text/javascript" src="/resources/include/js/jquery.form.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#cainsertBtn").click(function(){
			var name = $("#ca_name").val();
			var caselect = $("#caselect").val();
			var ca_name = name+caselect;
			if(!chkSubmit($("#ca_name"),"카테고리 이름을"))return;
			else{
				if(confirm("입력하시겠습니까?")){
					$(this).parent().click();
				}else{
					return false;
				}
				console.log(ca_name);
				$.ajax({
					url:"/admin/categoryInsert",
					type:"post",
					dataType:"text",
					data:ca_name,
					error:function(){
						alert("시스템 오류입니다. 관리지에게  문의해주세요.");
					},
					success:function(result){
						if(result == "success"){   
							alert("입력 완료했습니다.");
							location.reload();   
						}
					}
				});
			}
		});
		
		//삭제
		$(".caDeleteBtn").click(function(){
			
		});
	});
</script>
	<div class="category-Insert">
		<div class="ca_top"><h1>카테고리 입력</h1></div>
		<form id="ca_insertForm">
			<table>
				<thead>
					<col width="30%">
					<col width="70%">
				</thead>
				<tbody>
					<tr>
					<td>카테고리 이름 : </td>
					<td>
						<input type="number" id="ca_name" name="ca_name" size="10" maxlength="4">
						<select id="caselect">
							<option>S/S</option>
							<option>F/W</option>
						</select>
					</td>
				</tr>
				<tr class="catr2">
					<td colspan="2">
						<input type="reset" id="cacancelBtn" value="취소">
						<input type="button" id="cainsertBtn" value="등록">
					</td>
				</tr>
				</tbody>
			</table>
		</form>
	</div>
	
	<div class="caList">
		<table>
			<thead>
				<col width="30%">
				<col width="70%">
			</thead>
			<tbody>
				<tr>
					<th>NO</th>
					<th>NAME</th>
				</tr>
				<c:choose>
					<c:when test="${not empty categoryList}">
						<c:forEach var="category" items="${categoryList}">
							<tr>
								<td>${category.ca_no}</td>
								<td>
									<input type="hidden" class="ca_no" value="${category.ca_no }">
									${category.ca_name}
									<input type="button" class="caDeleteBtn" value="삭제" style="float:right">	
								</td>
							</tr>	
						</c:forEach>
					</c:when>
					<c:otherwise>
						<p>등록된 카테고리 없음</p>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	
				<c:choose>
					<c:when test="${not empty commonCodeList}">
						<c:forEach var="commonCodeList" items="${commonCodeList}">
							<tr data-no="${commonCodeList.cc_no}" class="commonCodeList">
								<td>${commonCodeList.cc_no}</td>
								<td>
									${commonCodeList.cc_name}
									
								</td>
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
