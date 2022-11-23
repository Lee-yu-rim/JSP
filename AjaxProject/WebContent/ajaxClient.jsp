<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>    
<html>
<head>
<meta charset="UTF-8">              
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type = "text/javascript">
	$(function(){
		$("#buttonSubmit").on("click",function(){   //제출 버튼 이벤트 생성
			$.ajax({
				//서버로 보내는 데이터 형식 지정
				url:'./ajaxServer.jsp',
				type:'post',
				data:{nickName:'귤'},
				
				//서버에서 받아오는 데이터 형식 지정
				dataType:'json',
				success:function(data){   //data = {"nickName":"귤"}
					console.log("요청성공");
					console.log(data.nickName);
					$("#nickName").text(data.nickName);
				}
			});
		});
	});
</script>
</head>
<body>
	<input id="buttonSubmit" type="button" value="제출">
	<p id="nickName"></p>
	<p>ajax 통신 성공</p>
	<!-- 위의 통신과 상관없이 p태그에 작성된 구문은 출력된다 - 비동기 처리 -->
</body>
</html>