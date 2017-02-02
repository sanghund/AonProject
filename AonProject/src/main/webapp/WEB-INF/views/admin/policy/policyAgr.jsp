<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %>
<link rel = "stylesheet" href = "/resources/include/fontello/css/fontello.css">
<style type = "text/css">
	#pTitle{
		font-size: 3rem;
		display: inline-block;
		border-bottom: 1px solid #73879C;
		margin-bottom: 3rem;
	}
	#searchForm table{
		width: 100%;
		font-size: 15px;
	}
	#searchForm table tr,th,td{
		border: 1px solid #73879C;
	}
	#searchForm table th{
		border-bottom: 4px double #73879C;
	}
	#searchForm th{
		text-align: center;
		font-weight: bold;
	}
	#searchForm table tr:LAST-CHILD,td:LAST-CHILD{
		border: none;
		text-align: center;
	}
	#searchForm table tr:LAST-CHILD{
		font-size: 18px;
		border-spacing: 20px 20px;
		
	}
	.tableSet{
		border: 3px solid #73879C;
		border-style: dotted;
		padding: 30px 15px;		
	}
	
	.searchMenuBar{	
		margin-top: 15px;
		margin-bottom: 10px;
	}
	.textCenter{
		text-align: center;
	}
</style>
<div class = "main">
	<h2 id = "pTitle">약관 동의</h2>
	<form id = "searchForm">
		<div id = "admin" class = "tableSet">
			<h3>관리자 목록</h3>
			<div class = "searchMenuBar">
				<span>
					<label for="adminSearchShow">아이디 검색</label>
					<input type = "text" id = "adminSearchShow" name = "adminSearchShow" value="${adminVO.adminSearch }">
					<input type = "button" class = "searchBtn" value = "검색">
				</span>
			</div>
			<table summary="관리자 개인정보 이용약관 동의 목록">
				<colgroup>
					<col width="5%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="20%">
					<col width="20%">
					<col width="10%">
					<col width="15%">
				</colgroup>
				<tr>
					<th>회원 번호</th>
					<th>회원 아이디</th>
					<th>회원 이름</th>
					<th>회원 전화번호</th>
					<th>회원 이메일</th>
					<th>약관 이름</th>
					<th>약관 동의여부</th>
					<th>약관 동의날짜</th>
				</tr>
				<c:if test="${not empty adminAgr}">
					<c:if test="${adminVO.totalPage < adminVO.pageNum }">
						<tr>
							<td class = "textCenter" colspan="8">데이터가 존재하지 않습니다.</td>
						</tr>
					</c:if>
					<c:forEach items="${adminAgr }" varStatus="status">
						<tr>
							<td class = "textCenter">${adminAgr[status.index].a_no }</td>
							<td class = "textCenter">${adminAgr[status.index].a_id }</td>
							<td class = "textCenter">${adminAgr[status.index].a_name }</td>
							<td class = "textCenter">${adminAgr[status.index].a_tel }</td>
							<td class = "textCenter">${adminAgr[status.index].a_email }</td>
							<td class = "textCenter">${adminAgr[status.index].po_name }</td>
							<td class = "textCenter">${adminAgr[status.index].pa_confirm }</td>
							<td class = "textCenter">${adminAgr[status.index].pa_date }</td>
						</tr>
					</c:forEach>
						<tr>
							<td colspan="8" id = "pageLow">
								<c:if test = "${adminVO.pageTotal[0] eq 1}" >
									<span class = "icon-angle-double-left"></span>
								</c:if>
								<c:if test = "${adminVO.pageTotal[0] ne 1}" >
									<a href = "/admin/policyAgr?pageNum=1" data-num = "1" class = "icon-angle-double-left"></a>
								</c:if>
								<c:if test = "${adminVO.pageTotal[0] eq 1}" >
									<span class = "icon-angle-left"></span>
								</c:if>
								<c:if test = "${adminVO.pageTotal[0] ne 1}" >
									<a href = "/admin/policyAgr?pageNum=${adminVO.pageTotal[0] - fn:length(adminVO.pageTotal) }" data-num = "${adminVO.pageTotal[0] - fn:length(adminVO.pageTotal) }" class = "icon-angle-left"></a>
								</c:if>
					
								<c:if test = "${adminVO.totalPage < adminVO.pageNum }">
									<c:set var = "pNum" value= "${adminVO.totalPage }"/>
								</c:if>
								<c:if test = "${adminVO.totalPage >= adminVO.pageNum }">
									<c:set var = "pNum" value= "${adminVO.pageNum }"/>
								</c:if>
								
								<c:forEach items="${adminVO.pageTotal }" varStatus="status">
									<c:if test = "${adminVO.pageTotal[status.index] eq pNum}" >
										<span>${adminVO.pageTotal[status.index] }</span>
									</c:if>
									<c:if test = "${adminVO.pageTotal[status.index] ne pNum}" >
										<a href = "/admin/policyAgr?pageNum=${adminVO.pageTotal[status.index] }" data-num = "${adminVO.pageTotal[status.index]}">
					 						${adminVO.pageTotal[status.index] } 
										</a>
									</c:if>
								</c:forEach>
	
								<c:if test = "${adminVO.pageTotal[fn:length(adminVO.pageTotal) - 1] eq adminVO.totalPage}" >
									<span class = "icon-angle-right"></span>
								</c:if>
								<c:if test = "${adminVO.pageTotal[fn:length(adminVO.pageTotal) - 1] ne adminVO.totalPage}" >
									<a href = "/admin/policyAgr?pageNum=${adminVO.pageTotal[0] + fn:length(adminVO.pageTotal) }" data-num = "${adminVO.pageTotal[0] + fn:length(adminVO.pageTotal) }" class = "icon-angle-right"></a>
								</c:if>
								<c:if test = "${adminVO.pageTotal[fn:length(adminVO.pageTotal) - 1] eq adminVO.totalPage}" >
									<span class = "icon-angle-double-right"></span>
								</c:if>
								<c:if test = "${adminVO.pageTotal[fn:length(adminVO.pageTotal) - 1] ne adminVO.totalPage}" >
									<a href = "/admin/policyAgr?pageNum=${adminVO.totalPage }" data-num = "${adminVO.totalPage }" class = "icon-angle-double-right"></a>
								</c:if>
							</td>
						</tr>
				</c:if>
				<c:if test="${empty adminAgr }">
					<colgroup>
						<col width="100%">
					</colgroup>
					<tr>
						<td class = "textCenter" colspan="8">데이터가 존재하지 않습니다.</td>
					</tr>
					<tr>
						<td colspan="8">
							<span class = "icon-angle-double-left"></span>
								<span class = "icon-angle-left"></span>
								<span>1</span>
								<span class = "icon-angle-right"></span>
								<span class = "icon-angle-double-right">
							</span>
						</td>
					</tr>
				</c:if>
			</table>
		</div>
		<input type = "hidden" id = "adminPageNum" name = "adminPageNum" value = "${adminVO.pageNum }">
		<input type = "hidden" id = "adminSearch" name = "adminSearch" value="${adminVO.adminSearch }">
	</form>
	
	<script src = "/resources/include/js/jquery-1.12.4.min.js"></script>
	<script type = "text/javascript">
		$(document).ready(function(){
			$("#pageLow a").click(function(event){
				event.preventDefault();
				var adminPageNum = $(this).attr("data-num");
				$("#adminPageNum").val(adminPageNum);
				$("#searchForm").attr({
					"method" : "post",
					"action" : "/admin/policyAgr"
				});
				$("#searchForm").submit();
			});
			
			$(".searchBtn").click(function(){
				if($(this).closest(".tableSet").attr("id") == "admin"){
					$("#adminPageNum").val("0");
					if($("#adminSearchShow").val().replace(/\s/g,"")==""){
						$("#adminSearch").val("");
					}
					else{
						$("#adminSearch").val($("#adminSearchShow").val());
					}
				}
				$("#searchForm").attr({
					"method" : "post",
					"action" : "/admin/policyAgr"
				});
				$("#searchForm").submit();
			});
		});
	</script>
</div>
