<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h2>web.xml에 설정한 내용 읽어오기</h2>
   초기화 매개변수: <%=application.getInitParameter("ININ_PARAM") %>
   
   <h2>서버의 물리적 경로 얻어오기</h2>
   application 내장 객체: <%=application.getRealPath("/") %>
   <br>
   request 내장객체 : <%=request.getRealPath("/") %>
</body>
</html>