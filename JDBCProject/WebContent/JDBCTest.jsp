<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	Connection conn = null;

	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");   //Class : 원하는 클래스가 있는지 확인해주는 클래스
		conn = DriverManager.getConnection(url,"musthave","1234");  //DriverManager.getConnection(실제데이터를 사용할 DB 주소, "ID(계정)" , "PW") - db를 사용할 곳과 연결
		
		conn.close();  //연결 해제
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	DB 연결 성공
</body>
</html>