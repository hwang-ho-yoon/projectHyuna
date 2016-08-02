/*chkSubmit(유효성 체크 대상, 메시지 내용)*/
function chkSubmit(v_item, v_name){
	if(v_item.val().replace(/\s/g,"")==""){
		alert(v_name+" 입력해 주세요");
		v_item.val("");
		v_item.focus();		
		return false;
	}else{
		return true;
	}
}

/*formCheck(유효성 체크 대상, 출력 영역, 메시지내용)*/
function formCheck(main, item, msg){
	if(main.val().replace(/\s/g,"")==""){
		item.html(msg+ "입력해 주세요");
		main.val("");
		return false;
	}else{
		return true;
	}
}

function chkFile(item){
	/*배열 내의 값을 찾아서 인덱스를 반환합니다
	(요소가 없을 경우 -1을 반환)
	$.inArray(찾을 값, 검색 대상의 배열)*/
	var ext = item.val().split('.').pop().toLowerCase();	//pop .뒤에 마지막원소		
	if(jQuery.inArray(ext, ['gif', 'png', 'jpg', 'jpeg'])==-1){	//jQuery대신$가능
		alert('gif, png, jpg, jpeg파일만 업로드할수 있습니다');
		return false;
	}else{
		return true;
	}
}

function chks(v_id, v_msg, v_name){
	if(v_id.val().replace(/\s/g,"")==""){
		v_msg.text(v_name+" 입력하세요.").css("color", "red");
		v_id.val("");
		v_id.focus();		
		return false;
	}else{
		return true;
	}
}
