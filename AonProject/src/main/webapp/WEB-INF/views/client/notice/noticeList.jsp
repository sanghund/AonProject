<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page trimDirectiveWhitespaces="true" %>

	<link rel="stylesheet" type="text/css" href="/resources/include/css/notice/reset.css">
	<link rel="stylesheet" type="text/css" href="/resources/include/css/notice/notice.css">
	
<script>
  $(function() {
	//글 상세페이지로 이동
	  $(".goDetail").click(function(){
		  var no_num = $(this).parents("tr").attr("data-num");
		  $("#no_num").val(no_num);
		  console.log("글번호 : " + no_num);
		  $("#detailForm").attr({
			  "method":"get",
			  "action":"detailForm"
		  });
		  $("#detailForm").submit();
	  });
	});
</script>

<body>
<div class="notice-body">
  <div class="notice-header">
    <h1>공지사항</h1>
  </div>
     <form id="detailForm">
        <input type="hidden" id="no_num" name="no_num" value="">
     </form>
     <form class="form-horizontal form-label-left form-noticetable" novalidate id="f_writeForm" name="f_writeForm" enctype="multipart/form-data">
	   <table class="tbl_port"> 
	   		<colgroup>
	             <col width="13%">
	             <col width="70%">
	             <col width="17%">
	         </colgroup>
	         <thead>
	            <tr>
	               <th scope="col">No.</th>
	               <th scope="col">Title</th>
	               <th scope="col">Date</th>
	            </tr>
	         </thead>
	         <tbody id = "list">
	            <tr>
	            <c:choose>
	               <c:when test="${not empty noticeList}">
	                  <c:forEach var="noticeList" items="${noticeList}">
	                  <tr class="tac" data-num="${noticeList.no_num }">
	                     <td>${noticeList.no_num}</td>
	                     <td class="goDetail">${noticeList.no_title}</td>
	                     <td>${noticeList.no_date}</td>
	                  </tr>
	                  </c:forEach>
	               </c:when>
	            <c:otherwise>
	               <tr>
	                  <td colspan="3" class="noticeother">등록된 공지사항이 없습니다.</td>
	               </tr>
	            </c:otherwise>
	            </c:choose>
	            </tr>
	         </tbody>
	   </table>
   </form>
</div>
</body>