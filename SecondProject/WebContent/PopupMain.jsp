<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	//부모창
	String popupMode = "on";   // cookie 객체를 이용해서 on / off 기능을 넣기 위한 변수
	
	//쿠키정보 읽어오기
	//1. 요청 헤더에서 쿠키 정보 가져오기
	Cookie[] cookies = request.getCookies();   //쿠키 객체가 여러개일 경우 배열형태로 값이 넘어옴
		
	//2. 쿠키 정보가 존재하는지 확인
	if(cookies != null){
		for(Cookie c : cookies){
			String cookieName = c.getName();  //PopupClose
			String cookieValue = c.getValue();  //off
			if(cookieName.equals("PopupClose")){   //PopupCookie에 있는 PopupClose 쿠키의 value 값인 off가 되면 팝업창이 뜨지 않음
				popupMode = cookieValue;
			}
		}
	}else{
		out.print("쿠키 정보가 없습니다.");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#closeBtn").on("click",function(){
			$("#popup").hide();   //팝업창 닫기
			
			let chkVal = $("input:checkbox[id=inactiveToday]:checked").val();  // 속성 선택자[아이디 선택자]:상태 선택자
			//value의 값이 1일 경우 체크박스(하루동안 열지않음)를 선택한 상태라는 뜻
			
			$.ajax({
				url:'./PopupCookie.jsp',
				type:'get',
				data:{inactiveToday:chkVal},   //parameter 값 -> ?속성=값 과 동일
				dataType:"text",
				success:function(resData){
					
				}
			});
		})
	});
	
	//닫기 버튼을 누르면 팝업창 숨기기 -> chkVal변수에 '하루동안 열지않음'을 체크할 경우의 value값(1)을 담음 -> ajax 통신방법을 통해 PopupCookie.jsp 파일에 parameter 값을 통해 데이터 전송
	
</script>
<style type="text/css">
	div#popup{
        position: absolute; top:100px; left:100px; color:yellow;  
        width:300px; height:100px; background-color:gray;
    }
    div#popup>div{
        position: relative; background-color:#ffffff; top:0px;
        border:1px solid gray; padding:10px; color:black;
    }
</style>
</head>
<body>
	<h2>팝업 메인 페이지</h2>
	
	<%
		out.print("팝업창은 " + popupMode + "상태 입니다.<br>");
	%>
	
	<%if(popupMode.equals("on")) {   //PopupMode가 on일 경우에만 팝업창 띄우기 %>   
		<div id="popup">
			<h2 align="center">공지사항 팝업입니다.</h2>
			<div align="right">
				<form name="popFrm">
					<input type="checkbox" id="inactiveToday" value="1">
					하루동안 열지 않음
					<input type="button" value="닫기" id="closeBtn">
				</form>
			</div>
		</div>
	<%} %>
</body>
</html>