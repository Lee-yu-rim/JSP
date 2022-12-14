<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.member.Member" %>
<%
	request.setCharacterEncoding("utf-8");

	String userid = request.getParameter("userid");
	String userpwd = request.getParameter("userpwd");
	
	String uid = "admin";
	
	Gson gson = new Gson();
	Member m;
	
	if(uid.equals(userid)){
		m = new Member(userid,userpwd);
	}else{
		m = new Member();
	}
	
	out.print(gson.toJson(m));  //gson : bean 객체에 작성된 데이터를 JSON 형태의 객체로 변환(ajaxServer3 파일에서의 데이터 형태로 변환됨) -> 문자열 형식의 json 객체 구성 후 클라이언트로 전송됨
// [
// 	{
// 		"nickName":"홍길동",
// 		"ph_number":"01012345678",
// 		"address":"서울"
// 	},
// 	{
// 		"nickName":"이순신",
// 		"ph_number":"01011113333",
// 		"address":"부산"
// 	},
// 	{
// 		"nickName":"손흥민",
// 		"ph_number":"01011114444",
// 		"address":"제주도"
// 	}
// ]
//원래 gson을 사용하지 않고 데이터를 넘길 때는 위와 같은 json 형식으로 데이터가 넘어가지만 gson을 사용하게 되면 저 형식은 그대로이지만 문자열로 데이터가 넘어가게 된다.
%>