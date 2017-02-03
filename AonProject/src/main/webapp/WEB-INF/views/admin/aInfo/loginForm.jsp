<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>A O N !</title>
	<link href="/resources/include/css/reset.css" rel="stylesheet">
	<link href="/resources/include/css/adminCss/loginForm.css" rel="stylesheet">
</head>
<body>
	<div class="main">
   	 <h2 id = "adT">Admin Page</h2>
   	 <form id="gogoLogin" name="gogoLogin">
        	<div>
        		<input type="text" placeholder="ID" id="adminId" name="adminId" maxlength="20" />
        	</div>
        	<div>
        		<input type="password" placeholder="Password" id="adminPwd" name="adminPwd" maxlength="20" />
        	</div>
    	</form>
    	<div>
        	<input type="button" id="loginBtn" value="login" />
        </div>
    	<div id="loginError"></div>
	</div>
	
	<script src = "/resources/include/js/jquery-1.12.4.min.js"></script>
	<script src = "/resources/include/js/inputChk.js"></script>
	<script type="text/javascript">
		document.addEventListener('keydown', function (e) {
    		if(e.keyCode == 13){
    			document.getElementById("loginBtn").click();
    		}
		});
	
		$(document).ready(function(){
			$("#adminId").blur(function(){
				vacuumChk2($("#adminId"), $("#loginError"));
			});
		$("#adminPwd").blur(function(){
			vacuumChk2($("#adminPwd"), $("#loginError"));
		});
		
		$("#loginBtn").click(function(){
			if(!vacuumChk($("#adminId"), "아이디를", $("#loginError"), true)) return;
			else if (!vacuumChk($("#adminPwd"), "비밀번호를", $("#loginError"), true)) return;
			else{
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
					
					if (error) $("#loginError").html("<span>"+message+"</span>"); 
					if (error == false) {
						var url = '${referer}'; 
						if(url == '') url = returnUrl;
						if(url == "") url = '<c:url value="/admin/main"/>';
						location.href = url; 
					}
				})	
			}
		});
	});
	</script>
</body>
</html>