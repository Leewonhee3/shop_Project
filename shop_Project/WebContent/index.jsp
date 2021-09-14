<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>

		<meta charset="UTF-8">
		<title>Insert title here</title>

	</head>

	<body>
	
		<!-- start : submenu include -->
		<div>
			
			<jsp:include page="/partial/submenu.jsp"></jsp:include>
			
		</div>
		<!-- end : submenu include -->
		<h1>메인페이지</h1>
		
		<div>
		
			<div><a href="<%=request.getContextPath() %>/loginForm.jsp">로그인</a></div>
			<div><a href="<%=request.getContextPath() %>/insertMemberForm.jsp">회원가입</a></div>	
		
		</div>
	
	</body>

</html>