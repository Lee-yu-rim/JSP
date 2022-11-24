<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  //쿠키 생성 파일
	String chkVal = request.getParameter("inactiveToday");  // 1
	
	//넘어온 데이터(parameter 값)가 1일 경우에만 쿠키 생성
	if(chkVal != null && chkVal.equals("1")){
		
		//1. 쿠키 객체 생성
		Cookie cookie = new Cookie("PopupClose","off"); 
		
		//2. 쿠키의 생성 경로 설정 
		cookie.setPath(request.getContextPath());
		
		//3. 쿠키의 유지기간 설정
		cookie.setMaxAge(60*60*24); 
		
		//4. 응답 헤더에 쿠키 정보 저장 
		response.addCookie(cookie);
		
		out.print("<h1>하루동안 창 열기 금지</h1>");
		
		//"하루동안 열지않기"를 선택하고 닫기를 누르면 PopupClose 속성의 value 값이 off인 쿠키 생성
	}
	

%>