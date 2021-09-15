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
		
		<!-- start : submenu include -->
		<div>
			
			<jsp:include page="/partial/submenu.jsp"></jsp:include>
			
		</div>
		<!-- end : submenu include -->
		
		<form method="post" action="<%=request.getContextPath() %>/loginFormAction.jsp">
			
			<div class="form-inline" "container row" style="float: none; margin:100 auto;">
				
				<div class="col-md-3" style="float: none; margin:0 auto;">
						
					<h1>로그인 화면</h1>
					
					<div>
					
						<div class=”col-sm-3 col-sm-push-9“>
							
							ID
							
						</div>
						
						<input type = "text" class="form-control" placeholder="아이디를 입력하세요" name="memberId">
					
					</div>
					
					<div>
					
						<div class=”col-sm-3 col-sm-push-9“>
							
							Password
							
						</div>
					
						<input type = "password" class="form-control" placeholder="비밀번호를 입력하세요" name="memberPw">
					
					</div>
					
					<button type= "submit">로그인</button>
				
				</div>
				
			</div>		
		
		</form>
	

	</body>

</html>