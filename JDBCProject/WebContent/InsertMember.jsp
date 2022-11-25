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
<!-- <h2>회원 추가 테스트(executeUpdate() 사용)</h2> -->
	<%
// 	JDBConnect jdbc = new JDBConnect();   //DB 연결
	
// 	String sql = "insert into member values(?,?,?,sysdate)";   //동적 쿼리문
// 	PreparedStatement psmt = jdbc.con.prepareStatement(sql);   //PreparedStatement 객체 생성 방식
	
// 	//DB에 담긴 값의 타입에 따라 set메소드를 변경해서 적용한다.
// 	//DB에 데이터 삽입
// 	psmt.setString(1, "test1");  //id   //문자열 가져오는 메소드
// 	psmt.setString(2, "1111");   //pw
// 	psmt.setString(3, "회원1");   //name
	
// 	int result = psmt.executeUpdate();   //쿼리문 실행
// 	if(result != 0){
// 		out.print("쿼리문 실행 완료");
// 	}else{
// 		out.print("쿼리문 실행 실패");
// 	}
	
// 	psmt.close();
// 	jdbc.close();
	%>	
	
	<h2>회원 목록 조회 테스트(executeQuery() 사용)</h2>
	<%
		JDBConnect jdbc = new JDBConnect();
	
		String sql = "select * from member";   //정적 쿼리문
		Statement stmt = jdbc.con.createStatement();   //Statement객체 생성 방식 -> sql 여기서 안씀
		
		//DB 데이터 조회
		ResultSet rs = stmt.executeQuery(sql);   //select 구문은 조회한 데이터를 레코드 단위로 주소값을 가져와서 ResultSet 객체에 넣어줌
		
		while(rs.next()){   //다음 레코드로 갔을 때 레코드가 있으면 true / 레코드가 없으면 false 반환
			String id = rs.getString("id");  //읽어올 컬럼명   //= rs.getString(1)  첫번째 컬럼 가져오기
			String pw = rs.getString("pass");
			String name = rs.getString("name");
			java.sql.Date regidate = rs.getDate("regidate");
		
			out.print(String.format("%s %s %s %s", id, pw, name, regidate) + "<br>");
		}
		
		//ResultSet(rs) -> PreparedStatement(psmt) / Statement(smt) -> Connection(con) => 이 객체들은 반드시 순서대로 close 해줘야함
		jdbc.close();
	%>
	
</body>
</html>