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
		height: 200px;
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
	.lll{
		text-align: center;
	}
	label{
		width : 45px;
		display:inline-block;
		margin-right: 10px;
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
					<td class= "lll"><label for="in">이름</label><input type = "text" class = "pnn" id = "in" name = "m_name"></td>
					<td rowspan="2"><input type = "button" value="확인" id = "maybeErrorBtn1" class = "maybe"></td>
				</tr>
				<tr>
					<td class= "lll"><label for = "ie">이메일</label><input type = "text" id = "ie" class = "pee" name = "m_email"></td>
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
					<td class= "lll"><label for="pn">아이디</label><input type = "text" class = "pnn" id = "pn" name = "m_id"></td>
					<td rowspan="2"><input type = "button" value="확인" id = "maybeErrorBtn2" class = "maybe"></td>
				</tr>
				<tr>
					<td class= "lll"><label for = "pe">이메일</label><input type = "text" id = "pe" class = "pee" name = "m_email"></td>
				</tr>
			</table>
		</form>
	</div> 
</div>
<script src = "/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		$("#maybeErrorBtn1").click(function(){
			$.ajax({
				url : "/member/lostIdChk",
				type : "post",
				dataType : "text",
				data : $("#idGO").serialize(),
				error : function(){
					alert("시스템 에러입니다.");
				},
				success : function(result){
					if(result == "success"){
						$.ajax({
							url : "/member/sendId",
							type : "post",
							dataType : "text",
							data : $("#idGO").serialize(),
							error : function(){
								alert("시스템 에러입니다.");
							},
							success : function(result2){
								if(result2 == "success"){
									alert("이메일로 아이디가 전송되었습니다.");
									location.reload();
								}
								else{
									alert("시스템 에러입니다.");
								}
							}
						});
					}
					else{
						alert("입력하신 정보와 일치하는 정보가 존재하지 않습니다.");
					}
				}
			});
		});
		
		$("#maybeErrorBtn2").click(function(){
			$.ajax({
				url : "/member/lostPwdChk",
				type : "post",
				dataType : "text",
				data : $("#pwdGO").serialize(),
				error : function(){
					alert("시스템 에러입니다.");
				},
				success : function(result){
					if(result == "success"){
						$.ajax({
							url : "/member/sendPwd",
							type : "post",
							dataType : "text",
							data : $("#pwdGO").serialize(),
							error : function(){
								alert("시스템 에러입니다.");
							},
							success : function(result2){
								if(result2 == "success"){
									alert("이메일로 임시 비밀번호가 전송되었습니다.");
									location.reload();
								}
								else{
									alert("시스템 에러입니다.");
								}
							}
						});
					}
					else{
						alert("입력하신 정보와 일치하는 정보가 존재하지 않습니다.");
					}
				}
			});
		});
	});
</script>