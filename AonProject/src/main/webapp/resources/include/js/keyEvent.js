/*
	엔터키 페이지 이동 방지, 다음 포커스로 이동
	event : 이벤트가 발생한 대상
	nextInput : 다음 포커스
	gogo : 스페이스키 방지 확인
*/
function nextEnter(event, nextInput, gogo){
	if(event.keyCode == 13){
		event.preventDefault();
		nextInput.focus();
	}
	else if(event.keyCode == 32){
		if(gogo == true){
			event.preventDefault();
		}
	}
}