<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page trimDirectiveWhitespaces="true" %>
	
	<link rel="stylesheet" type="text/css" href="/resources/include/css/notice/reset.css">
	<link rel="stylesheet" type="text/css" href="/resources/include/css/notice/noticeDetail.css">
    <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="/resources/include/js/common.js"></script>
	<script type="text/javascript" src="/resources/include/js/chkFile.js"></script>
	<script type="text/javascript">
    $(function() {
    	/* 목록 버튼 처리*/
        $("#NoticeListBtn").click(function() {
    	    location.href = "/client/noticeList";
    	});
    });
</script>



<body>
	<div class="noticeDe-body">
		<div class="noticeDe-header">
	   		공지사항 게시판
		</div>
		<form id="getNo" name="getNo">
			<input type="hidden" name="no_num" value="${detail.no_num}">
		</form>
		<div class="noticeDetail">
			<table>
				<thead>
					<tr>
						<th>
							<div class="title">${detail.no_title}</div>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="De1">
							<div class="De-date">
								DATE : ${detail.no_date}
							</div>
							<div class="De-id">
								NAME : ${adminInfo.a_id}
							</div>
						</td>
					</tr>
					<tr>
						<td class="De-content">
							<div class="Decontent_body">
					            ${detail.no_content}
					        </div>
					    </td>
					</tr>
				</tbody>
			</table>
		    <div class="Detail-Btn">
		        <div id="NoticeListBtn">List</div>
		    </div>
		</div>
	</div>
</body>