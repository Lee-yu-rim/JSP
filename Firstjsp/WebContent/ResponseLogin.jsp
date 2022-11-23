<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("user_id");
	String pw = request.getParameter("user_pw");
	
	if(id.equalsIgnoreCase("must") && pw.equalsIgnoreCase("1234")){   //equalsIgnoreCase() - 대소문자 구분 없이 문자열 비교하는 메소드
		response.sendRedirect("ResponseWelcome.jsp");    //sendRedirect() - 페이지 이동 메소드
	}else{
		response.sendRedirect("request3.jsp");
	}
%>
