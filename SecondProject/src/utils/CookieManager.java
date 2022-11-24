package utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieManager {
	//쿠키 생성하는 메소드 생성
	public static void makeCookie(HttpServletResponse response, String cName, String cValue, int cTime) {  //HttpServletResponse - JSP의 내장객체인 Response객체 가져오기
		
		//1. 쿠키 객체 생성
		Cookie cookie = new Cookie(cName,cValue); 
				
		//2. 쿠키의 생성 경로 설정 
		cookie.setPath("/");
				
		//3. 쿠키의 유지기간 설정
		cookie.setMaxAge(cTime); 
				
		//4. 응답 헤더에 쿠키 정보 저장 
		response.addCookie(cookie);
	}

	
	//쿠키 정보 읽어오는 메소드 생성
	public static String readCookie(HttpServletRequest request, String cName) {  //HttpServletRequest - JSP의 내장객체인 Request객체 가져오기
		String cookieValue = "";  //반환 값
		
		//1. 요청 헤더에서 쿠키 정보 가져오기
		Cookie[] cookies = request.getCookies();  
				
		//2. 쿠키 정보가 존재하는지 확인
		if(cookies != null){
			for(Cookie c : cookies){  //request 객체에 저장된 쿠키목록 가져오기
				String cookieName = c.getName();  
				
				//cName과 같은 쿠키이름을 가진 쿠키일 경우만 실행 -> 쿠키의 session 아이디 값을 가져오지 않도록 하는 기능
				if(cookieName.equals(cName)) {   
					cookieValue = c.getValue();   //반환 값 갱신
				}
			}
		}
		
		return cookieValue;   //cName과 같은 이름을 가진 쿠키의 값 반환
	    
	}
	
	//쿠키 삭제 기능 메소드 생성
	public static void deleteCookie(HttpServletResponse response, String cName) {
		makeCookie(response, cName, "", 0);   //value 값을 공백, 쿠키 유지기간을 0으로하면 쿠키 삭제 가능
	}

}
