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

<!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>메인 이미지 관리</h3>
              </div>
            </div>
            <div class="clearfix"></div>

            <div class="row">


              <div class="col-md-8 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Form Buttons <small>Sessions</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                    <form class="form-horizontal form-label-left">

                      <div class="form-group">
                        <label class="col-sm-3 control-label">이미지 1</label>
                        <div class="col-sm-9">
                          <div class="input-group">
                            <span class="input-group-btn">
                                              <button type="button" class="btn btn-primary">Go!</button>
                                          </span>
                            <input type="text" class="form-control">
                          </div>        
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label class="col-sm-3 control-label">이미지 1</label>
                        <div class="col-sm-9">
                          <div class="input-group">
                            <span class="input-group-btn">
                                              <button type="button" class="btn btn-primary">Go!</button>
                                          </span>
                            <input type="text" class="form-control">
                          </div>        
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label class="col-sm-3 control-label">이미지 1</label>
                        <div class="col-sm-9">
                          <div class="input-group">
                            <span class="input-group-btn">
                                              <button type="button" class="btn btn-primary">Go!</button>
                                          </span>
                            <input type="text" class="form-control">
                          </div>        
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label class="col-sm-3 control-label">이미지 1</label>
                        <div class="col-sm-9">
                          <div class="input-group">
                            <span class="input-group-btn">
                                              <button type="button" class="btn btn-primary">Go!</button>
                                          </span>
                            <input type="text" class="form-control">
                          </div>        
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label class="col-sm-3 control-label">이미지 1</label>
                        <div class="col-sm-9">
                          <div class="input-group">
                            <span class="input-group-btn">
                                              <button type="button" class="btn btn-primary">Go!</button>
                                          </span>
                            <input type="text" class="form-control">
                          </div>        
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->

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