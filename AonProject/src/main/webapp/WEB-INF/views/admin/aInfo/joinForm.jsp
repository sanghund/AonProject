<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
</head>
<body>
	<div class = "main">
		<h2>회원가입</h2>
		<form id = "joinForm" name = "joinForm">
			<div class = "policy">
				<!-- 약관 들어가야함 -->
			</div>
			<div id = "join">
				<h3>회원 정보 입력</h3>
				<div><span>아이디</span><input type = "text" maxlength="20" width="145px" id = "a_id" name = "a_id"><span id = "idChkMsg"></span></div>	
				<div><span>비밀번호</span><input type = "password" maxlength="20" width="145px" id = "a_pwd" name = "a_pwd"><span id = "pwdChkMsg1"></span></div>	
				<div><span>비밀번호 확인</span><input type = "password" maxlength="20" width="145px" id = "a_pwd2" name = "a_pwd2"><span id = "pwdChkMsg2"></span></div>		
				<div><span>이름</span><input type = "text" maxlength="20" width="145px" id = "a_name" name = "a_name"><span id = "nameChkMsg"></span></div>		
				<div>
					<span>핸드폰</span>
					<input type = "text" maxlength="4" width="145px" id = "a_tel1" name = "a_tel1">
					<input type = "text" maxlength="4" width="145px" id = "a_tel2" name = "a_tel2">
					<input type = "text" maxlength="4" width="145px" id = "a_tel3" name = "a_tel3">
					<span id = "telChkMsg"></span>
				</div>		
				<div>
					<span>이메일</span>
					<input type = "text" maxlength="30" width="145px" id = "a_email1" name = "a_email1">
					<input type = "text" maxlength="30" width="145px" id = "a_email2" name = "a_email2">
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
				<div>
					<span>주소</span>
					<div id = "forAdress">
						<div id = "daumApi">
							<input type = "text" width="145px" id = "a_addr1" name = "a_addr1" readonly="readonly">
							<input type = "button" id = "go" name = "go" value = "주소 검색">
							<span id = "addrChkMsg1"></span>
						</div>
						<input type = "text" width="500px" id = "a_addr2" name = "a_addr2" readonly="readonly">
						<input type = "text" width="500px" id = "a_addr3" name = "a_addr3">
						<span id = "addrChkMsg2"></span>
					</div>
				</div>	
			</div>
			<input type = "hidden" id = "a_tel" name = "a_tel">
			<input type = "hidden" id = "a_email" name = "a_email">
		</form>
		<div id = "gogoJoin">
			<input type = "button" id = "gogo" name = "gogo" value=  "회원가입">
		</div>
	</div>
	
	<script src = "/resources/include/js/jquery-1.12.4.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript">
    	$(document).ready(function(){
    		
    		$("#go").click(function(){
    			daumAddr();
    		});
    		
    		$("#gogo").click(function(){
    			if(!true){
    				// 여기는 유효성 검사
    				alert("test");
    			}
    			else{
    				$.ajax({
    					url : "/admin/joinGo",
    					data : $("#joinForm").serialize(),
    					type : "post",
    					dataType : "text",
    					error : function(){
    						alert("시스템 에러입니다.");
    					},
    					success : function(result){
    						if(result == "success"){
    							alert("회원가입에 성공하였습니다!");
    							location.href = "/admin/main";
    						}
    						else{
    							alert("시스템 에러입니다.");
    						}
    					}
    				});
    			}
    		});
    	});
    	
    	function daumAddr() {
            new daum.Postcode({
                oncomplete: function (data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var fullAddr = ''; // 최종 주소 변수
                    var extraAddr = ''; // 조합형 주소 변수

                    // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        fullAddr = data.roadAddress;

                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        fullAddr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                    if (data.userSelectedType === 'R') {
                        //법정동명이 있을 경우 추가한다.
                        if (data.bname !== '') {
                            extraAddr += data.bname;
                        }
                        // 건물명이 있을 경우 추가한다.
                        if (data.buildingName !== '') {
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                        fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('a_addr1').value = data.zonecode; //5자리 새우편번호 사용
                    document.getElementById('a_addr2').value = fullAddr;

                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById('a_addr3').focus();
                }
            }).open();
        }
	</script>
</body>
</html>