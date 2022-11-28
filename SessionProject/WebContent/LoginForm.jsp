<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 공통 링크 추가하기 -->
	<jsp:include page="./Common/Link.jsp" />
	<!-- . : 현재 위치에서 찾기 / .. : 하나 상위 위치에서 찾기 -->
	
	<h2>로그인 페이지</h2>
	<!-- 로그인 유무 확인 및 로그인 성공 뒤 세션 id값 생성 -->
	<span style="color: red; font-size: 1.2em;">
		<%=request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg")%>
	</span>
	
	<%	//로그인 하기 전 상태(아래 if문부터 form 태그 까지 전부)
		if (session.getAttribute("UserId") == null) {  //session영역에 UserId값이 있는지 판단(세션id가 없는 상태 = 로그인하기 전 상태)
	%>
	<script>
	//유효성 검증
	function validateForm(form) {
		if(!form.user_id.value) {   //= form.user_id.value == ""
			alert("아이디를 입력하세요.");
			return false;
		}	
		if(form.user_pw.value == "") {  //!form.user_pw.value
			alert("패스워드를 입력하세요.");
			return false;
		}
	}
	</script>
	<form action="LoginProcess.jsp" method="post" name="loginFrm"
		onsubmit="return validateForm(this);">  <!-- submit 버튼을 누르면 이벤트 발생(유효성 검증 메소드 실행) / 여기서 this는 form태그를 script에서 사용할 수 있게 넘겨주는 것 -->
		<!-- validateForm(this)의 값은 true or false로 반환되며, true가 반환되면 LoginProcess.jsp로 페이지 이동이 일어난다.  -->
		아이디 : <input type="text" name="user_id" /><br /> 
		패스워드 : <input type="password" name="user_pw" /><br /> 
		<input type="submit" value="로그인 하기" />
	</form>
	<%
		} else {
	%>
	<%=session.getAttribute("UserName")%> 회원님, 로그인하셨습니다.<br />
	<a href="Logout.jsp">[로그아웃]</a>
	<%
		}
	%>
</body>
</html>