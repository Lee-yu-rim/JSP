<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="common.JDBConnect2" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		JDBConnect2 jdbc = new JDBConnect2();
		
		//DB 데이터 수정
// 		String updatesql = "update emp01 set deptno = ? where deptno = ?";
// 		PreparedStatement psmt2 = jdbc.con.prepareStatement(updatesql);
// 		psmt2.setInt(1, 10);  //1번 물음표
// 		psmt2.setInt(2, 30);  //2번 물음표
		//deptno 번호가 10번인 부서를 30번으로 변경하라 는 뜻
		
// 		psmt2.executeUpdate();

		//DB 데이터 삭제
// 		String deletesql = "delete from emp01 where deptno = ?";
// 		PreparedStatement psmt3 = jdbc.con.prepareStatement(deletesql);
// 		psmt3.setInt(1, 10);  //부서번호가 10번인 사원 삭제
// 		psmt3.executeUpdate();
	
		//DB 데이터 조회
		String sql = "select * from emp";
		PreparedStatement psmt = jdbc.con.prepareStatement(sql);
		ResultSet rs = psmt.executeQuery();
		
		while(rs.next()){
			int empno = rs.getInt(1);
			String ename = rs.getString(2);
			String job = rs.getString(3);
			int mgr = rs.getInt(4);
			String hiredate = rs.getString(5);  //날짜는 String 타입으로도 가능
			int sal = rs.getInt(6);
			int comm = rs.getInt(7);
			int deptno = rs.getInt(8);
			
			out.print(String.format("%d %s %s %d %s %d %d %d",empno,ename,job,mgr,hiredate,sal,comm,deptno) + "<br>");
		}
	
		jdbc.close();
	%>
</body>
</html>