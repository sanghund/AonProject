<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>로그인 페이지</title>
</head>
<body>
	<h2>관리자 로그인</h2>
	<form id = "gogoLogin" method = "post" action="/admin/loginChk">
		아이디 <input type="text" style="width: 145px;" id= "adminId" name = "adminId" /><br />
		비밀번호 <input type="password" style="width: 145px;" id= "adminPwd" name = "adminPwd" /><br />
		<input type="button" id = "loginBtn" value = "로그인" />
	</form>
	<div id="loginError"></div>
	
	<script src = "/resources/include/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#loginBtn").click(function(){
				$.ajax({
					url : "/admin/loginChk",
					data : $("#gogoLogin").serialize(),
					type : "post",
					dataType : "json",
					beforeSend: function(xhr) { 
						xhr.setRequestHeader("Accept", "application/json"); 
					}
				}).done(function(body){
					var message = body.response.message; 
					var error = body.response.error; 
					var returnUrl = body.response.returnUrl;
					
					if (error) $("#loginError").text(message); 
					if (error == false) {
						alert(message);
						var url = '${referer}'; 
						if(url == '') url = returnUrl;
						if(url == "") url = '<c:url value="/admin/main"/>';
						location.href = url; 
					}
				})
			});
		});
	</script>
</body>
</html>