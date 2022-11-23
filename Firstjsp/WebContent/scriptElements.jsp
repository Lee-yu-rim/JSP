<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
스크립트의 세가지 형식
<br>

<%!
	//선언문
    //변수나 메소드 정의
    //전역 변수(인스턴스 변수)
    
    int sum = 0;

    public int add(int x, int y){
       sum = x+y;
       return sum;
    }
%> 

<br>

<% 	
	//스크립틀릿
    //변수나 실행문 정의(메소드 정의 불가 -> 스크립틀릿은 이미 메소드로 정의되어 있기 때문에 메소드 안에 메소드를 작성 할 수 없다.)
    //지역 변수 -> 스크립틀릿에서 선언된 변수는 선언문에서 쓸 수 없다.
    	
    int result = add(10,20);
%> 

<br>

결과: 
<%= result %>  <!-- 표현식 (자바의 결과 출력) -->

<br>

결과: 
<%= add(50,60) %>

</body>
</html>