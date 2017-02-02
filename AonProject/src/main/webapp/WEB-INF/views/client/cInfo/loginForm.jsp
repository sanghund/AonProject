<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
</head>
<body>
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
					<div class = "searchIdPwd">
						<a href = "#">아이디/비밀번호 찾기</a>
					</div>
					<div id ="memberLoginBtn" class = "loginBtn">
						<input type = "button" id = "gogoM" value="로그인">
					</div>
				</form>
			</div>
			<div id = "nonMemberLoginForm">
				<h3>
					비회원 로그인
					<small>주문시 입력하신 이메일과 주문 번호로 주문내역을 확인하실수 있습니다.</small>
				</h3>
				<form id = "nonmemberLoginGo">
					<div class = "loginId">
						<input type = "text" id = "nonmemberId" name = "nonmemberId">
					</div>
					<div class = "loginPwd">
						<input type = "password" id = "nonmemberPwd" name = "nonmemberPwd">
					</div>
					<div id ="memberLoginBtn" class = "loginBtn">
						<input type = "button" id = "gogoNM" value="로그인">
					</div>
				</form>
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
			$("#gogoM").click(function(){
				$.ajax({
					url : "/mloginChk",
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
						if(url == "") url = '<c:url value="/"/>';
						location.href = url; 
					}
				})	
			});
			
			
			$("#newJoin").click(function(){
				location.href = "/join"
			});
		});
	</script>
</body>
</html>