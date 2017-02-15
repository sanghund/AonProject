<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav>
  <div class="logo alignC">
    <a href="/" class="brandLogo"><span class="bold">AON</span><br>PROJECT</a>
  </div>
  <ul class="nav tc mb">
    <li><a href="/client/about">ABOUT</a></li>
  </ul>
  <ul class="nav tc mb">
	<li><span class="shop bold">SHOP</span></li>
		<c:choose>
			<c:when test="${not empty categoryList}">
				<c:forEach var="categoryList"  items="${categoryList}">
					<li><a href="/category?no=${categoryList.ca_no}">${categoryList.ca_name}</a></li>
				</c:forEach>
			</c:when>
		</c:choose> 
	</ul>
  <ul class="nav tc mb">
    <li><a href="/client/noticeList">NOTICE</a></li>
  </ul>
</nav>