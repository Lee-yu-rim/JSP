<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="utils.JSFunction" %>
<%
	//로그인 유무 판단
	if(session.getAttribute("UserId") == null) {
		JSFunction.alertLocation("로그인 후 이용해주십시오.", "./LoginForm.jsp", out);
		return;
	}
%>