<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.DBConnPool" %>

<%
	DBConnPool pool = new DBConnPool();
	pool.close();
	out.print("<h1>DB연결 성공</h1>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>