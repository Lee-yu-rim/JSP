<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="common.JDBConnect" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		JDBConnect jdbc = new JDBConnect(application);
	
		//DB 데이터 수정
// 		String updatesql = "update emp01 set deptno = ? where deptno = ?";
// 		PreparedStatement psmt2 = jdbc.con.prepareStatement(updatesql);
// 		psmt2.setInt(1, 10);
// 		psmt2.setInt(2, 30);
	
// 		psmt2.executeUpdate();

		//DB 데이터 삭제
// 		String deletesql = "delete from emp01 where deptno = ?";
// 		PreparedStatement psmt3 = jdbc.con.prepareStatement(deletesql);
// 		psmt3.setInt(1, 10);  //부서번호가 10번인 사원 삭제
// 		psmt3.executeUpdate();
		
		
		String sql = "select * from emp01";
		PreparedStatement ps = jdbc.con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()){
			int empno = rs.getInt(1);
			String ename = rs.getString(2);
			String job = rs.getString(3);
			int mgr = rs.getInt(4);
			Date hiredate = rs.getDate(5);
			int sal = rs.getInt(6);
			int comm = rs.getInt(7);
			int deptno = rs.getInt(8);
			
			out.print(String.format("%d %s %s %d %s %d %d %d", empno,ename,job,mgr,hiredate,sal,comm,deptno) +"<br>");
		}
	
		jdbc.close();
	%>
</body>
</html>