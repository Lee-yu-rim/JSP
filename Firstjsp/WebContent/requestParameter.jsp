<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String sex = request.getParameter("sex");
	
	//check box 속성은 배열형태로 값이 전달된다.
	String favoStr = "";
	String[] favo = request.getParameterValues("favo");
	for(String fa : favo){
		favoStr += fa + ", ";
	}
	
	String intro = request.getParameter("intro");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li><%=id %></li>
		<li><%=sex %></li>
		<li><%=favoStr %></li>
		<li><%=intro %></li>
	</ul>
</body>
</html>