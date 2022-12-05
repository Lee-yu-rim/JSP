<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="common.Person" %>
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
	<h4>List 컬렉션 사용하기</h4>
	<%
		LinkedList<Person> lists = new LinkedList<Person>();
		lists.add(new Person("맹사성", 34));
		lists.add(new Person("장영실", 44));
		lists.add(new Person("신숙주", 54));
 		//session.setAttribute("lists", lists)  //영역객체를 통해 객체를 담는 방법
	%>
	<c:set var="lists" value="<%=lists %>" />  <!-- 1. Map이나 List에 담긴 값을 반복문에 사용하기 위해선 변수나 영역객체에 값을 받아와서 사용해야한다.(직접 사용 불가) -->
	<c:forEach items="${ lists }" var="list">  <!-- 2. items 속성에 표현언어로 넣어줌 -->
	<li>
		이름 : ${ list.name }, 나이 : ${ list.age }
	</li>
	</c:forEach>
	
	<h4>Map 컬렉션 사용하기</h4>
	<%
		Map<String,Person> maps = new HashMap<String,Person>();
		maps.put("1st", new Person("맹사성", 34));
		maps.put("2nd", new Person("장영실", 44));
		maps.put("3rd", new Person("신숙주", 54));  
 		//session.setAttribute("maps", maps);   //영역객체를 통해 객체를 담는 방법
	%>
	<c:set var="maps" value="<%=maps %>" />  <!-- 1. Map이나 List에 담긴 값을 반복문에 사용하기 위해선 변수나 영역객체에 값을 받아와서 사용해야한다.(직접 사용 불가) -->
	<c:forEach items="${ maps }" var="map">  <!-- 2. items 속성에 표현언어로 넣어줌 -->
		<li>Key => ${ map.key } <br />		 <!-- 3. map.key 형태로 key값 받아오기 -->
			Value => 이름 : ${ map.value.name }, 나이 : ${ map.value.age }</li>  <!-- 4. map.value.값 형태로 value 값 받아오기 -->
	</c:forEach>
	
	<iframe src="http://www.daum.net" style="width:100%;height:600px;"></iframe>
</body>
</html>