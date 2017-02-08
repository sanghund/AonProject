<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<style type = "text/css">
	.main{
		box-sizing: border-box;
	}
	
	.main table{
		width: 720px;
		margin: 0 auto;
		border: 1px solid gray;
		height: 240px;
	}
	.main table:FIRST-CHILD{
		margin-top : 30px;
		margin-bottom: 50px;
	}
	.main table tr > *{
		vertical-align: middle;
		
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
	.maybe{
		width: 75px;
		font-size: 15px;
		padding: 10px 5px;
		border : 1px solid black;
		background-color: white;
		cursor: pointer;
		
	}
	.main tr th{
		border-bottom: 1px solid gray;
	}
	.main h4{
		font-weight: bold;
		display : inline-block;
		font-size: 18px;
		border-bottom: 1px solid black;
		margin-bottom: 6px; 
	}
	.main tr td:eq(1){
		text-align: center;
	}
</style>
<div class="main">
	<h2 id = "aTitle">MyPage</h2>
	<div id = "lostId">
		<form id = "idGO">
			<table>
				<colgroup>
					<col width="65%">
					<col width="35%">		
				</colgroup>
				<tr>
					<th colspan="2">
						<h4>아이디 찾기</h4>
						<div>이름과 이메일로 아이디 확인이 가능합니다.</div>
					</th>				
				</tr>
				<tr>
					<td><label for="in">이름</label><input type = "text" class = "pnn" id = "in" name = "m_name"></td>
					<td rowspan="2"><input type = "button" value="확인" id = "maybeErrorBtn1" class = "maybe"></td>
				</tr>
				<tr>
					<td><label for = "ie">이메일</label><input type = "text" id = "ie" class = "pee" name = "m_email"></td>
				</tr>
			</table>
		</form>
	</div>
	<div id= "lostPwd">
		<form id = "pwdGO">
			<table>
				<colgroup>
					<col width="65%">
					<col width="35%">		
				</colgroup>
				<tr>
					<th colspan="2">
						<h4>비밀번호 찾기</h4>
						<div>아이디와 이메일로 새로운 비밀번호를 보내드립니다.</div>
					</th>				
				</tr>
				<tr>
					<td><label for="pn">이름</label><input type = "text" class = "pnn" id = "pn" name = "m_id"></td>
					<td rowspan="2"><input type = "button" value="확인" id = "maybeErrorBtn2" class = "maybe"></td>
				</tr>
				<tr>
					<td><label for = "pe">이메일</label><input type = "text" id = "pe" class = "pee" name = "m_email"></td>
				</tr>
			</table>
		</form>
	</div> 
</div>