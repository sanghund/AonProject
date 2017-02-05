<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">   
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
<link rel="shortcut icon" href="../image/icon.png" />
<link rel="apple-touch-icon" href="../image/icon.png" />
<!--IE8이하 적용/--> 
<!--[if lt IE 9]>
   <script src="./js/html5shiv.js"></script>
<![endif]--> 
<title>Insert title here</title>
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
				return false;
	           
			}); 
			
			//비밀번호 영역 닫기
			$(".fieldset").hide();
			
			//글 입력폼띄우기
			$(".review_write").hide();
			$(".write_button").click(function(){
				$(".review_write").show();
				$(".find_review").find("td").hide();
				
			});
			
			//파일 추가
			$(".addFile").click(function(){
				fn_addFile();
			});
			$(".modify_addFile").click(function(){
				mofn_addFile();
			});
			
			
			//write버튼을 클릭했을 때 입력
			$(".write_btn").click(function(){
				if(!chkSubmit($("#re_title"),"제목을"))return;
				else if(!chkSubmit($("#re_pwd"),"비밀번호를"))return;
				else if(!chkSubmit($("#re_content"),"내용을"))return;
				else if(!chkFile($("#file"),"첨부파일 입력해서요.(이미지 파일만 등록가능합니다.)"))return;
				else{
					$("#write_form").attr({
						"method":"post",
						"action":"/review/reviewInsert.do"
					});
					$("#write_form").submit();
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
			
			
			
			//첨부파일 이미지 보여주기 위한 속성 추가 #imgView
			var img = $("<div>");
			$(".imgView").hover(function(){
				img.attr({
					src:"/UploadStorage/${review.re_file}",
					width:"450px",
					height:"200px"
				});
				img.addClass("imgViewData");
				$(".imgArea").append(img);
			}, function(){
				img.remove();
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
						url:"/review/reviewConfirm.do",
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
						url:"/review/reviewUpdate.do",
						type:"post",
						enctype:"multipart/form-data",
						error:function(){
							alert("시스템 오류입니다. 관리자에게 문의하세요.");
						},
						success:function(result){
							console.log(result);
							update_form.hide();
							content.show();
							Btn.show();
							
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
					url:"/review/"+curry+".do",
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
		});
		
		 function fn_addFile(){
	            var str = "<div><br><input type='file' id='file_"+(gfv_count)+"' name='file_"+(gfv_count++)+"'>"+
	            		  "<a href='#this' class='fileDeleteBtn' id='delete_"+(gfv_count)+"' name='delete_"+(gfv_count)+"'>삭제</a></div>";
	            $(".file_div").append(str);
	            $("#delete_"+(gfv_count++)).on("click", function(e){ //삭제 버튼
	                e.preventDefault();
	                fn_deleteFile($(this));
	            });
	        }
		 function fn_deleteFile(obj){
	            obj.parent().remove();
	        }
		 
		 function mofn_addFile(){
			 var str = "<div><br><input type='file' id='file_"+(gfv_count)+"' name='file_"+(gfv_count++)+"'>"+
			   		   "<a href='#this' class='fileDeleteBtn' id='delete_"+(gfv_count)+"' name='delete_"+(gfv_count)+"'>삭제</a></div>";
			    $(".mo_file").append(str);
			    $("#delete_"+(gfv_count++)).on("click", function(e){ //삭제 버튼
			       e.preventDefault();
			       fn_deleteFile($(this));
   				});
		    }
		 
	</script>
</head>
<body>
	<div id="m_review">
		<div id="pro_info_s3">
			<div class="board-hd">
				<img id="review" src="/resources/image/tit_review.gif">
			</div>
		</div>
		<div class="btn">
			<a href="/review/reviewList.do" class="board_btns">
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
									<input type="file" id="file" name="file" multiple>
								</div>
								<div class="write_btn" style="cursor: pointer;">
									<img src="/resources/image/write_review.gif" >
								</div>
								<div class="addFile">
									 <a href="#this" class="btn" id="addFile">파일 추가</a>
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
										${review.re_title }(${review.re_chk })
									</td>
									<td class="name"></td>
									<td>${review.re_date }</td>
								</tr>
								<tr class="find_review" data-no="${review.re_no }">
									<td colspan="4">
									
										<div class="content">
											${review.re_content }<br /><br /><br />
											<%-- <img src="/UploadStorage/${review.re_file }"/> --%>
										</div>
										<div class="update_content">
											<form id="update_form">
												<input type="hidden" name="re_no" id="re_no" value="${review.re_no }">
												<textarea rows="8" cols="70" id="re_content" name="re_content">${review.re_content }</textarea>
												<div class="mo_file"> 
													<input type="file" id="file" name="file" style="padding-top:8px;">&nbsp;
													<label class="imgView" style="padding-top:14px;">기존 이미지 파일 : ${review.re_file}<span class="imgArea"></span></label>
												</div>
												<div class="modify_addFile">
													<a href="#this" class="btn" id="addFile">파일 추가</a>
												</div><br>
												<div class="update_mobtn">modify</div>
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
														<strong class="name"> AON</strong>
														<span class="date">2016.09.29 / PM : 06:46</span>
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
																<a href="javascript:;" class="update_btn"><img src="/resources/image/button/btn_comment_modify.gif"></a>
																<a href="javascript:;" class="cancle_btn"><img src="/resources/image/button/btn_comment_cancel.gif"></a>
															</p>
														</fieldset>
													</div>
													<p class="commentp">
														<span class="c-content">
															안녕하세요! 러브이즈트루입니다.<br>
															<br>
															<br>
															먼저, 상품을 잘 확인하고 보냈어야 했는데 불편을 드려 정말 죄송합니다.<br>
															<br>
															고객님께서 원하시는 방법으로 처리도와드리겠으며 <br>
															<br>
															내일 일찍 연락드리겠습니다.<br>
															<br>
															다시 한 번 죄송합니다.<br>
															<br>
															<br>
															더욱 노력하고 개선해나가는 러브이즈트루가 되도록 하겠습니다.<br>
															<br>
														</span>						
													</p>
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
</body>
</html>