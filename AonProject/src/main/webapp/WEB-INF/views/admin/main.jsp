<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
</head>
<body>
	${vo.a_id }님<br />
	<input type = "button" id = "logOut" value="로그아웃">
	<input type="button" value="신규가입" id = "gogo">
	<script src = "/resources/include/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#logOut").click(function(){
				location.href = "/admin/logout";
			});
			
			$("#gogo").click(function(){
				location.href = "/admin/joinForm";
			});
		});
	</script>
</body>
</html>