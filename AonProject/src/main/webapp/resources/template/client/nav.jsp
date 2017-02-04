<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ================== left start ===========================-->
<div id="left" >
	<div class="left_inner">
		<div class="main_logo">
			<a href="/">
				All <br>OR Nothing
			</a>
		</div>
		<div class="left_category">
			<ul>
				<li><a href="#">ABOUT</a></li>
				<li><a href="#">LOOKBOOK</a></li>
				<li>&nbsp;</li>
				<li><a href="productPage.do" style="font-weight: bold; color:black">SHOP</a></li>
				<c:choose>
					<c:when test="${not empty categoryList}">
						<c:forEach var="categoryList" items="${categoryList}">
							<li><a href="/category?no=${categoryList.ca_no}">${categoryList.ca_name}</a></li>
						</c:forEach>
					</c:when>
				</c:choose>
				
				<li>&nbsp;</li>
				<li><a href="#">NOTICE</a></li>
				<li><a href="#">REVIEW</a></li>
				<li><a href="#">Q&amp;A</a></li>
			</ul>
		</div>
	</div>
</div>
<!-- ========================= left END ===========================-->