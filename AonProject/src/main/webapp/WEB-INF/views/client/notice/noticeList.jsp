<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page trimDirectiveWhitespaces="true" %>

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
  <div>
    <h1>공지사항</h1>
  </div>
     <form id="detailForm">
        <input type="hidden" id="no_num" name="no_num" value="">
     </form>
     <form class="form-horizontal form-label-left" novalidate id="f_writeForm" name="f_writeForm" enctype="multipart/form-data">
   <table class="tbl_port" style="border: 1px solid #ccc"> 
      <caption style="background-color: #ccc">목록</caption>
         <thead>
            <tr>
               <th scope="col">글번호</th>
               <th scope="col">제목</th>
               <th scope="col">작성일</th>
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
                  <td colspan="3">조회된 결과가 없습니다.</td>
               </tr>
            </c:otherwise>
            </c:choose>
            </tr>
         </tbody>
   </table>
   </form>
</body>