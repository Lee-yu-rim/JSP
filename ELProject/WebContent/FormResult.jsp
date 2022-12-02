<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li>${param.name }</li>
		<li>${param.gender }</li>
		<li>${param.grade }</li>
		<li>
			${paramValues.inter[0] }
			${paramValues.inter[1] }
			${paramValues.inter[2] }
			${paramValues.inter[3] }
		</li>
	</ul>
</body>
</html>