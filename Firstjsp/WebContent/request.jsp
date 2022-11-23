<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 서버 요청 방식 : 
	 - client -> server : request 객체 (get / post) 
	 - server -> client : response 객체 -->
	 
	<h2>1. 클라이언트와 서버의 환경정보 읽기</h2>
	<a href="./RequestWebInfo.jsp?eng=Hello&han=안녕">   <!-- GET 방식으로 요청 : 주소창에 값이 노출됨 -->
		GET 방식 전송				<!-- ?뒤에 값을 붙이는 형식 : query string (-> parameter 값) -->
	</a>
	<br/>
	<form action="RequestWebInfo.jsp" method="POST">    <!-- POST 방식으로 요청 : 주소창에 값이 노출되지 않음 / form 태그 형태로만 데이터 전송가능 -->
		영어 : <input type="text" name="eng" value="Bye" /><br />  
		한글 : <input type="text" name="han" value="잘 가" /><br />
		<input type="submit" value="POST 방식 전송" />
		<!-- name 속성의 값이 parameter 값 -> value 값을 parameter에 담아서 데이터 전송 -->
	</form>
	
<!-- client parameter값 -> request 객체 -> server -->
</body>
</html>
