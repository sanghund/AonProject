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
	<div class="main">
   	 <h2>Admin Login</h2>
   	 <form id="gogoLogin" name="gogoLogin">
        	<div>
        		<label for="adminId">아이디</label>
        		<input type="text" style="width: 145px;" id="adminId" name="adminId" maxlength="20" />
        	</div>
        	<div>
        		<label for="adminPwd">비밀번호</label>
        		<input type="password" style="width: 145px;" id="adminPwd" name="adminPwd" maxlength="20" />
        	</div>
        	<div>
        		<input type="button" id="loginBtn" value="로그인" />
        	</div>
    	</form>
    	<div id="loginError"></div>
	</div>
	
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