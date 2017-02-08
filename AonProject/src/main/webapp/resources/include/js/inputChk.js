/*
	공백 체크
	main : 검사 대상
	msg : 출력할 메시지 앞
	item : 메시지를 출력할 대상
	choice : focus 유무
 */
function vacuumChk(main, msg, item, choice){
	if(main.val().replace(/\s/g,"")==""){
		main.val("");
	    if(choice == true){
	    	main.focus();  
	    	item.html(msg+" 입력해 주세요.");
	    } 
	    else{
	    	item.html(msg+" 선택해 주세요.");
	    	}
	    return false;
	   }
	else{
		return true;
	}
}

/*
공백 체크2
main : 검사 대상
msg : 출력할 메시지 앞
choice : focus 유무
*/
function vacuumChkAlert(main, msg, choice){
if(main.val().replace(/\s/g,"")==""){
	main.val("");
    if(choice == true){
    	main.focus();  
    	alert(msg+" 입력해 주세요.");
    } 
    else{
    	alert(msg+" 선택해 주세요.");
    	}
    return false;
   }
else{
	return true;
}
}

/*
체크박스 체크 여부
main : 검사 대상
msg : 출력할 메시지 앞
choice : foucs 유무
*/

function checkboxChk(main, msg, choice){
	if(!main.is(":checked")){
		if(choice == true){
			main.focus();
		}
		alert(msg + " 선택해 주세요.");
		return false;
	}
	else{
		return true;
	}
}

/*
메시지 출력 제거 체크
main : 검사 대상
item : 메시지를 지울 대상
*/
function vacuumChk2(main, item){
if(main.val().replace(/\s/g,"")==""){
	main.val("");
	}
else{
	item.html("");
}
}


/*
	아이디 or 이메일 중복 체크
	main : 검사 대상
	item : 메시지를 출력할 대상
	type : 관리자 or 유저 식별
*/
var idOverlopChk = false;
var emailOverlopChk = false;
function overlapChk(main, item, type){
	var target = "";
	var id = main.attr("id");
	var val = main.val();
	if(type == "admin"){
		target = "/admin/overlapChk";
	}
	else if(type == "m_email"){
		target = "/member/emailChk";
	}
	else{
		target = "/member/idChk";
	}
	$.ajax({
		url : target,
		data : id+"="+val,
		dataType : "text",
		type : "get",
		error : function(){
			alert("시스템 에러입니다.");
		},
		success : function(result){
			if(result == "success"){
				if(type = "m_email"){
					item.html("사용 가능한 이메일입니다.");
					emailOverlopChk = true
				}
				else{
					item.html("사용 가능한 아이디입니다.");
					idOverlopChk = true;
				}
			}
			else{
				if(type = "m_email"){
					item.html("이미 사용중인 이메일입니다.");
					emailOverlopChk = false;
				}
				else{
					item.html("이미 사용중인 아이디입니다.");
					idOverlopChk = false;
				}
			}
		}
	});
}

/*
자기 정보를 제외한 이메일 중복 체크
main : 검사 대상
*/
var idOverlopChk = false;
var emailOverlopChk = false;
function overlapChk(main){
var id = main.attr("id");
var val = main.val();

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
				alert("사용 가능한 이메일입니다.");
				emailOverlopChk = true
		}
		else{
				alert("이미 사용중인 이메일입니다.");
				emailOverlopChk = false;
		}
	}
});
}

/*
	비밀번호 동일 체크
	main : 비교대상1
	main2 : 비교대상2
	item : 메시지를 출력할 대상
*/
var pwdSameChk = false;
function sameChk(main, main2, item){
	if(main.val() != main2.val()){
		pwdSameChk = false;
		item.html("비밀번호가 일치하지 않습니다.");
	}
	else{
		pwdSameChk = true;
		item.html("");
	} 
	return pwdSameChk;
}