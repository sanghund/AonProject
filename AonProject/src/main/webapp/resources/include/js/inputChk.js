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
	아이디 중복 체크
	main : 검사 대상
	item : 메시지를 출력할 대상
	type : 관리자 or 유저 식별
*/
var idOverlopChk = false;
function overlapChk(main, item, type){
	var target = "";
	var id = main.attr("id");
	var val = main.val();
	if(type == "admin"){
		target = "/admin/overlapChk";
	}
	else{
		target = "/member/overlapChk";
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
				item.html("사용 가능한 아이디입니다.");
				idOverlopChk = true;
			}
			else{
				item.html("이미 사용중인 아이디입니다.");
				idOverlopChk = false;
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