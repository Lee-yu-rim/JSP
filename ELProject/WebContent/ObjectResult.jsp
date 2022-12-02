<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.Person" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>영역을 통해 전달된 객체 읽기</h2>
	<ul>
		<li>${personObj.name }, ${personObj.age }</li>  <!-- 여기서 name과 age는 getName과 getAge 라는 메소드 호출 -->
		<li>${requestScope.stringObj }</li>   <!-- requestScope는 생략 가능 -->
		<li>${integerObj }</li>
	</ul>
	
	<p>${param.firstNum + param.secondNum }</p>
	<p>${param.secondNum }</p>
</body>
</html>