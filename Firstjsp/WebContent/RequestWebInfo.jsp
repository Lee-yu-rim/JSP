<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  //스크립틀릿 영역
	request.setCharacterEncoding("UTF-8");  //post 방식은 한글 깨짐 방지 해줘야함
	String eng = request.getParameter("eng");
	String han = request.getParameter("han");
	//.getParameter() : request 객체에 저장된 parameter 값을 받아옴
	
	request.getRequestURL();    //주소값 반환   http://localhost:8081/Firstjsp/RequestWebInfo.jsp
	request.getRequestURI();	//host 제외 주소값 반환   /Firstjsp/RequestWebInfo.jsp
	request.getRealPath("/");   //파일이 작성된 실제 위치   C:\work\jspworkspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Firstjsp\
	request.getQueryString();	//실제 데이터 부분    eng=Hello&han=%EC%95%88%EB%85%95
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>1. 클라이언트와 서버의 환경정보 읽기</h2>
	<ul>
		<li><%=eng %></li>
		<li><%=han %></li>
		<li><%=request.getRequestURL() %></li>
		<li><%=request.getRequestURI() %></li>
		<li><%=request.getRealPath("/") %></li>
		<li><%=request.getQueryString() %></li>
	</ul>
</body>
</html>