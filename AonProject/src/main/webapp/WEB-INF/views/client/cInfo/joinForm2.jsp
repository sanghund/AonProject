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
		
		#joinForm{
			margin : 50px 0;
			clear: both;
		}
	</style>
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
		<form id = "joinForm" name = "joinForm">
			<div id = "join">
				<h3>회원 정보 입력</h3>
				<div><span class = "array">아이디</span><input type = "text" maxlength="20" id = "m_id" name = "m_id"><span id = "idChkMsg"></span></div>	
				<div><span class = "array">비밀번호</span><input type = "password" maxlength="20" id = "m_pwd" name = "m_pwd"><span id = "pwdChkMsg1"></span></div>	
				<div><span class = "array">비밀번호 확인</span><input type = "password" maxlength="20" id = "m_pwd2" name = "m_pwd2"><span id = "pwdChkMsg2"></span></div>		
				<div><span class = "array">이름</span><input type = "text" maxlength="20" id = "m_name" name = "m_name"><span id = "nameChkMsg"></span></div>		
				<div>
					<span class = "array">성별</span><input type = "radio" checked="checked" value="m" id = "m_gender1" name = "m_gender">
					<label for = "m_gender1">남자</label>
					<input type = "radio" maxlength="20" id = "m_gender2" name = "m_gender" value="f">
					<label for="m_gender2">여자</label>
					<span id = "genderChkMsg"></span>
				</div>
				<div>
					<span class = "array">핸드폰</span><input type = "text" maxlength="4" id = "m_tel1" name = "m_tel1">
					<input type = "text" maxlength="4" id = "m_tel2" name = "m_tel2">
					<input type = "text" maxlength="4" id = "m_tel3" name = "m_tel3">
					<span id = "telChkMsg"></span>
				</div>		
				<div>
					<span class = "array">이메일</span><input type = "text" maxlength="30" id = "m_email1" name = "m_email1">
					<span id = "arroba">@</span>
					<input type = "text" maxlength="30" id = "m_email2" name = "m_email2">
					<span id = "addrChkMsg"></span>
					<select id = "choiceEmailType" name = "choiceEmailType">
						<option value="none" selected="selected">직접입력</option>
						<option value="naver.com">네이버</option>
						<option value="daum.net">다음</option>
						<option value="nate.com">네이트</option>
						<option value="gmail.com">지메일</option>
						<option value="hanmail.net">한메일</option> 
						<option value="korea.com">코리아 닷컴</option>
					</select>
					<span id = "emailChkMsg"></span>
				</div>	
				<div class = "ver">
					<span class = "array" id = "forAddr">주소</span>
					<div id = "forAdress">
						<span id = "daumApi">
							<input type = "text" id = "a_addr1" name = "a_addr1" readonly="readonly">
							<input type = "button" id = "go" name = "go" value = "주소 검색">
							<span id = "addrChkMsg1"></span>
						</span>
						<input type = "text" width="500px" id = "a_addr2" name = "a_addr2" readonly="readonly">
						<input type = "text" width="500px" id = "a_addr3" name = "a_addr3">
						<span id = "addrChkMsg2"></span>
					</div>
				</div>	
			</div>
			<div class = "policy">
				<div id = "tou">
					<h3>${view1.po_name }</h3>
						<textarea readonly="readonly" class = "po_content" name = "po_content">${view1.po_content }</textarea>
					<div class = "chkLine">
						<input type="checkbox" id = "touChk" name = "touChk" value="동의">
						<label for="touChk">이용약관 및 청약철회 방침에 동의합니다.</label>
					</div>
				</div>
				<div id = "privacy">
					<h3>${view2.po_name }</h3>
						<textarea readonly="readonly" class = "po_content" name = "po_content">${view2.po_content }</textarea>
					<div class = "chkLine">
						<input type="checkbox" id = "privacyChk" name = "privacyChk" value="동의">
						<label for="privacyChk">개인정보 수집에 동의합니다.</label>
					</div>
				</div>
			</div>
			<input type = "hidden" id = "m_tel" name = "m_tel">
			<input type = "hidden" id = "m_email" name = "m_email">
			<input type = "hidden" id = "m_addr" name = "m_addr">
		</form> 
		<div id = "gogoJoin">
			<input type = "button" id = "gogo" name = "gogo" value = "회원가입">
		</div>
	</div>
	
	<script src = "/resources/include/js/jquery-1.12.4.min.js"></script>
	<script src = "/resources/include/js/daumAddr.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			var omg = "#!@@!#";
			
			// 주소 검색
    		$("#go").click(function(){
    			daumAddr();
    		});
			
			// 회원가입 gogo
			$("#gogo").click(function(){
				$("#m_tel").val($("#m_tel1").val() + "-" + $("#m_tel2").val() + "-" + $("#m_tel3").val());
				$("#m_email").val($("#m_email1").val() + $("#arroba").text() + $("#m_email2").val());
				$("#m_addr").val($("#a_addr1").val() + omg + $("#a_addr2").val() + omg + $("#a_addr3").val());
				$.ajax({
					url : "/member/joinGo",
					data : $("#joinForm").serialize(),
					type : "post",
					dataType : "text",
					error : function(){
						alert("시스템 에러입니다.");
					},
					success : function(result){
						if(result == "good"){
							alert($("#m_id").val() + "님 회원가입을 축하드립니다!");
							location.href = "/";
						}
						else{
							alert("시스템 에러입니다.");
						}
					}
				});
			});
		});
	</script>
</body>
</html>