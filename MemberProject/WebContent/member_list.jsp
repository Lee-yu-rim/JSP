<%@ page language="java" contentType="text/html; charset=UTf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	try{
		
		Context init = new InitialContext();
        DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/myoracle");
        conn = ds.getConnection();
        
        String sql = "select * from member";
        
        psmt = conn.prepareStatement(sql);
        rs = psmt.executeQuery();
        
	}catch(Exception e) {
		e.printStackTrace();
	}

%>
<html>
<head>
<title>회원관리 시스템 관리자모드(회원 목록 보기)</title>
</head>
<body>
<center>
<table border=1 width=500>
	<tr align=center><td colspan="5">회원 목록</td></tr>
	<tr align=center><td>아이디</td><td>이름</td><td>나이</td><td>성별</td><td>이메일</td> </tr>
	
	<%while(rs.next()){	%>
	
	<tr align="center">
		<td><a href="member_info.jsp?id=<%=rs.getString("id") %>"><%=rs.getString("id") %></a></td>
		<td><%= rs.getString("name") %></td>
		<td><%=rs.getInt("age") %></td>
		<td><%=rs.getString("gender") %></td>
		<td><%=rs.getString("email") %></td>
	</tr>
	
	
	<%} %>
	
</table>
</center>
</body>
</html>
