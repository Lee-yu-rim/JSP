<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>포워드된 페이지</h2>
	<p><%=pageContext.getAttribute("pAttr") %></p>
	<p><%=request.getAttribute("rAttr") %></p>
</body>
</html>