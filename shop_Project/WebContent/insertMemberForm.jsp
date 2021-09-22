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
			
			<jsp:include page="/partial/mainMenu.jsp"></jsp:include>
			
		</div>
		<!-- end : submenu include -->
		
		<h1>회원가입</h1>
		
		<%
			request.setCharacterEncoding("utf-8"); //인코딩
			String insertId ="";//체크된 아이디가 중복인 경우 공백을 id vaule에 넣는다.
			String memberIdCheck = "";
			if(request.getParameter("memberIdCheck") != null){ // 체크할 아이디가 입력된 경우
				memberIdCheck = request.getParameter("memberIdCheck"); // 실행
			}
			
		%>
		<%
			if(request.getParameter("idCheckResult")==null){
				insertId=request.getParameter("memberIdCheck");
		%>
				<div>id is available</div> <!-- null인경우 사용가능한 아이디 -->
		<%		
			}else{
		%>
				<div><%=request.getParameter("idCheckResult") %></div> <!-- 이미 사용중인 아이디 -->
		<% 		
			}
		
		%>
		
		
		
		
		
		<!-- 멤버 아이디가 사용가능한지 확인하는 폼, 사용가능한 아이디면 id에 입력 중복아이디면 공백-->
		<form action="<%=request.getContextPath() %>/selectMemberIdCheckAction.jsp" method="post">
			
			<div>
			
				memberId : 
				<input type="text" name="memberIdCheck">
				<button type = "submit">duplicate check</button>
			
			</div>
		
		</form>
		
		
		
		<!-- 회원가입 폼 -->
		
		<form method="post" action="<%=request.getContextPath() %>/insertMemberAction.jsp">
				<!-- 아이디 -->
				<div>memberId: </div>
				<div><input type = "text" name="memberId" readonly="readonly" value="<%=insertId%>"></div>
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