<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="common.Person" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- page 영역에 저장됨 -->
	<!-- set : 변수 설정 -->
	<c:set var="directVar" value="100" />  <!-- = int directVal = 100 -->
	<c:set var="eVar" value="${directVar mod 5 }"/>
	<c:set var="expVar" value="<%=new Date() %>" />
	<c:set var="betweenVar">변수값 이렇게 설정</c:set>
	
	directVar : ${pageScope.directVar }<br />
	eVar : ${eVar }<br />
	expVar : ${expVar }<br />
	betweenVar : ${betweenVar }<br />
	
	<c:set var="personVar1" value='<%=new Person("박문수",50) %>' scope="request" />  <!-- 영역 넓히기 -->
	${requestScope.personVar1.name }<br />
	${personVar1.age }<br />  <!-- request 영역에만 저장된 값이므로 scope 생략 가능 -->
	
	<p>personVar1 변수 삭제 후</p>
	
	<!-- remove : 변수 삭제 -->
	<c:remove var="personVar1" scope="request" />
	${requestScope.personVar1.name }<br />
	${personVar1.age }<br />
</body>
</html>


































