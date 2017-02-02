<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/include/css/reset.css">
	<style type = "text/css">
		.step-panels{
			display: block;
			width : 100%;
		}
		#align{
			width : 99%;
			clear : both;
			text-align: center;
			margin: 0 auto;
		}
		.step {
			display : table;
			text-align : center;
			letter-spacing: -1px;
			height: 37px;
			float: left;
			width : 33%;
			border: 1px solid gray;
		}
		.step span{
			vertical-align: middle;
			display: table-cell;
		}
	</style>
</head>
<body>
	<div class = "main">
		<h2 id = "aTitle">회원가입</h2>
		<div class = "step-panels">
			<div id = "align">
				<div class = "step">
					<span>본인인증</span>
				</div>
				<div class = "step">
					<span>회원정보 입력</span>
				</div>
				<div class = "step">
					<span>가입 완료</span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>