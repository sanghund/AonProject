<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<script type="text/javascript" src="/resources/include/js/jquery.form.js"></script>
<script>
  $(function() {
	  $("#ImageInsert").click(function() {
		  $("#detailForm").attr({
			  "method":"post",
			  "action":"/admin/upload/ImageUploadInsert"
		  });
		  $("#detailForm").submit();
	  });
	  
  });
</script>

<h3>img 리스트</h3>
	<form id="detailForm" enctype="multipart/form-data">
		<table>
			<tbody>
				<tr>
					<td>메인 이미지</td>
					<%-- <td><input type="text" id="mp_no" name="mp_no" value="${imageUploadList.mp_no}"></td> --%>
				</tr>
				<tr>
					<td>등록일</td>
					<td>${imageUploadList.mp_date}</td>
				</tr>
			</tbody>
		</table>
		<div class="btnContainer">
		<input type="file" id = "files" name="files" multiple="multiple" /><br />
        <input type="button" id="ImageInsert" value="사진등록"><br />
		<input type="button" id="deleteBtn" value="사진삭제">
	</div>
	</form>
	
	
	<div class="itemList">
		<c:choose>
			<c:when test="${not empty imageUploadList}">
				<c:forEach var="imageUploadList" items="${imageUploadList}">
	
				</c:forEach>
			</c:when>
			<c:otherwise>
				<p>등록된 사진이 없습니다</p>
			</c:otherwise>
		</c:choose>
	</div>
	
   <%-- <h2>@MultipartRequest 사용</h2>
   <c:choose>
     <c:when test="${not empty imageUploadList}">
       <c:forEach var="image" items="${imageUploadList}">
       <tr class="tac" data-num="${imageUploadList.mp_no}">
         <td class="goDetail">${imageUploadList.mp_route}</td>
         <td>${imageUploadList.mp_file}</td>
         <td>${imageUploadList.mp_date}</td>
       </tr>
       </c:forEach>
     </c:when>
   </c:choose> --%>
   
    <!-- <form action="upload2.action" method="post"
        enctype="multipart/form-data">
          파일 : <input type="file" name="report" multiple="multiple"/><br />
        <input type="button" id="ImageInsert" value="등록"><br />
    </form> -->