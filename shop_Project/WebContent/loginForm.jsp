<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>

		<meta charset="UTF-8">
		<title>Insert title here</title>

	</head>

	<body>

		<h1>로그인 화면</h1>
		
		<form method="post" action="./loginFormAction.jsp">
		
			<div>memberId: </div>
			<div><input type = "text" name="memberId"></div>
			<div>memberPw: </div>
			<div><input type = "password" name="memberPw"></div>
			<button type= "submit">로그인</button>
		
		</form>
	

	</body>

</html>