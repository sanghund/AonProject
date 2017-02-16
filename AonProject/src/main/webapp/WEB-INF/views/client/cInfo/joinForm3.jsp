<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
	<style type = "text/css">
		.step-panels{
			display: block;
			width : 100%;
			clear : both;
			height: 37px;
			
		}
		#aTitle {
			font-size: 25px;
			padding : 10px 0;
			padding-left : 5px;
			border : 1px solid graytext;
			display: block;
			border-bottom: 1px solid #73879C;
			margin-bottom: 15px;
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
		
		#celebration{
			margin : 50px 0;
			clear: both;
		}
		#ttt{
			text-align: center;
			font-size: 30px;
			font-weight: bold;
		}
	</style>
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
				<div class = "step action">
					<span>가입 완료</span>
				</div>
			</div>
		</div>
		<div id = "celebration">
			<div>
				<div id = "ttt">회원가입을 축하드립니다!</div>
			</div>		
		</div>
	</div>
</body>
</html>