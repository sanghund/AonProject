<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
</head>
<body>
	<h2>관리자 로그인</h2>
	<form id = "gogoLogin" method = "post" action="/admin/loginChk">
		아이디 <input type="text" style="width: 145px;" id= "adminId" name = "adminId" /><br />
		비밀번호 <input type="password" style="width: 145px;" id= "adminPwd" name = "adminPwd" /><br />
		<input type="submit" id = "loginBtn" value = "로그인" />
	</form>
</body>
</html>