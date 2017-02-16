<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	<link rel = "stylesheet" href = "/resources/include/fontello/css/fontello.css">
	<link rel="stylesheet" type="text/css" href="/resources/include/css/review/reset.css">
	<link rel="stylesheet" type="text/css" href="/resources/include/css/review/review.css">
	<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="/resources/include/js/board.js"></script>
	<script type="text/javascript" src="/resources/include/js/chkFile.js"></script>
	<script type="text/javascript" src="/resources/include/js/jquery.form.min.js"></script>
	<script type="text/javascript">
		var status = "off";
		var replyNum="작성시 입력한 비밀번호를 입력해 주세요.";
		var gfv_count = 1;
		
		$(function(){
			$(".find_review").find("td").hide(); //이벤트가 발생된 대상의 자식요소 검색 find()
			
			//제목을 클릭했을 때
			$(".review_tr").click(function(){
				var showData = $(this).next("tr").find("td");
				//첫번째 tr요소가 아닌 것에 다음 tr에 td
				var hideData = $(".review_tr").not(this).next("tr").children("td");
				
				showData.slideToggle(300);
				hideData.slideUp(100);	
				$(".review_write").hide();
				reset();
				return false;
	           
			}); 
			
			
			//글 입력폼띄우기
			$(".review_write").hide();
			$(".write_button").click(function(){
				$(".review_write").show();
				$(".find_review").find("td").hide();
				
			});
			//write_button을 클릭
			$(".write_button").click(function(){
				reset();
			});
			
			//write버튼을 클릭했을 때 입력
			$(".write_btn").click(function(){
				var wirteForm = $("#write_form");
				if(!chkSubmit($("#re_title"),"제목을"))return;
				else if(!chkSubmit($("#re_pwd"),"비밀번호를"))return;
				else if(!chkSubmit($("#re_content"),"내용을"))return;
				else{
					$(wirteForm).ajaxForm({
						url:"/review/reviewInsert",
						enctype: "multipart/form-data",
						dataType : "text",
						type:"post",
						error:function(){
							alert("시스템 오류입니다. 관리자에게 문의하세요.");
						},
						success:function(result){
							if(result == "success"){
								alert("글이 등록되었습니다.")
								location.reload();
							}
						}
					});
					$(wirteForm).submit();
				}
			});
			
			
			//update_content숨겨놓기
			$(".update_content").hide();
			$(".pwdChk").hide();
			//content_modify를 클릭했을 때(review수정)
			$(".content_modify").click(function(){
				$(this).parents("td").children(".content").hide();
				$(this).parents("td").children(".content_modify").hide();
				$(this).next(".pwdChk").show();
			});
			
			//delete_mobtn버튼을 클릭했을 때
			$(".delete_mobtn").click(function(){
				reset();
			});
			
			
			//첨부파일 이미지 보여주기 위한 속성 추가 #imgView
			var img = $("<img>");
			$(".imgView").hover(function(){
				img.attr({
					src:"/reviewFileUpload/",
					width:"450px",
					height:"200px"
				});
				img.addClass("imgViewData");
				$(".imgArea").append(img);
			}, function(){
				$(".imgViewData").remove();
			});
			
			//비밀번호 확인 버튼 클릭시 실질적인 처리 함수
			$(document).on("click", ".pwdBtn", function(){
				var re_pwd = $(this).parents(".pwdChk").children(".ree_pwd");
				var msg = $(this).next(".msg");
				var re_no = $(this).parents(".pwdChk").children(".re_no");
				var pwdChk = $(this).parents(".pwdChk"); //비밀번호 확인 div
				var update_content = $(this).parents("td").children(".update_content"); //update구간이 띄워질 곳
				var content_modify = $(this).parents("td").children(".content_modify"); //맨처음 보이는 modify버튼
				var content = $(this).parents("td").children(".content"); //원래 내용
				
				if(!chkSubmit($(re_pwd),"비밀번호를"))return;
				else{
					$.ajax({
						url:"/review/reviewConfirm",
						type:"POST",
						data:"re_no="+re_no.val()+"&re_pwd="+re_pwd.val(),
						dataType:"text",
						error:function(){
							alert("시스템 오류입니다. 관리자에게 문의하세요.");
						},
						success:function(resultData){
							if(resultData==0){
								msg.addClass("msg-error");
								msg.text("입력한 비밀번호가 일치하지 않습니다.").css("color","red");
							}else if(resultData==1){
								console.log("resultData = " +resultData);
								content.hide();
								content_modify.hide();
								pwdChk.hide();
								update_content.show();
								
							}
						}
					});
				}
			});
			
			//$(".update_mobtn")클릭시 업뎃
			$(".update_mobtn").click(function(){
				var tr = $(this).parents("tr");
				var Btn = $(this).parents(".update_content").next(".content_modify");
				var update_form = $(this).parents("#update_form");
				var re_content = $(this).parents("#update_form").children("#re_content");
				var re_no = $(this).parents("tr").attr("data-no");
				var re_file=$(this).parents("#update_form").children(".mo_file").children("#file");
				var content = $(this).parents("td").children(".content"); //원래 내용
				if(!chkSubmit($(re_content),"내용을")) return;
				else{
					if(confirm("수정 하시겠습니까?")) {
			            $(this).parent().click();
			        } else {
			            return false;
			        }
					$(update_form).ajaxForm({
						url:"/review/reviewUpdate",
						type:"post",
						enctype:"multipart/form-data",
						error:function(){
							alert("시스템 오류입니다. 관리자에게 문의하세요.");
						},
						success:function(result){
							if(result == "success"){
								alert("글이 수정되었습니다.");
								location.reload();
							}
						}
					});
					$(update_form).submit();
				}
			});
			
			//delete클릭 시 삭제 이벤트
			$(".comment_delete").click(function(){
				var retr = $(this).parents("tr").prev(".review_tr");
				var Ptr = $(this).parents("tr")//이벤트 발생 tr
				var curry = $(this).parents("tr").attr("data-no");
				if(confirm("삭제 하시겠습니까?")) {
		            $(this).parent().click();
		        } else {
		            return false;
		        }
				$.ajax({
					type:"delete",
					url:"/admin/review/"+curry,
					headers:{
						"Content-Type":"application/json",
						"X-HTTP-Method-Override":"DELETE"
					},
					dataType:"text",
					success:function(result){
						console.log("result="+result);
						if(result=="SUCCESS"){
							console.log(retr);	
							alert("삭제 완료되었습니다.");
							retr.remove();
							Ptr.remove();
						}
					}
				})
			});
			
			$("#files").on('change', function(){
                readURL(this);
            });
			
			//fieldset_insert
			$(".fieldset_insert").hide();
			$(".fieldset_modify").hide();
			
			//comment_insert
			$(".comment_insert").click(function(){
				$(".fieldset_insert").show();
				$(".fieldset_modify").hide();
				$(".showComment").hide();
			});
			
			//comment_insertBtn입력버튼
			$(".comment_insertBtn").click(function(){
				var commentInsertform = $(this).parents(".commentInsert_form");
				var insertTitle = $(this).parents(".comment_inner").children(".com_title");
				var insertContent = $(this).parents(".comment_inner").children(".com_content");
				if(!chkSubmit($(insertTitle),"제목을"))return;
				else if(!chkSubmit($(insertContent),"내용을"))return;
				else{
					if(confirm("글을 입력 하시겠습니까?")) {
			            $(this).parent().click();
			        } else {
			            return false;
			        }
					$.ajax({
						url:"/admin/recomment/recommentInsert",
						type:"post",
						data:$(commentInsertform).serialize(),
						dataType:"text",
						error:function(){
							alert("시스템 오류입니다. 관리자에 문의하세요.");
						},
						success:function(result){
							if(result=="success"){
								alert("입력 성공했습니다.");
								location.reload();
							}
						}
					})
				}
			})
			
			//comment_modify
			$(".comment_modify").click(function(){
				$(".fieldset_insert").hide();
				$(".fieldset_modify").show();
				$(".showComment").hide();
			});
			
			$(".comment_modifyBtn").click(function(){
				var commentModifyform = $(this).parents(".commentModify_form");
				var modifyTitle = $(this).parents(".comment_inner").children(".com_title");
				var modifyContent = $(this).parents(".comment_inner").children(".com_content");
				if(!chkSubmit($(modifyTitle),"제목을"))return;
				else if(!chkSubmit($(modifyContent),"내용을"))return;
				else{
					if(confirm("수정 하시겠습니까?")) {
			            $(this).parent().click();
			        } else {
			            return false;
			        }
					$.ajax({
						url:"/admin/recomment/recommentUpdate",
						type:"post",
						data:$(commentModifyform).serialize(),
						dataType:"text",
						error:function(){
							alert("시스템 오류입니다. 관리자에 문의하세요.");
						},
						success:function(result){
							if(result=="success"){
								alert("수정 성공했습니다.");
								location.reload();
							}
						}
					});
				}
			});
			
			//comment_incancel
			$(".comment_incancel").click(function(){
				reset();
				$(".showComment").show();
			});
			
			//comment_mocancel
			$(".comment_mocancel").click(function(){
				$(".fieldset_modify").hide();
				$(".showComment").show();
			});

		});
		//취소 
		function reset(){
			$(".fieldset_insert").hide();
			$(".fieldset_modify").hide();
			$(".fieldset_insert .comment_inner .com_title").val("");
			$(".fieldset_insert .comment_inner .com_content").val("");
		}
		
		function readURL(input){
			if(input.files && input.files[0]){
				var reader = new FileReader();
				
				reader.onload = function(e){
					 $('#blah').attr('src', e.target.result);
				}
				
				reader.readAsDataURL(input.files[0]);
			} 
		}
		 
		function goPage(page){
			if($("#search").val()=="all"){
				$("#keyword").val("");
			}
			$("#page").val(page);
			$("#f_search").attr({
				"method":"get",
				"action":"/admin/review/reviewList"
			});
			$("#f_search").submit();
		}
	</script>
<div id="m_review">
		<div id="pro_info_s3">
			<div class="board-hd">
				<h1 style="font-size: 24px;margin: 9px 0;">후기관리</h1>
			</div>
		</div>
		<div class="reviewTopBtn">
			<div class="top-allview" style="padding: 0 5px 0;">
				<a href="/admin/review/reviewList" class="board_btns">
					ALL VIEW
				</a>
			</div>
		</div>
		<!-- write작성 폼 -->
		<div class="review_write">
			<form id="write_form" enctype="multipart/form-data">
				<table>	
					<colgroup>
						<col width="15%">
						<col width="80%">
					</colgroup>
					<tbody>
						<tr>
							<th>
								<div class="tb-left">제목 : </div>
							</th>
							<td>
								<div class="tb-left frm-w"><input type="text" name="re_title" id="re_title" size="20" maxlength="30"></div>
							</td>
						</tr>
						<tr>
							<th><div class="tb-left">비밀번호 : </div></th>
							<td>
								<div class="tb-left frm-w"><input type="password" name="re_pwd" id="re_pwd" size="20" maxlength="30"></div>
							</td>
						</tr>
						<tr>
							<th><div class="tb-left">내용 : </div></th>
							<td>
								<div class="tb-left frm-w">
									<textarea rows="8" cols="120" id="re_content" name="re_content"></textarea>
								</div>
								
							</td>
						</tr>
						<tr>
							<th class="tb-left frm-w">첨부파일 : </th>
							<td>
								<div class="file_div">
									<input type="file" id="files" name="files" multiple><br>
									<img id="blah" src="#" alt="your image" style="float:left; padding-top:10px;"/>
								</div>
								<div class="write_btn" style="cursor: pointer;">
									<img src="/resources/include/image/reviewimage/write_review.gif" >
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		<!-- 리뷰 뜨는 곳 -->
		<form id="review_detail" name="review_detail">
			<input type="hidden" id="re_no" name="re_no">
		</form>
		<div class="table-slide review-list">
			<table>
				<colgroup>
					<col width="10%">
					<col width="64%">
					<col width="12%">
					<col width="14%">
				</colgroup>
				<thead>
					<tr>
						<th>
							<div class="tb_board">번호</div>
						</th>
						<th>
							<div class="tb_board">제목</div>
						</th>
						<th>
							<div class="tb_board">작성자</div>
						</th>
						<th>
							<div class="tb_board">등록일</div>
						</th>
					</tr>
				</thead>
				<tbody id="retbody">
					<c:choose>
						<c:when test="${not empty reviewList }">
							<c:forEach var="review" items="${reviewList }">
								<tr data-num="${review.re_no }" class="review_tr">
									<td>${review.re_no }</td>
									<td class="goDetail">
										${review.re_title }
										<c:forEach items="${review.re_chk }">
											<c:if test="${review.re_chk == 1 }">
												(<label style="color:red">답변완료</label>)
											</c:if>
											<c:if test="${review.re_chk ==0}">
												(<label style="color:red">답변대기</label>)
											</c:if>
										</c:forEach>
										
									</td>
									<td class="name">${review.re_name }님</td>
									<td>${review.re_date }</td>
								</tr>
								<tr class="find_review" data-no="${review.re_no }">
									<td colspan="4">
									
										<div class="content">
											-review : ${review.re_content }
											<div class="reviewImg">
												<c:if test="${not empty reviewImgList }">
														<c:forEach var="reviewImg" items="${reviewImgList}">
															<c:if test="${review.re_no eq reviewImg.re_no }">
																<img src="/reviewFileUpload/${reviewImg.ri_file }" style="width:105px; height:75px;">
															</c:if>
														</c:forEach>
												</c:if>
											</div>
										</div>
										<div class="update_content">
											<form id="update_form">
												<input type="hidden" name="re_no" id="re_no" value="${review.re_no }">
												<textarea rows="8" cols="70" id="re_content" name="re_content">${review.re_content }</textarea>
												<div class="mo_file"> 
													<input type="file" id="files" name="files" style="padding-top:8px;" multiple><br />
													<div class="imgView" style="padding-top:14px;">
														<span style="color:red;">기존 이미지 파일 : </span><br />
														<div class="reviewImg">
															<c:if test="${not empty reviewImgList }">
																<c:forEach var="reviewImg" items="${reviewImgList}">
																	<c:if test="${review.re_no eq reviewImg.re_no }">
																		<img src="/reviewFileUpload/${reviewImg.ri_file }">
																	</c:if>
																</c:forEach>
															</c:if>
														</div>
														<span class="imgArea"></span>
													</div>
												</div>
												<!-- <div class="modify_addFile">
													<a href="#this" class="btn" id="addFile">파일 추가</a>
												</div><br> -->
												<div class="update_mobtn">modify</div>
												<div class="delete_mobtn">cancel</div>
											</form>
										</div>
										<!-- <div class="content_modify">modify</div> -->
										
										<%--==========비밀번호 확인 버튼 및 버튼 추가 시작======== --%>
										<div class="pwdChk">
											<input type="hidden" name="re_no" class="re_no" value="${review.re_no }">
											<label for="r_pwd" class="l_pwd">비밀번호 : </label>
											<input type="password" name="ree_pwd" class="ree_pwd">
											<input type="button" class="pwdBtn" value="확인">
											<span class="msg"></span>
										</div>
										
										<!-- 관리자 코멘트가 시작되는 구간 -->
										<div class="reviewcomment-list">
											<h3>COMMENT LIST</h3>
											<div class="comment-cover">
												<div class="comment-content">
													<div class="content-top">
														<a href="javascript:;" class="comment_insert">INSERT</a>
														<a href="javascript:;" class="comment_modify">MODIFY</a>
														<a href="javascript:;" class="comment_delete">DELETE</a>
													</div>
													<div class="fieldset_insert">
														<form class="commentInsert_form" data-num="${review.re_no }">
															<fieldset>
																<legend>comment 입력</legend>	
																<input type="hidden" id="re_no" name="re_no" value="${review.re_no }">
																<div class="comment_inner">
																	<label>제목 : </label>
																	<input type="text" class="com_title" name="com_title">
																	<br />
																	
																	<label>내용 : </label>
																	<textarea class="com_content" name="com_content"></textarea>						
																	<a href="javascript:;" class="comment_insertBtn">
																		등록
																	</a>
																	<a href="javascript:;" class="comment_incancel">
																		취소
																	</a>
																</div>
															</fieldset>
														</form>
													</div>
													<div class="fieldset_modify">
														<form class="commentModify_form" data-num="${review.re_no }">
															<fieldset>
																<legend>comment 수정</legend>	
																<c:if test="${not empty recommentList }">
																	<c:forEach items="${recommentList }" var="recomment">
																		<c:if test="${review.re_no eq recomment.re_no }">
																			<input type="hidden" id="re_no" name="re_no" value="${review.re_no }">
																			<input type="hidden" id="com_no" name="com_no" value="${recomment.com_no }">
																			<div class="comment_inner">
																				<label>제목 : </label>
																				<input type="text" class="com_title" name="com_title" value="${recomment.com_title }">
																				<br />
																				
																				<label>내용 : </label>
																				<textarea class="com_content" name="com_content">${recomment.com_content }</textarea>						
																				<a href="javascript:;" class="comment_modifyBtn">
																					수정
																				</a>
																				<a href="javascript:;" class="comment_mocancel">
																					취소
																				</a>
																			</div>
																		</c:if>
																	</c:forEach>
																</c:if>
															</fieldset>
														</form>
													</div>
													<div class="showComment">
														<c:if test="${not empty recommentList }">
															<c:forEach items="${recommentList }" var="recomment">
															<c:if test="${review.re_no eq recomment.re_no }">
																<div style="color:#BDBDBD">AON&nbsp;&nbsp;&nbsp; ${recomment.com_date }</div>
																<div class="com_title" style="padding-top:10px;"> 
																	<label>제목 : </label>${recomment.com_title }
																</div>
																<div class="com_content" style="padding-top:10px;">
																	<label>내용 : </label>${recomment.com_content }	
																</div>
															</c:if>
															</c:forEach>
														</c:if>
													</div>
												</div>
					
											</div>
										</div>
									</td>
								</tr>
							</c:forEach>
							<tr class="page_tr">
								<td colspan="4" id = "pageLow">
									<c:if test = "${reviewVO.totalPage < reviewVO.pageNum }">
										<c:set var = "pNum" value= "${reviewVO.totalPage }"/>
									</c:if>
									<c:if test = "${reviewVO.totalPage >= reviewVO.pageNum }">
										<c:set var = "pNum" value= "${reviewVO.pageNum }"/>
									</c:if>
									
									<c:if test = "${reviewVO.pageTotal[0] eq 1 and pNum eq 1}" >
										<span class = "icon-angle-double-left"></span>
									</c:if>
									<c:if test = "${reviewVO.pageTotal[0] eq 1 and pNum ne 1}" >
										<a href = "/admin/review/reviewList?pageNum=1" data-num = "1" class = "icon-angle-double-left"></a>
									</c:if>
									<c:if test = "${reviewVO.pageTotal[0] ne 1}" >
										<a href = "/admin/review/reviewList?pageNum=1" data-num = "1" class = "icon-angle-double-left"></a>
									</c:if>
									<c:if test = "${reviewVO.pageTotal[0] eq 1}" >
										<span class = "icon-angle-left"></span>
									</c:if>
									<c:if test = "${reviewVO.pageTotal[0] ne 1}" >
										<a href = "/admin/review/reviewList?pageNum=${reviewVO.pageTotal[0] - fn:length(reviewVO.pageTotal) }" data-num = "${reviewVO.pageTotal[0] - fn:length(reviewVO.pageTotal) }" class = "icon-angle-left"></a>
									</c:if>
						
								
									<c:forEach items="${reviewVO.pageTotal }" varStatus="status">
										<c:if test = "${reviewVO.pageTotal[status.index] eq pNum}" >
											<span>${reviewVO.pageTotal[status.index] }</span>
										</c:if>
										<c:if test = "${reviewVO.pageTotal[status.index] ne pNum}" >
											<a href = "/admin/review/reviewList?pageNum=${reviewVO.pageTotal[status.index] }" data-num = "${reviewVO.pageTotal[status.index]}">
						 						${reviewVO.pageTotal[status.index] } 
											</a>
										</c:if>
									</c:forEach>
		
									<c:if test = "${reviewVO.pageTotal[fn:length(reviewVO.pageTotal) - 1] eq reviewVO.totalPage}" >
										<span class = "icon-angle-right"></span>
									</c:if>
									<c:if test = "${reviewVO.pageTotal[fn:length(reviewVO.pageTotal) - 1] ne reviewVO.totalPage}" >
										<a href = "/admin/review/reviewList?pageNum=${reviewVO.pageTotal[0] + fn:length(reviewVO.pageTotal) }" data-num = "${reviewVO.pageTotal[0] + fn:length(reviewVO.pageTotal) }" class = "icon-angle-right"></a>
									</c:if>
									<c:if test = "${reviewVO.pageTotal[fn:length(reviewVO.pageTotal) - 1] eq reviewVO.totalPage and reviewVO.totalPage eq pNum}" >
										<span class = "icon-angle-double-right"></span>
									</c:if>
									<c:if test = "${reviewVO.pageTotal[fn:length(reviewVO.pageTotal) - 1] eq reviewVO.totalPage and reviewVO.totalPage ne pNum}" >
										<a href = "/admin/review/reviewList?pageNum=${reviewVO.totalPage }" data-num = "${reviewVO.totalPage }" class = "icon-angle-double-right"></a>
									</c:if>
									<c:if test = "${reviewVO.pageTotal[fn:length(reviewVO.pageTotal) - 1] ne reviewVO.totalPage}" >
										<a href = "/admin/review/reviewList?pageNum=${reviewVO.totalPage }" data-num = "${reviewVO.totalPage }" class = "icon-angle-double-right"></a>
									</c:if>
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr class="other">
								<td colspan="4">
									<div class="tb-center">등록된 리뷰가 없습니다.</div>
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>