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

	</head>

	<body>
		
		<!-- start : submenu include -->
		<div>
			
			<jsp:include page="/partial/submenu.jsp"></jsp:include>
			
		</div>
		<!-- end : submenu include -->
		
		<h1>회원가입</h1>
		
		<form method="post" action="<%=request.getContextPath() %>/insertMemberAction.jsp">
				<!-- 아이디 -->
				<div>memberId: </div>
				<div><input type = "text" name="memberId"></div>
				<!-- 패스워드 -->
				<div>memberPw: </div>
				<div><input type = "password" name="memberPw"></div>
				<!-- 이름 -->
				<div>memberName: </div>
				<div><input type = "text" name="memberName"></div>
				<!-- 나이 -->
				<div>memberAge: </div>
				<div><input type = "text" name="memberAge"></div>
				<!-- 성별 -->
				<div>memberGender: </div>
				
				<div>
				
					<input type = "radio" name="memberGender" value = "남">남
					<input type = "radio" name="memberGender" value = "여">여
				
				</div>
				
				
				<button type= "submit">회원가입</button>
			
			</form>

	</body>

</html>