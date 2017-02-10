<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div class = "main">
		<h2 id = "aTitle">Aon</h2>
		<div class = "loginBox">
			<div id = "memberLoginForm">
				<h3>
					회원 로그인
					<small>회원 아이디와 비밀번호를 입력하세요.</small>
				</h3>
				<form id = "memberLoginGo">
					<div class = "loginId">
						<input type = "text" id = "memberId" name = "memberId">
					</div>
					<div class = "loginPwd">
						<input type = "password" id = "memberPwd" name = "memberPwd">
					</div>
				</form>
				<div class = "searchIdPwd">
					<a id = "lost" href = "/member/lostme">아이디/비밀번호 찾기</a>
				</div>
				<div id ="memberLoginBtn" class = "loginBtn">
					<input type = "button" id = "gogoM" value="로그인">
				</div>
			</div>
		</div>
		<div class = "joinBox">
			<h3>아직 AON 회원이 아니신가요?</h3>
			<div id = "joinLine">
				<input type = "button" id = "newJoin" value="회원가입 바로가기">
			</div>
		</div>
	</div>
	
	<script src = "/resources/include/js/jquery-1.12.4.min.js"></script>
	<script type = "text/javascript">
		$(document).ready(function(){
			$("#lost").click(function(event){
				event.preventDefault();
				location.href = "/member/lostme";
			});
			$("#gogoM").click(function(){
				$.ajax({
					url : "/member/loginChk",
					data : $("#memberLoginGo").serialize(),
					type : "post",
					dataType : "json",
					beforeSend: function(xhr) { 
						xhr.setRequestHeader("Accept", "application/json"); 
					}
				}).done(function(body){
					var message = body.response.message; 
					var error = body.response.error; 
					var returnUrl = body.response.returnUrl;
					
					if (error) alert(message); 
					if (error == false) {
						var url = '${referer}'; 
						if(url == '') url = returnUrl;
						if(url == "") url = document.referrer;
						location.href = url; 
					}
				})	
			});
			
			
			$("#newJoin").click(function(){
				location.href = "/member/join"
			});
		});
	</script>