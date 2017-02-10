<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ page trimDirectiveWhitespaces="true" %>
	<style type = "text/css">
		.main{
		box-sizing: border-box;
		padding: 10px;
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
	#shonwList{
		font-size: 12px;
	}
	.step-panels{
			display: block;
			width : 100%;
			clear : both;
			height: 37px;
			margin-bottom: 30px;
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
			width : 24.9206%;
			cursor : pointer;
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
		#m_id{
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
		
		#m_tel1,#m_tel2,#m_tel3{
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
		#updateForm{
			
		font-size : 10px;
		}
}
	</style>
	
	<script src = "/resources/include/js/jquery-1.12.4.min.js"></script>
	
	<div class="main">
		<h2 id = "aTitle">MyPage</h2>
	<div class = "step-panels">
		<div id = "align">
			<div class = "step">
				<span>주문내역</span>
			</div>
			<div class = "step">
				<span>리뷰내역</span>
			</div>
			<div class = "step">
				<span>문의내역</span>
			</div>
			<div class = "step action">
				<span>내 정보</span>
			</div>
		</div>
	</div>
		<form id = "updateForm" name = "updateForm">
			<div id = "update">
				<div><span class = "array">아이디</span><span id = "m_id">${vo.m_id }</span></div>	
				<div><span class = "array">비밀번호</span><input type = "password" maxlength="20"  id = "m_pwd" name = "m_pwd"><span id = "pwdChkMsg1"></span></div>	
				<div><span class = "array">비밀번호 확인</span><input type = "password" maxlength="20"  id = "a_pwd2" name = "m_pwd2"><span id = "pwdChkMsg2"></span></div>		
				<div><span class = "array">이름</span><input type = "text" value= "${vo.m_name }" maxlength="20"  id = "m_name" name = "m_name"><span id = "nameChkMsg"></span></div>		
				<div><span class = "array">성별</span><span id = "ygender">${vo.m_gender }</span></div>		
				<div>
					<span class = "array">핸드폰</span><input type = "text" maxlength="4" id = "m_tel1" name = "m_tel1">
					<input type = "text" maxlength="4" id = "m_tel2" name = "m_tel2">
					<input type = "text" maxlength="4" id = "m_tel3" name = "m_tel3">
					<span id = "telChkMsg"></span>
				</div>		
				<div>
					<span class = "array">이메일</span><input type = "text" maxlength="30" id = "m_email1" name = "m_email1">
					<span id = "arroba">@</span>
					<input type = "text" maxlength="30"  id = "m_email2" name = "m_email2">
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
				<c:if test="${not empty msa }">
					<style type = "text/css">
						.subAdrr{
			width : 100%;
			display: table;
		}
		.subLine > *{
			display: block;
		}
		#forSubAddr{
			display : table-cell;
			vertical-align: middle;
		}	
		#sRadioLine{
			margin-bottom: 16px;
		}
		#sRadioLine label{
			font-size: 1rem;
		}
		#tttttt > *{
			display: block;
			margin-bottom: 16px;
			
		}
		.subAdrr{
			border-bottom: 1px solid gray;
		}
		#s_addr1{
			width: 75px;
		}
		#s_addr2,#s_addr3{
			width: 500px;
		}
		#saddrDelete{
			width: 500px;
			text-align: center;
		}
					</style>
					<div class ="subAdrr">
						<span class = "array" id = "forSubAddr">추가 주소</span>
						<div class = "subLine">
							<div id = "sRadioLine">
								<c:forEach items="${msa }" varStatus="status">
									<input type = "radio" id = "ff${msa[status.index].ma_no }" class = "subAddr" name = "addrs" data-num = "${msa[status.index].ma_no }" value="${msa[status.index].m_addr }"><label for="ff${msa[status.index].ma_no }">주소(${status.index + 1 })</label>
								</c:forEach>						
							</div>
							<div id = "tttttt">
								<input type = "text" width="145px" id = "s_addr1" name = "s_addr1" readonly="readonly">
								<input type = "text" id = "s_addr2" name = "s_addr2" readonly="readonly">
								<input type = "text" id = "s_addr3" name = "s_addr3"readonly="readonly">
							</div>
						</div>
						<div id = "saddrDelete"><input type = "button" id = "byebye" value="삭제"></div>	
					</div>
					<script type = "text/javascript">
						$(document).ready(function(){
							var sp = "#!@@!#";
							
							$(".subAddr").click(function(){
								var subAd = $(this).val();
								var sAddrs = subAd.split("#!@@!#");
								$("#s_addr1").val(sAddrs[0]);
								$("#s_addr2").val(sAddrs[1]);
								$("#s_addr3").val(sAddrs[2]);
							});
							
							$(".subAddr").eq(0).click();
							
							$("#saddrDelete").click(function(){
								if(confirm("정말로 삭제하시겠습니까?")){
									var thisChecked = $(".subAddr:checked").attr("data-num");
									$.ajax({
										url : "/member/mypage/myinfoD",
										dataType : "text",
										type : "post",
										data : "ma_no="+thisChecked,
										error : function(){
											alert("시스템 에러입니다.");
										},
										success : function(result){
											if(result == "success"){
												alert("삭제되었습니다.");
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
				</c:if>
			</div>
			<input type = "hidden" id = "m_tel" name = "m_tel" value="${vo.m_tel }">
			<input type = "hidden" id = "m_email" name = "m_email" value= "${vo.m_email }">
			<input type = "hidden" id = "m_addr" name = "m_addr" value = "${vo.m_addr }">
		</form>
		<div id = "gogoUpdate">
			<input type = "button" id = "gogo" name = "gogo" value = "확인">
		</div>
	</div>
	
	<script type = "text/javascript">
		$(document).ready(function(){
			$(".step").eq(0).click(function(){
				location.href = "/member/mypage/orderlist";
			});
			$(".step").eq(1).click(function(){
				location.href = "/member/mypage/review";
			});
			$(".step").eq(2).click(function(){
				location.href = "/member/mypage/qna";
			});
			$(".step").eq(3).click(function(){
				location.href = "/member/mypage/myinfo";
			});
			$(".step").eq(1).css("border-right", "none");
		});
	</script>
	<script src = "/resources/include/js/inputChk.js"></script>
	<script src = "/resources/include/js/keyEvent.js"></script>
	<script src = "/resources/include/js/daumAddr.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript">
	var emailOverlopChk2 = false;
		$(document).ready(function(){
			var omg = "#!@@!#";
			// 성별
			var ggg = $("#ygender").text();
			
			if(ggg == "m") $("#ygender").html("남자");
			else $("#ygender").html("여자");
			
			// tel, email, addr 기본값 넣기
			var tels = $("#m_tel").val().split("-");
			var emails = $("#m_email").val().split("@");
			var addrs = $("#m_addr").val().split("#!@@!#");
			$("#m_tel1").val(tels[0]);
			$("#m_tel2").val(tels[1]);
			$("#m_tel3").val(tels[2]);
			$("#m_email1").val(emails[0]);
			$("#m_email2").val(emails[1]);
			$("#a_addr1").val(addrs[0]);
			$("#a_addr2").val(addrs[1]);
			$("#a_addr3").val(addrs[2]);
			
			// 다음 포커스
    		$("#m_pwd").keydown(function(event){
    			nextEnter(event, $("#m_pwd2"), true);
    		});
    		$("#m_pwd2").keydown(function(event){
    			nextEnter(event, $("#a_name"), true);
    		});
    		$("#m_name").keydown(function(event){
    			nextEnter(event, $("#m_tel1"), true);
    		});
    		$("#m_tel1").keydown(function(event){
    			nextEnter(event, $("#m_email1"), true);
    		});
    		$("#m_tel2").keydown(function(event){
    			nextEnter(event, $("#m_email1"), true);
    		});
    		$("#m_tel3").keydown(function(event){
    			nextEnter(event, $("#m_email1"), true);
    		});
    		$("#m_email1").keydown(function(event){
    			nextEnter(event, $("#go"), true);
    		});
    		$("#a_addr3").keydown(function(event){
    			nextEnter(event, $("#gogo"), false);
    		});
    		
    		// 메일
    		if($("#choiceEmailType").val() == "none"){
    			$("#m_email2").removeAttr("readonly");
    		}
    		else{
    			$("#m_email2").attr("readonly", "true");
    			$("#m_email2").val($("#choiceEmailType").val());
    		}
    		
    		$("#choiceEmailType").change(function(){
    			if($("#choiceEmailType").val() == "none"){
        			$("#m_email2").val("");
        			$("#m_email2").removeAttr("readonly");
        			$("#m_email2").focus();
        		}
        		else{
        			$("#m_email2").attr("readonly", "true");
        			$("#m_email2").val($("#choiceEmailType").val());
        		}	
    		});
    		
    		// 주소 검색
    		$("#go").click(function(){
    			daumAddr();
    		});
    		
    		// 비밀번호 동일체크
    		$("#m_pwd").blur(function(){
    			if($("#m_pwd").val().replace(/\s/g,"")=="") {
    				pwdSameChk = true;
    				$("#pwdChkMsg2").html("");
    			}
    		});
    		$("#m_pwd2").blur(function(){
    			if($("#m_pwd").val().replace(/\s/g,"")=="") {
    				pwdSameChk = true;
    				$("#pwdChkMsg2").html("");
    			}
    			else if(!($("#m_pwd").val().replace(/\s/g,"")=="") && ($("#m_pwd2").val().replace(/\s/g,"")=="")) {
    				pwdSameChk = false;
    				$("#pwdChkMsg2").html("비밀번호 확인을 입력해 주세요.");
    			}
    			else if(!($("#m_pwd").val().replace(/\s/g,"")=="") && !($("#m_pwd2").val().replace(/\s/g,"")=="")){
    				sameChk($("#m_pwd"), $("#m_pwd2"), $("#pwdChkMsg2"));	
    			}
    		});
    		
    		// 수정하기
    		$("#gogo").click(function(){
    			if(!$("#m_pwd").val().replace(/\s/g,"")==""){
    				if(!vacuumChk($("#m_pwd2"), "비밀번호 확인을", $("#pwdChkMsg2"), true)) return;	
    			}
    			else{
    				pwdSameChk = true;
    			}
    			if(!vacuumChk($("#m_name"), "이름을", $("#nameChkMsg"), true)) return;
    			else if(!vacuumChk($("#m_tel1"), "휴대폰 번호를", $("#telChkMsg"), true)) return;
    			else if(!vacuumChk($("#m_tel2"), "휴대폰 번호를", $("#telChkMsg"), true)) return;
    			else if(!vacuumChk($("#m_tel3"), "휴대폰 번호를", $("#telChkMsg"), true)) return;
    			else if(!vacuumChk($("#m_email1"), "이메일을", $("#emailChkMsg"), true)) return;
    			else if(!vacuumChk($("#m_email2"), "이메일을", $("#emailChkMsg"), true)) return;
    			else if(!vacuumChk($("#a_addr1"), "주소를", $("#addrChkMsg1"), false)) return;
    			else if(!vacuumChk($("#a_addr3"), "상세 주소를", $("#addrChkMsg2"), true)) return;
    			else if(!pwdSameChk){
    				$("#m_pwd2").focus();
    				return;
    			}
    			
    			else{
    				$("#m_tel").val($("#m_tel1").val() + "-" + $("#m_tel2").val() + "-" + $("#m_tel3").val());
    				$("#m_email").val($("#m_email1").val() + $("#arroba").text() + $("#m_email2").val());
    				$("#m_addr").val($("#a_addr1").val() + omg + $("#a_addr2").val() + omg + $("#a_addr3").val());	
    				
    				var id = $("#m_email").attr("id");
    				var val = $("#m_email").val();

    				$.ajax({
    					url : "/member/emailChk",
    					data : id+"="+val,
    					dataType : "text",
    					type : "post",
    					error : function(){
    						alert("시스템 에러입니다.");
    					},
    					success : function(result){
    						if(result == "success"){
    								emailOverlopChk2 = true;
    								$.ajax({
    			    					url : "/member/mypage/myinfoU",
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
    						else{
    								alert("이미 사용중인 이메일입니다.");
    								emailOverlopChk2 = false; 
    						}
    					}
    				});
    				
    				
    				
    				
    			}
    		});
    	});
	</script>