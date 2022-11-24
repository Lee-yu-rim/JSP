<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.Person" %>

<%
	request.setAttribute("requestString", "request 영역의 문자열");
	request.setAttribute("requestPerson", new Person("안중근", 31));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		Person person = (Person)request.getAttribute("requestPerson");
	%>
	
	<%=request.getAttribute("requestString") %>
	<br>
	<%=person.getName() %>
	<%=person.getAge() %>
	
	<h2>페이지의 이동은 포워드한 방식으로 해야 한다.</h2>
	<%
		RequestDispatcher forward = request.getRequestDispatcher("RequestForward.jsp");
		forward.forward(request, response);
		
		//페이지 이동 메소드 두가지
		//getRequestDispatcher forward() - request 객체에 접근할 수 있는 권한을 넘겨주는 메소드 -> 기존 페이지의 파일정보가 페이지를 이동해도 이전 페이지 주소를 유지(request 객체 정보를 확인 가능)
		//페이지를 이동한 주소값이 http://localhost:8081/SecondProject/request.jsp 로 찍힘 Requestforward.jsp 이 아님
		//sendRedirect() - 페이지가 이동하면 기존 페이지의 파일정보가 아닌 이동한 페이지의 파일정보로 넘어감
		
		
	%>
</body>
</html>