<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
	.item {width:300px; float:left; margin:2em;}
	.item > a > img {width:260px; margin:10px auto; display:block;}
	.content ul {text-align:center; margin:1em 0;}
	.content ul li {line-height:1.2rem;}
</style>


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
		<c:when test="${not empty productForCategory}">
			<c:forEach items="${productForCategory}" varStatus="status">
				<div class="item" data-num="${productForCategory[status.index].p_no}">
					<a href="/detail?no=${fn:substring(productForCategory[status.index].p_no,0,7)}">
						<img src="/productUpload/${productForCategory[status.index].pi_file}" />
					</a>
					<ul>
						<li class="bold">[AON PROJECT]</li>
						<li class="bold">${productForCategory[status.index].p_name}</li>
						<%-- <li>${productForCategory[status.index].p_info}</li> --%>
						<li>CONSUMER PRICE: ${productForCategory[status.index].p_price}</li>
					</ul>
				</div>
			</c:forEach>
		</c:when>
	</c:choose>
</div>
