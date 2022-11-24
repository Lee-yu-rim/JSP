package utils;

import javax.servlet.jsp.JspWriter;

public class JSFunction {
	//스크립트 코드를 메소드로 만들기
	
	//메세지 창 출력 및 지정한 페이지로 이동하는 메소드
	public static void alertLocation(String msg, String url, JspWriter out) {  //JspWriter - JSP 내장객체인 out 객체 가져오기
		try {
			String script = ""  //삽입할 자바스크립트 코드
							+ "<script>"
							+ "		alert('" + msg + "');"
							+ "		location.href='" + url + "';"   //location.href - url 페이지로 이동
							+ "</script>";
			
			out.println(script);  //위에 작성한 자바스크립트 코드를 out 내장객체로 출력한다.
		}catch(Exception e) {
			
		}
	}
	
	//메세지 창 출력 및 이전 페이지로 돌아가는 메소드
	public static void alertBack(String msg, JspWriter out) {
		try {
			String script = ""  //삽입할 자바스크립트 코드
							+ "<script>"
							+ "		alert('" + msg + "');"
							+ "		history.back();"   //history.back() - 이전 페이지로 돌아가기
							+ "</script>";
			
			out.println(script);  //위에 작성한 자바스크립트 코드를 out 내장객체로 출력한다.
		}catch(Exception e) {
			
		}
	}
}
