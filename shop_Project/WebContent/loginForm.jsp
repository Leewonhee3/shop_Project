<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8"); //인코딩	
	//인증 방어 코드 : 로그인 전 session.getAttribute("loginMember") == null 인 경우
	if(session.getAttribute("loginMember")!=null){
		System.out.println("이미 로그인 되어 있음");
		response.sendRedirect("./index.jsp"); //로그인 되면 회원가입 하면 안됨
		return;
	}
%> 
<html>

	<head>

		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

	</head>

	<body>

		<h1>로그인 화면</h1>
		
		<form method="post" action="<%=request.getContextPath() %>/loginFormAction.jsp">
			
			<div class="form-inline">
			
				<label for="email" class="mr-sm-2">Email address:</label>
	  			<input type="email" class="form-control mb-2 mr-sm-2" placeholder="Enter email" id="email">
	  			<label for="pwd" class="mr-sm-2">Password:</label>
	  			<input type="password" class="form-control mb-2 mr-sm-2" placeholder="Enter password" id="pwd">
			
			</div>
		
			<label for="text">ID:</label>
			<div><input type = "text" class="form-control mb-2 mr-sm-2" placeholder="아이디를 입력하세요" name="memberId"></div>
			<div>memberPw: </div>
			<div><input type = "password" name="memberPw"></div>
			<button type= "submit">로그인</button>
		
		</form>
	

	</body>

</html>