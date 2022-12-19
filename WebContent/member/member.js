function go_save(){
	
}

//아이디 중복체크
function idcheck(){
	if(document.formm.id.value == ""){
		alert("아이디를 입력하세요.");
		document.formm.id.focus();
		return;
	}
	
	var url = "NonageServlet?command=id_check_form&id=" + document.formm.id.value;
	//새창 띄우기
	window.open(url,"_blank_1","width=330, height=200, top=300, left=300");
}

//주소찾기
function post_zip(){
	var url = "NonageServlet?command=find_zip_num";
	window.open(url,"_blank_1","width=550, height=300, top=300, left=300");
}


//약관 동의 처리
function go_next(){
	if(document.formm.okon1[0].checked == true){  //동의함일 경우
		document.formm.action = "NonageServlet?command=join_form";
		document.formm.submit();
	}else if(document.formm.okon1[1].checked == true){  //동의안함일 경우
		alert("약관에 동의하셔야 합니다.");
	}
}
