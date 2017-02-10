<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>

<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">

  $(function() {
	  $("#typeInsert").click(function() {
		  if(!chkSubmit($("#cc_name"),"코드내용을"))return;
		  else if(!chkSubmit($("#cc_group"),"코드구분을"))return;
		  else if(!chkSubmit($("#cc_desc"),"코드설명을"))return;
		  $("#tDetailForm").attr({
			  "method":"post",
			  "action":"/admin/tCommonCodeInsert"
		  });
		  $("#tDetailForm").submit();
	  });
	  
  });
</script>

<form id="tDetailForm">
		<table>
			<tbody>
				<c:choose>
                    <c:when test="${not empty tCommonCodeList }">
                      <c:forEach var="tCommonCodeList" items="${tCommonCodeList }" >
                        <tr class="tac" data-num="${tCommonCodeList.cc_no }">
                                  
                          <td>${tCommonCodeList.cc_no }</td>
                          <td class="tName">${tCommonCodeList.cc_name}</td>
                          <td class="tGroup">${tCommonCodeList.cc_group }</td>
                          <td class="tDesc">${tCommonCodeList.cc_desc }</td>
                          <td class="tDate">${tCommonCodeList.cc_date }</td>
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
		</table><br />
		
		
		<h2>타입 등록</h2>
		<div class="btnContainer"><br />
		코드내용 : <input type="text" required="required" id="cc_name" name="cc_name" /><br />
		코드구분 : <input type="text" required="required" id="cc_group" name="cc_group" /><br />
		코드설명 : <input type="text" required="required" id="cc_desc" name="cc_desc" /><br />
		</div>
        <input type="button" id="typeInsert" value="타입등록">
        
</form>