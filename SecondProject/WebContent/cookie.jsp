<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 쿠키 객체 생성
	Cookie cookie = new Cookie("myCookie","쿠키");  //Cookie("속성값","value값")
	
	//2. 쿠키의 생성 경로 설정 (필수는 아님)
	cookie.setPath(request.getContextPath());
	
	//3. 쿠키의 유지기간 설정
	cookie.setMaxAge(3600);  //초단위
	
	//4. response 객체의 응답 헤더에 쿠키 정보 저장 (=> client로 쿠키 정보 전달)
	response.addCookie(cookie);
	
	//client cookie -> request header영역 -> server
	//server cookie -> response hesder영역 -> client
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>2. 쿠키 설정 직후 쿠키값 확인하기</h2>
	<%  //쿠키값은 최초 접속시 존재하지 않음, 두번째부터 생성
	
		//1. 요청 헤더에서 쿠키 정보 가져오기
		Cookie[] cookies = request.getCookies();   //쿠키 객체가 여러개일 경우 배열형태로 값이 넘어옴
		
		//2. 쿠키 정보가 존재하는지 확인
		if(cookies != null){
			for(Cookie c : cookies){
				String cookieName = c.getName();  //쿠키의 속성값 반환
				String cookieValue = c.getValue();  //쿠키의 value값 반환
				out.print("<br>");
				out.print(cookieName + " : " + cookieValue);
			}
		}else{
			out.print("쿠키 정보가 없습니다.");
		}
	%>
</body>
</html>