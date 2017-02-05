<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	.width40 {width:40%; border:1px solid #f00;}
	.content {width:100%;}
	.imgContainer {float:left; margin-right:2%; margin-bottom:2em;}
	.imgContainer img {margin:0 auto; display:block;}
	.itemOption {float:left;}
		itemOption > h3 {font-size:24px; padding:0 0 10px 0; border-bottom:1px solid #e1e1e1;}
	.productImg {width:82%; clear:both;}
	.productImg img {margin:10px auto; display:block;}
	
	table {border:1px solid #f00 !important;}
	td {border:1px solid #f00 !important;}
</style>


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
		<img src="http://dummyimage.com/360x400" />
	</div>
	<div class="itemOption width40">
		<h3>${productDetail.p_name}</h3>
		<table>
			<tbody>
				<tr>
					<td>productNo</td>
					<td>${productDetail.p_no}</td>
				</tr>
				<tr>
					<td>price</td>
					<td>${productDetail.p_price}원</td>
				</tr>
				<tr>
					<td>color</td>
					<td>${productDetail.color_code}</td>
				</tr>
				<tr>
					<td>size</td>
					<td>
						<select name="size" id="size">
							<c:forEach var="commonCodeList" items="${commonCodeList}">
								<c:if test="${commonCodeList.cc_group eq 'size' && commonCodeList.cc_name ne 'F'}">
									<option value="${commonCodeList.cc_no}">${commonCodeList.cc_name}</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
				</tr>
			</tbody>
		</table>
		
		
	</div>
	<div class="productImg">
		<img src="http://dummyimage.com/600x800" />
		<img src="http://dummyimage.com/600x800" />
		<img src="http://dummyimage.com/600x800" />
	</div>
		
</div>
