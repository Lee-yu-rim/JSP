<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="utils.CookieManager" %>
<%
	String loginId = CookieManager.readCookie(request, "loginId");
	//user_id에 아이디를 입력하고, "아이디 저장" 항목을 체크했을 때 생기는 쿠키 값 = loginId(쿠키 안에 저장되어 있는 user_id의 값들을 말함) 

	String cookieCheck = "";
	if(!loginId.equals("")){  //값이 공백이 아닌 경우 (쿠키에 들어있는 user_id의 값이 존재할 경우)
		cookieCheck = "checked";  //checkbox의 상태 속성이 checked 되어진다.
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>로그인 페이지</h2>
	<form action="IdSaveProcess.jsp" method="post">
	아이디 :
		<input type="text" name="user_id" value="<%=loginId %>" />
		<input type="checkbox" name="save_check" value="Y" <%=cookieCheck %> />
		아이디 저장하기
	<br>
	패스워드 : 
		<input type="text" name="user_pw" />
		<br>
		<input type="submit" value="로그인하기" />
	</form>
</body>
</html>