<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#check").click(function(){
			if($("#userid").val() == ""){
				$("#result").text("아이디를 입력하세요.");
				return;
			}
			
			query = {
					userid:$("#userid").val(),
					userpwd:$("#userpwd").val()
			}
			
			$.ajax({
				url: 'ajaxServer5.jsp',
				type: 'post',
				data: query
			}).done(function(data){  //성공적으로 데이터가 처리되었을 경우 사용하는 함수
				//gson 으로 데이터가 넘어오면 문자열로 구성된 데이터가 넘어옴(data = 형식이 json인 문자열) -> 객체로 받아서 사용할 수 없다.
				obj = JSON.parse(data);   //문자열 형태로 된 데이터를 json 형식으로 변환해줌
				if(obj.userid != undefined){
					$("#result").text(obj.userid + " / " + obj.userpwd)
				}else{
					$("#result").text("존재하지 않는 아이디입니다.");
				}
			});   
		});
	});
</script>
</head>
<body>
	<label>user ID</label>
	<input type="text" id="userid" /><br/>
	<label>user PwD</label>
	<input type="password" id="userpwd" />
	<button id="check">Check</button>
	<p id="result"></p>
</body>
</html>