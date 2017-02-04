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
		.showText{
			margin : 50px 0;
			clear: both;
		}
		.emailCertification small{
			display: block;
		}
		
		#backLayer{
			display: none; position: fixed; left: 0; top: 0;
			height: 100%; width: 100%; background-color: rgba(0,0,0,0.75);
			opacity: 0.8;
		}
		#mainLayer{
			width : 720px;
			display: none;
			position: fixed; top: 50%; left: 50%;
			transform : translate(-50%, -50%);
			margin-top: -244px;
			background: white;
			border: 1px solid black;
			border-radius: 6px;
			box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.3);
		}
		.model{
			padding: 15px 10px;
		}
		#formFooter{
			text-align: center;
			margin-top: 15px;
	
		}
		#mHeader{
			border-bottom: 2px solid gray;
		}
		#mHeader h4{
			line-height: 30px;
		}
		#getEmailNum{
			margin-top: 20px;
		}
		
		#getEmailNum > div{
			line-height : 30px;
			border-top: 1px solid gray;
		}
		#borderB{
			border-bottom: 1px solid gray;
		}
		#getEmailNum > div:LAST-CHILD {
			border: none;
		
		}
	</style>
	<div class = "main">
		<h2 id = "aTitle">회원가입</h2>
		<div class = "step-panels">
			<div id = "align">
				<div class = "step action">
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
		<div class = "showText">
			<div class = "textTitleLine">
				<h3>본인 인증</h3>
			</div>
			<div class = "textSmallLine">
				AON 가입을 위해 본인인증을 시작합니다. 이메일 인증 방법을 선택하여 본인인증을 진행할 수 있습니다.<br />
				본인인증을 위해 입력하신 개인정보는 본인인증 기관에서 수집하는 정보이며, 수집된 정보는 본인인증 외 어떠한 용도로도 사용되거나 별도 저장되지 않습니다.
			</div>
		</div>
		<div class = "certificationBox">
			<div class = "emailCertification">
				<h3>
					이메일 인증
					<small>
						이메일 인증 서비스는 신용평가정보(주)의 개정된 정보통신망법을 준수하여 개별 웹 사이트에서 주민등록번호를 수집/이용하지 않고 실명 여부를 확인 합니다. 입력하신 개인정보는 본인확인 및 비밀번호 확인 용도로만 사용되며, 실명확인기관 외에는 제공되지 않으므로 개인 정보 유출의 위험이 없습니다.					
					</small>
				</h3>
				<div>
					<input type="button" id="emailForm" value="이메일 인증">
				</div>
			</div>
		</div>
		<div class = "certificationForm">
			<div id = "backLayer"></div>
			<div id = "mainLayer">
				<div class = 'model'>
					<div id = 'mHeader'>
						<h4>이메일 인증</h4>
					</div>
					<div id = 'mBody'>
						<form id = "getEmailNum">
							<div>
								<span class = "array">이메일</span><input type = "text" maxlength="30" id = "m_email1" name = "m_email1">
								<span id = "arroba">@</span><input type = "text" maxlength="30" id = "m_email2" name = "m_email2">
								<input type = "button" id = "gogoEmail" value="인증번호받기">
							</div>
							<div id = "borderB">
								<span class = "array">인증번호</span><input type = "text" id = "certificationNum" name = "certificationNum">
							</div>
							<div id = "formFooter">
								<input type = "hidden" id = "m_email" name = "m_email">
								<input type = "button" value="회원가입하기" id = "chkNum">
							</div>
						</form>
						<form id = "goNext">
							<input type = "hidden" id = "mode" name = "mode">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script src = "/resources/include/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#mainLayer").hide();
			
			$("#emailForm").click(function(){
				$("#backLayer").fadeIn(300);
				$("#mainLayer").fadeIn(200);
			});
			
			$("#backLayer").click(function(){
				$(this).fadeOut(300);
				$("#mainLayer").fadeOut(200);
			});
			
			$("#gogoEmail").click(function(){
				$("#m_email").val($("#m_email1").val() + $("#arroba").text() + $("#m_email2").val());
				$.ajax({
					url : "/member/join/emailCertification",
					dataType : "text",
					data : $("#getEmailNum").serialize(),
					type : "post",
					error : function(){
						alert("시스템 에러입니다. 관리자에게 문의하세요.");
					},
					success : function(result){
						if(result == "success"){
							alert("인증번호를 요청하신 이메일로 발송했습니다.");
						}
						else{
							alert("시스템 에러입니다. 관리자에게 문의하세요.");
						}
					}
				});
			});
			
			$("#chkNum").click(function(){
				$.ajax({
					url : "/member/join/emailCertificationChk",
					type : "post",
					data : $("#getEmailNum").serialize(),
					dataType : "text",
					error : function(){
						alert("시스템 에러입니다. 관리자에게 문의하세요.");
					},
					success : function(result){
						if(result == "success"){
							$("#goNext").attr({
								"method" : "post",
								"action" : "/member/join"
							});
							$("#mode").val(result);
							$("#goNext").submit();
						}
						else{
							alert("인증번호가 일치하지 않습니다.");
						}
					}
				});
			});
		});
	</script>