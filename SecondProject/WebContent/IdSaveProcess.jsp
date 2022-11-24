<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="utils.CookieManager" %>
<%@ page import="utils.JSFunction" %>

<%
	//입력된 정보를 parameter 통해 받아오기
	String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");
	String save_check = request.getParameter("save_check");
	
	//로그인 성공/실패 확인하기
	if("must".equals(user_id) && "1234".equals(user_pw)){
		
		//"아이디 저장" 항목 체크 확인 후 체크된 경우만 쿠키 생성하기
		if(save_check != null && save_check.equals("Y")){
			CookieManager.makeCookie(response, "loginId", user_id, 86400);
			
		//"아이디 저장" 항목을 체크 해제했을 때 아이디가 보이지 않도록 쿠키 삭제하기
		}else{
			CookieManager.deleteCookie(response, "loginId");
		}
		
		//로그인 성공시 원하는 페이지로 이동하기 
		JSFunction.alertLocation("로그인 성공", "idSave.jsp", out);
		
	}else{
		
		//로그인 실패시 이전 페이지로 이동하기
		JSFunction.alertBack("로그인 실패", out);
	}

%>