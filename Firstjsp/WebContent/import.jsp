<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%
	// 	자바코드를 작성할 수 있는 구간
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//	자바코드를 작성할 수 있는 구간
	Date today = new Date();
	int hour = today.getHours();
// 	out.print(hour);
	
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-mm-dd");
	out.print(sf.format(today));
%>
 
</body>
</html>