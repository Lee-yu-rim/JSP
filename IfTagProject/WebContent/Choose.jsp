<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 변수 선언 -->
	<c:set var="number" value="100" />
	
	<h4>choose 태그로 홀짝 판단하기</h4>
	<c:choose>
		<c:when test="${number mod 2 eq 0 }">
			${number }는 짝수입니다.
		</c:when>
		<c:otherwise>
		 ${number }는 홀수입니다.
		</c:otherwise>
	</c:choose>
	
	<h4>국, 영, 수 점수를 입력하면 평균을 내어 학점 출력</h4>
	<form>  <!-- 점수 입력 폼 기본값 - method="get" action="현재 주소창의 url값" -->
		국어 : <input type="text" name="kor" /><br />
		영어 : <input type="text" name="eng" /><br />
		수학 : <input type="text" name="math" /><br />
		<input type="submit" value="학점 구하기" />
	</form>
	
	<!-- 모든 과목의 점수가 입력되었는지 확인 -->
	<c:if test="${not (empty param.kor or empty param.eng or empty param.math) }">  <!-- 괄호안에 or는 3개의 값이 모두 비어있다면인데 not을 붙여서 모두 비어있지 않다면으로 해석됨 -->
		<!-- 평균 계산 -->
		<c:set var="avg" value="${(param.kor + param.eng + param.math)/3 }" />
		평균 점수는 ${avg }으로
		<!-- 학점 출력 -->
		<c:choose>
			<c:when test="${avg >= 90 }">A학점</c:when>
			<c:when test="${avg >= 80 }">B학점</c:when>
			<c:when test="${avg ge 70 }">C학점</c:when>
			<c:when test="${avg ge 60 }">D학점</c:when>
		</c:choose>
		입니다.
	</c:if>
</body>
</html>