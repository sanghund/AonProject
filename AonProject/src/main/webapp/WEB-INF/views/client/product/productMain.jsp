<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="menuTit">
	<c:choose>
		<c:when test="${not empty categorySelect}">
			<c:forEach var="categorySelect" items="${categorySelect}">
				<p>${categorySelect.ca_name}</p>
			</c:forEach>		
		</c:when>
	</c:choose>
  <%-- <p>${categorySelect.ca_name}</p> --%>
</div>
<div class="content">
	<c:choose>
		<c:when test="${not empty productList}">
			<c:forEach var="productList" items="${productList}">
				<div>
					<p>${productList.p_name}</p>
					<p>${productList.p_price}</p>
				</div>
			</c:forEach>
		</c:when>
	</c:choose>
</div>
