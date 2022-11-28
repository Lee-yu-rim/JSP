<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	//첫번째 방법 -session에 저장된 id과 name 삭제하기
	session.removeAttribute("UserId");
	session.removeAttribute("UserName");
	
	//두번째 방법 - session에 저장된 모든 정보 삭제
	session.invalidate();

	response.sendRedirect("LoginForm.jsp");
%>