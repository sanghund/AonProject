<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
				hideData.slideUp(300);	
				$(".review_write").hide();
				reset();
				return false;
	           
			}); 
			
			//비밀번호 영역 닫기
			/* $(".fieldset").hide(); */
			//comment구역 숨기기
			
			
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
				/* else if(!chkFile($("#files"),"첨부파일 입력해서요.(이미지 파일만 등록가능합니다.)"))return; */
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
			/* var img = $("<img>");
			$(".imgView").hover(function(){
				img.attr({
					src:"/reviewUpload/",
					width:"450px",
					height:"200px"
				});
				img.addClass("imgViewData");
				$(".imgArea").append(img);
			}, function(){
				$(".imgViewData").remove();
			}); */
			
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
			$(".delete").click(function(){
				var retr = $(this).parents("tr").prev(".review_tr");
				var Ptr = $(this).parents("tr")//이벤트 발생 tr
				var curry = $(this).parents("tr").attr("data-no");
				$.ajax({
					type:"delete",
					url:"/review/"+curry,
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
		});
		    
		//취소 
		function reset(){
			$(".update_content").hide();
			$(".content").show();
			$(".content_modify").show();
			$(".ree_pwd").val("");
			$("input[type='text']").val("");
			$("#write_form textarea").val("");
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
		 
	</script>
<div id="m_review">
		<div id="pro_info_s3">
			<div class="board-hd">
				<img id="review" src="/resources/include/image/reviewimage/tit_review.gif">
			</div>
		</div>
		<div class="reviewTopBtn">
			<a href="admin/review/reviewList" class="board_btns">
				ALL VIEW
			</a>
			<div class="write_button">
				WRITE
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
									<textarea rows="8" cols="70" id="re_content" name="re_content"></textarea>
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
								<!-- <div class="addFile">
									 <a href="#this" class="btn" id="addFile">파일 추가</a>
								</div> -->
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
										${review.re_title }(${review.re_chk })
									</td>
									<td class="name"></td>
									<td>${review.re_date }</td>
								</tr>
								<tr class="find_review" data-no="${review.re_no }">
									<td colspan="4">
									
										<div class="content">
											${review.re_content }
											<div class="reviewImg">
												<c:if test="${not empty reviewImgList }">
														<c:forEach var="reviewImg" items="${reviewImgList}">
															<c:if test="${review.re_no eq reviewImg.re_no }">
																<img src="/reviewUpload/${reviewImg.ri_file }" style="width:105px; height:75px;">
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
																		<img src="/reviewUpload/${reviewImg.ri_file }">
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
										<div class="content_modify">modify</div>
										
										<%--==========비밀번호 확인 버튼 및 버튼 추가 시작======== --%>
										<div class="pwdChk">
											<input type="hidden" name="re_no" class="re_no" value="${review.re_no }">
											<label for="r_pwd" class="l_pwd">비밀번호 : </label>
											<input type="password" name="ree_pwd" class="ree_pwd">
											
											<input type="button" class="pwdBtn" value="확인">
											<span class="msg"></span>
										</div>
										
										<!-- 관리자 코멘트가 시작되는 구간 -->
										<div class="comment-list">
											<h3>COMMENT LIST</h3>
											<div class="comment-cover">
												<div class="comment-content">
													<div class="content-top">
														<c:if test="${not empty recommentList }">
															<c:if test="${review.re_no eq recomment.re_no }">
																<div class="name"> ${recomment.com_title }</div>
																<div class="date">${recomment.com_date }</div>
															</c:if>
														</c:if>
														<a href="javascript:;" class="modify">MODIFY</a>
														<a href="javascript:;" class="delete">DELETE</a>
													</div>
													<div class="fieldset">
														<fieldset>
															<legend>댓글 수정</legend>	
															<p>
																비밀번호
																<input  type="password" id="comment_password" name="comment_password">
															</p>
															<p>
																<textarea id="comment_modify" name="comment_modify"></textarea>						
																<a href="javascript:;" class="update_btn"><img src="/resources/include/image/reviewimage/button/btn_comment_modify.gif"></a>
																<a href="javascript:;" class="cancle_btn"><img src="/resources/include/image/reviewimage/button/btn_comment_cancel.gif"></a>
															</p>
														</fieldset>
													</div>
													<div class="commentp">
														<span class="c-content">
														<c:if test="${review.re_no eq recomment.re_no }">
															${recomment.com_content }
														</c:if>
														</span>						
													</div>
												</div>
												
												<!-- 회원 로그인 시 없어질 구간 -->
												<div class="comment-write">
													<div class="comment-p">
														<p style="color:#999;font-size:11px">( 회원 로그인이 필요한 기능입니다 )</p>
													</div>	
												</div>
											</div>
										</div>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
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