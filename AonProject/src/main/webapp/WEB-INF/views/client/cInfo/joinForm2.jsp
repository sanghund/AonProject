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
			clear : both;
			height: 37px;
			
		}
		#align{
			width : 99%;
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
		.step:FIRST-CHILD{
			border-right: none;
		}
		.step:LAST-CHILD{
			border-left:none;
			clear : right;
			
		}
		.step span{
			vertical-align: middle;
			display: table-cell;
		}
		.step.action {
			background-color: black;
			color : white;
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
				<div class = "step action">
					<span>회원정보 입력</span>
				</div>
				<div class = "step">
					<span>가입 완료</span>
				</div>
			</div>
		</div>
	</div>
	
	<script src = "/resources/include/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			
		});
	</script>
</body>
</html>