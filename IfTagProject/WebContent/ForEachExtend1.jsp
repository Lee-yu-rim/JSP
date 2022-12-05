<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>향상된 for문 형태의 forEach 태그</h4>
	<%
		String[] rgba = {"Red","Green","Blue","Black"};
	%>
	<c:forEach items="<%=rgba %>" var="c"> <!-- items 안에는 표현식 또는 EL로 사용 가능 = ${rgba} -->
		<span style="color:${ c };">${ c }</span>
	</c:forEach>
	
	<h4>varStatus 속성 살펴보기</h4>
	<table border="1">
	<c:forEach items="<%=rgba %>" var="c" varStatus="loop">
		<tr>
			<td>count : ${ loop.count }</td> <!-- 1 2 3 4 -->
			<td>index : ${ loop.index }</td> <!-- 0 1 2 3 -->
			<td>current : ${ loop.current }</td>  <!-- red green blue black -->
			<td>first : ${ loop.first }</td>  <!-- true false false false -->
			<td>last : ${ loop.last }</td>   <!-- false false false true -->
		</tr>
	</c:forEach>
	</table>
</body>
</html>