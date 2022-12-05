<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="today" value="<%=new java.util.Date() %>" />
	
	<h4>날짜 포맷</h4>
	full : <fmt:formatDate value="${ today }" type="date" dateStyle="full" /><br />
	short : <fmt:formatDate value="${ today }" type="date" dateStyle="short" /><br />
	long : <fmt:formatDate value="${ today }" type="date" dateStyle="long" /><br />
	default : <fmt:formatDate value="${ today }" type="date" dateStyle="default" /><br />
	<!-- 
		full : 2022년 12월 5일 월요일
		short : 22. 12. 5.
		long : 2022년 12월 5일
		default : 2022. 12. 5.
	 -->
	
	<h4>시간 포맷</h4>
	full : <fmt:formatDate value="${ today }" type="time" timeStyle="full" /><br />
	short : <fmt:formatDate value="${ today }" type="time" timeStyle="short" /><br />
	long : <fmt:formatDate value="${ today }" type="time" timeStyle="long" /><br />
	default : <fmt:formatDate value="${ today }" type="time" timeStyle="default" /><br />
	<!-- 
		full : 오후 2시 17분 8초 대한민국 표준시
		short : 오후 2:17
		long : 오후 2시 17분 8초 KST
		default : 오후 2:17:08
	 -->
	
	<h4>날짜/시간 표시</h4>
	<fmt:formatDate value="${ today }" type="both" dateStyle="full" timeStyle="full" />
	<br />
	<fmt:formatDate value="${ today }" type="both" pattern="yyyy-MM-dd hh:mm:ss" />
	<!-- 
		2022년 12월 5일 월요일 오후 2시 17분 8초 대한민국 표준시
		2022-12-05 02:17:08
	 -->
</body>
</html>