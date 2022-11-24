<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%
	out.print("<h2>페이지 이동 후 session 영역의 속성 읽기</h2>");
	ArrayList<String> lists = (ArrayList)session.getAttribute("lists");
	for(String str : lists){
		out.print(str + "<br>");
	}
	//session.jsp 파일을 먼저 실행하지 않고 이 파일을 실행하게 되면 에러 발생 -> lists라는 데이터는 session.jsp 파일 안에 들어있기 때문!
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="SessionLocation2.jsp">SessionLocation2.jsp 바로가기</a>
</body>
</html>