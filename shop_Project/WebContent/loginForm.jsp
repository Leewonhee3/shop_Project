<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8"); //인코딩	
	//인증 방어 코드 : 로그인 전 session.getAttribute("loginMember") == null 인 경우
	if(session.getAttribute("loginMember")!=null){
		System.out.println("이미 로그인 되어 있음");
		response.sendRedirect("./index.jsp"); //로그인 되면 회원가입 하면 안됨
		return;
	}
%>

<!DOCTYPE html>
 <html>

	<head>

		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> <!-- jquery -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	</head>

	<body>
	
		<!-- start : serviceArea include -->
		<div>
		
			<jsp:include page="/partial/loginMenu/topMenu.jsp"></jsp:include>
		
		</div>
		
		<!-- end : serviceArea include -->
		
		<form method="post" action="<%=request.getContextPath() %>/loginFormAction.jsp" id ="loginForm">
			
			<div class="form-inline" "container row" style="float: none; margin:100 auto;">
				
				<div class="col-md-3" style="float: none; margin:0 auto;">
					
					<div>
					
						<div class=”col-sm-3 col-sm-push-9“>
							
							ID
							
						</div>
						
						<input type = "text" class="form-control" placeholder="아이디를 입력하세요" name="memberId" id ="memberId" value="">
					
					</div>
					
					<div>
					
						<div class=”col-sm-3 col-sm-push-9“>
							
							Password
							
						</div>
					
						<input type = "password" class="form-control" placeholder="비밀번호를 입력하세요" name="memberPw" id="memberPw" value="">
					
					</div>
					
					<button id="loginBtn" type= "button">로그인</button> <!--  21.09.28 don't using submit  -->
					
					<button id="insertBtn" type= "button">회원가입</button>
					
				</div>
				
			</div>		
		
		</form>

		<script>
	
			$('#loginBtn').click(function(){
				//loginBtn push event
				
				if($('#memberId').val() == ""){ //id is "" 
					
					alert("Id empty");
					return;
					
				}else if($('#memberPw').val() == ""){ // pw is ""
					
					alert("Pw empty");
					return;	
				
				}else{
				
					$('#loginForm').submit();
					
				}
				
			});
			
			$('#insertBtn').click(function(){
				
				location.href="insertMemberForm.jsp";
				
			});
		
		
		</script>
	
	</body>

</html>