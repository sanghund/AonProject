<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
 	.noticeList {cursor:pointer;}
</style>

<script src = "/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
  $(function() {
		$(".noticeList").click(function() {
		  location.href = "/client/noticeList";
		}); 
  });
</script>

<!-- ================== left start ===========================-->
<div id="left" >
	<div class="left_inner">
		<div class="main_logo">
			<a href="/" class="brandLogo"><span class="bold">AON</span><br>PROJECT</a>
		</div>
		<div class="left_category">
			<ul>
				<li><a href="#">ABOUT</a></li>
				
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
				<li class="noticeList">NOTICE</li>
			</ul>
		</div>
	</div>
</div>
<!-- ========================= left END ===========================-->