<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>로그인</h1>
	
	<form method="post" action="${pageContext.request.contextPath}/addMember" id = "loginForm">
	
		<div>
			
			id:
			<input type="text" id = "id">
			
		</div>
		
		<div>
			
			pw:
			<input type="password" id = "pw">
			
		</div>
	
	</form>
	
	<button type="button">로그인</button>
	
</body>
</html>