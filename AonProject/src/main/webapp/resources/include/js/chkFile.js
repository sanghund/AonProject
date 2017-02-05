function chkFile(item){
	var ext = item.val().split('.').pop().toLowerCase();
	if (/*$*/jQuery.inArray(ext, ['gif','png','jpg','jpeg']) == -1){
		alert("gif,png,jpg,jpeg 파일만 업로드 할 수 있습니다.");
		return false;
	}
	else{
		return true;
	}
}