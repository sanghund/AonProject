<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<script type="text/javascript" src="/resources/include/js/jquery.form.js"></script>
<script>
  $(function() {
	  $("#sizeInsert").click(function() {
		  $("#sDetailForm").attr({
			  "method":"post",
			  "action":"/admin/commonCodeList"
		  });
		  $("#sDetailForm").submit();
	  });
	  
  });
</script>

<form id="sDetailForm">
		<table>
			<tbody>
				<c:choose>
                    <c:when test="${not empty commonCodeList }">
                      <c:forEach var="commonCodeList" items="${commonCodeList }" >
                        <tr class="tac" data-num="${commonCodeList.cc_no }">
                                  
                          <td class="a-center ">
                             <input type="checkbox" class="checkedRecord" name="table_records">
                          </td>
                          <td>${commonCodeList.cc_no }</td>
                          <td class="goDetail">${commonCodeList.cc_name}</td>
                          <td class="date">${commonCodeList.cc_group }</td>
                          <td class="name">${commonCodeList.cc_desc }</td>
                          <td class="name">${commonCodeList.cc_date }</td>
                        </tr>
                      </c:forEach>
                    </c:when>
                    <c:otherwise>
                      <tr>
                        <td colspan="4" class="tac">등록된 게시물이 존재하지 않습니다.</td>
                      </tr>
                    </c:otherwise>
                </c:choose>
			</tbody>
		</table>
		<div class="btnContainer">
		사이즈 : <input type="text" id="size" name="size" /><br />
        <input type="button" id="sizeInsert" value="사이즈등록"><br />
		<input type="button" id="deleteBtn" value="사이즈삭제">
	</div>
	</form>