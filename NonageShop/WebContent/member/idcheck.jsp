<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="CSS/subpage.css" rel="stylesheet">
<style type="text/css">
	body{   
	  background-color:#B96DB5;
	  font-family: Verdana;
	}
	#wrap{     
	  margin: 0 20px;
	}
	h1 {
	  font-family: "Times New Roman", Times, serif;
	  font-size: 45px;
	  color: #CCC;
	  font-weight: normal;
	}
	input[type=button], input[type=submit] {
	  float: right;
	}
</style>
<script>
	function idok(){
		opener.formm.id.value = "${id}";
		opener.formm.reid.value = "${id}";
		self.close();
	}
</script>
</head>
<body>
	<div id="wrap">
		<h1>ID 중복확인</h1>
		<form method="post" name="formm" style="margin-right:0" action="NonageServlet?command=id_check_form">
			User ID <input type="text" name="id" value="" />
			<input type="submit" value="검색" class="submit" /><br>
			
			<div style="margin-top:20px">
				<c:if test="${message == 1}">  <!-- 중복 아이디인 경우 -->
					<script>
						opener.document.formm.id.value = "";  <!-- 부모창인 원래 페이지의 id창의 값을 공백으로 변경 -->
					</script>
					${id}는 이미 사용 중인 아이디입니다.
				</c:if>
				<c:if test="${message == -1}">
					${id}는 사용 가능한 아이디입니다.
					<input type="button" value="사용" class="cancel" onclick="idok()" />
				</c:if>
			</div>
		</form>
	</div>
</body>
</html>