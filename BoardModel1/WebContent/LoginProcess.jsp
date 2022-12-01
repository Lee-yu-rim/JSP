<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="membership.MemberDTO" %>
<%@ page import="membership.MemberDAO" %>
<%
	//LoginForm으로부터 id와 pw값 가져오기
	String userId = request.getParameter("user_id");
	String userPwd = request.getParameter("user_pw");

	//web.xml에서 DB 정보 가져와서 연결
	String oracleDriver = application.getInitParameter("OracleDriver");
	String oracleURL = application.getInitParameter("OracleURL");
	String oracleId = application.getInitParameter("OracleId");
	String oraclePwd = application.getInitParameter("OraclePwd");
	
	//form에서 입력된 id의 회원 정보를 DB의 member 테이블에서 가져오기
	MemberDAO dao = new MemberDAO(oracleDriver,oracleURL,oracleId,oraclePwd);
	MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);
	dao.close();
	
	//로그인 성공 유무 확인
	if(memberDTO.getId() != null) {  //DB안에 입력된 id의 정보가 있다면
		//로그인 성공
		session.setAttribute("UserId", memberDTO.getId());   //session영역에 id와 name 데이터 저장하기
		session.setAttribute("UserName", memberDTO.getName());
		response.sendRedirect("LoginForm.jsp");  //form 페이지로 이동
	}else{
		//로그인 실패
		request.setAttribute("LoginErrMsg","로그인 오류입니다.");
		request.getRequestDispatcher("LoginForm.jsp").forward(request, response);  //form 페이지로 이동
	}
%>