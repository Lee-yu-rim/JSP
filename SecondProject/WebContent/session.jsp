<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%
	ArrayList<String> lists = new ArrayList<String>();
	lists.add("리스트");
	lists.add("컬렉션");
	session.setAttribute("lists", lists);   //session.setAttribute("속성명",value값) : session영역에 데이터 저장
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="SessionLocation.jsp">SessionLocation.jsp 바로가기</a>
</body>
</html>