<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ page trimDirectiveWhitespaces="true" %>
	<style type = "text/css">
		.main{
			height: 704px;
		}
		#mTitle {
			font-size: 3rem;
			display: inline-block;
			border-bottom: 1px solid #73879C;
			margin-bottom: 3rem;
		}
		#update > div{
			font-size : 1.8rem;
			padding : 1rem 0;
			border-top: 1px solid #73879C;
		}
		#update > div:LAST-CHILD {
			border-bottom: 1px solid #73879C;
		} 	
		.array{
			display : inline-block;
			width: 200px;
		}
		#a_id{
			font-weight: bold;
		}
		#forAdress{
			display: inline-block;
			
		}
		.ver{
			width : 100%;
			display: table;
		}
		#forAdress > *{
			display: block;
		}
		#forAddr{
			display : table-cell;
			vertical-align: middle;
		}
		#gogoUpdate{
			margin-top : 5rem;
			text-align: center;
		}
		#gogo{
			font-size :2rem;
			width : 150px;
			
		}
		
		#a_tel1,#a_tel2,#a_tel3{
			width: 75px;
		}
		#a_addr1,#a_addr2{
			margin-bottom: 1rem;
			
		}
		#a_addr1{
			width: 75px;
		}
		#a_addr2,#a_addr3{
			width: 500px;
		}
		#choiceEmailType{
			height: 32px;
					
		}
}
	</style>
	
	<div class="main">
		<h2 id = "mTitle">내 정보</h2>
		<form id = "updateForm" name = "updateForm">
			<div id = "update">
				<div><span class = "array">아이디</span><span id = "a_id">${vo.a_id }</span></div>	
				<div><span class = "array">비밀번호</span><input type = "password" maxlength="20"  id = "a_pwd" name = "a_pwd"><span id = "pwdChkMsg1"></span></div>	
				<div><span class = "array">비밀번호 확인</span><input type = "password" maxlength="20"  id = "a_pwd2" name = "a_pwd2"><span id = "pwdChkMsg2"></span></div>		
				<div><span class = "array">이름</span><input type = "text" value= "${vo.a_name }" maxlength="20"  id = "a_name" name = "a_name"><span id = "nameChkMsg"></span></div>		
				<div>
					<span class = "array">핸드폰</span><input type = "text" maxlength="4" id = "a_tel1" name = "a_tel1">
					<input type = "text" maxlength="4" id = "a_tel2" name = "a_tel2">
					<input type = "text" maxlength="4" id = "a_tel3" name = "a_tel3">
					<span id = "telChkMsg"></span>
				</div>		
				<div>
					<span class = "array">이메일</span><input type = "text" maxlength="30" id = "a_email1" name = "a_email1">
					<span id = "arroba">@</span>
					<input type = "text" maxlength="30"  id = "a_email2" name = "a_email2">
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
							<input type = "text" width="145px" id = "a_addr1" name = "a_addr1" readonly="readonly">
							<input type = "button" id = "go" name = "go" value = "주소 검색">
							<span id = "addrChkMsg1"></span>
						</span>
						<input type = "text" id = "a_addr2" name = "a_addr2" readonly="readonly">
						<input type = "text" id = "a_addr3" name = "a_addr3">
						<span id = "addrChkMsg2"></span>
					</div>
				</div>	
			</div>
			<input type = "hidden" id = "a_tel" name = "a_tel" value="${vo.a_tel }">
			<input type = "hidden" id = "a_email" name = "a_email" value= "${vo.a_email }">
			<input type = "hidden" id = "a_addr" name = "a_addr" value = "${vo.a_addr }">
		</form>
		<div id = "gogoUpdate">
			<input type = "button" id = "gogo" name = "gogo" value = "확인">
		</div>
	</div>
	
	<script src = "/resources/include/js/jquery-1.12.4.min.js"></script>
	<script src = "/resources/include/js/inputChk.js"></script>
	<script src = "/resources/include/js/keyEvent.js"></script>
	<script src = "/resources/include/js/daumAddr.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			var omg = "#!@@!#";
			
			// tel, email, addr 기본값 넣기
			var tels = $("#a_tel").val().split("-");
			var emails = $("#a_email").val().split("@");
			var addrs = $("#a_addr").val().split("#!@@!#");
			$("#a_tel1").val(tels[0]);
			$("#a_tel2").val(tels[1]);
			$("#a_tel3").val(tels[2]);
			$("#a_email1").val(emails[0]);
			$("#a_email2").val(emails[1]);
			$("#a_addr1").val(addrs[0]);
			$("#a_addr2").val(addrs[1]);
			$("#a_addr3").val(addrs[2]);
			
			// 다음 포커스
    		$("#a_pwd").keydown(function(event){
    			nextEnter(event, $("#a_pwd2"), true);
    		});
    		$("#a_pwd2").keydown(function(event){
    			nextEnter(event, $("#a_name"), true);
    		});
    		$("#a_name").keydown(function(event){
    			nextEnter(event, $("#a_tel1"), true);
    		});
    		$("#a_tel1").keydown(function(event){
    			nextEnter(event, $("#a_email1"), true);
    		});
    		$("#a_tel2").keydown(function(event){
    			nextEnter(event, $("#a_email1"), true);
    		});
    		$("#a_tel3").keydown(function(event){
    			nextEnter(event, $("#a_email1"), true);
    		});
    		$("#a_email1").keydown(function(event){
    			nextEnter(event, $("#go"), true);
    		});
    		$("#a_email2").keydown(function(event){
    			nextEnter(event, $("#go"), false);
    		});
    		$("#a_addr3").keydown(function(event){
    			nextEnter(event, $("#gogo"), false);
    		});
    		
    		// 메일
    		if($("#choiceEmailType").val() == "none"){
    			$("#a_email2").removeAttr("readonly");
    		}
    		else{
    			$("#a_email2").attr("readonly", "true");
    			$("#a_email2").val($("#choiceEmailType").val());
    		}
    		
    		$("#choiceEmailType").change(function(){
    			if($("#choiceEmailType").val() == "none"){
        			$("#a_email2").val("");
        			$("#a_email2").removeAttr("readonly");
        			$("#a_email2").focus();
        		}
        		else{
        			$("#a_email2").attr("readonly", "true");
        			$("#a_email2").val($("#choiceEmailType").val());
        		}	
    		});
    		
    		// 주소 검색
    		$("#go").click(function(){
    			daumAddr();
    		});
    		
    		// 비밀번호 동일체크
    		$("#a_pwd").blur(function(){
    			if($("#a_pwd").val().replace(/\s/g,"")=="") {
    				pwdSameChk = true;
    				$("#pwdChkMsg2").html("");
    			}
    		});
    		$("#a_pwd2").blur(function(){
    			if($("#a_pwd").val().replace(/\s/g,"")=="") {
    				pwdSameChk = true;
    				$("#pwdChkMsg2").html("");
    			}
    			else if(!($("#a_pwd").val().replace(/\s/g,"")=="") && ($("#a_pwd2").val().replace(/\s/g,"")=="")) {
    				pwdSameChk = false;
    				$("#pwdChkMsg2").html("비밀번호 확인을 입력해 주세요.");
    			}
    			else if(!($("#a_pwd").val().replace(/\s/g,"")=="") && !($("#a_pwd2").val().replace(/\s/g,"")=="")){
    				sameChk($("#a_pwd"), $("#a_pwd2"), $("#pwdChkMsg2"));	
    			}
    		});
    		
    		// 수정하기
    		$("#gogo").click(function(){
    			if(!$("#a_pwd").val().replace(/\s/g,"")==""){
    				if(!vacuumChk($("#a_pwd2"), "비밀번호 확인을", $("#pwdChkMsg2"), true)) return;	
    			}
    			else{
    				pwdSameChk = true;
    			}
    			if(!vacuumChk($("#a_name"), "이름을", $("#nameChkMsg"), true)) return;
    			else if(!vacuumChk($("#a_tel1"), "휴대폰 번호를", $("#telChkMsg"), true)) return;
    			else if(!vacuumChk($("#a_tel2"), "휴대폰 번호를", $("#telChkMsg"), true)) return;
    			else if(!vacuumChk($("#a_tel3"), "휴대폰 번호를", $("#telChkMsg"), true)) return;
    			else if(!vacuumChk($("#a_email1"), "이메일을", $("#emailChkMsg"), true)) return;
    			else if(!vacuumChk($("#a_email2"), "이메일을", $("#emailChkMsg"), true)) return;
    			else if(!vacuumChk($("#a_addr1"), "주소를", $("#addrChkMsg1"), false)) return;
    			else if(!vacuumChk($("#a_addr3"), "상세 주소를", $("#addrChkMsg2"), true)) return;
    			else if(!pwdSameChk){
    				$("#a_pwd2").focus();
    				return;
    			}
    			else{
    				$("#a_tel").val($("#a_tel1").val() + "-" + $("#a_tel2").val() + "-" + $("#a_tel3").val());
    				$("#a_email").val($("#a_email1").val() + $("#arroba").text() + $("#a_email2").val());
    				$("#a_addr").val($("#a_addr1").val() + omg + $("#a_addr2").val() + omg + $("#a_addr3").val());
    				
    				$.ajax({
    					url : "/admin/myInfoUpdate",
    					data : $("#updateForm").serialize(),
    					type : "post",
    					dataType : "text",
    					error : function(){
    						alert("시스템 에러입니다.");
    					},
    					success : function(result){
    						if(result == "success"){
    							alert("정보가 수정되었습니다!");
    							location.reload();
    						}
    						else{
    							alert("시스템 에러입니다.");
    						}
    					}
    				});	
    			}
    		});
    	});
	</script>