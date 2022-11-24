<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="common.Person" %>

<%
	Map<String,Person> maps = (Map<String,Person>)application.getAttribute("maps");
	Set<String> keys = maps.keySet();  //keySet() - key 값만 가져오기 / EntrySet() - key + value 값 / 
	
	for(String key : keys){
		Person person = maps.get(key);   //key 값을 이용해서 value값 읽어오기
		out.print("이름 " + person.getName() + "<br>");
		out.print("나이 " + person.getAge() + "<br>");
	}
	//application 영역은 브라우저를 닫고 다시 실행해도 데이터가 손실되지 않음 -> tomcat 서버를 중단해야 브라우저 실행이 중단됨
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