<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Collection" %>
<%
	String add_date = request.getParameter("add_date");
	String add_int = request.getParameter("add_int");
	String add_str = request.getParameter("add_str");
	
	response.addHeader("myBirthday",add_date);
	response.addHeader("myNumber",add_int);
	response.addHeader("myName",add_str);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Collection<String> headerNames = response.getHeaderNames();
	
	for(String hName : headerNames){
		String hValue = response.getHeader(hName);
	
%>
	<p><%=hValue %></p>
<%} %>
	
</body>
</html>