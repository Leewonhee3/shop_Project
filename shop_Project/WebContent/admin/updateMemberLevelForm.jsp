<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" import= "dao.*" import = "java.util.*" %>
<!DOCTYPE html>
<html>

	<head>

		<meta charset="UTF-8">
		<title>Insert title here</title>

	</head>

	<body>
			
		<% 
			request.setCharacterEncoding("utf-8");
			Member member = new Member();
			member.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
			System.out.println(member.getMemberNo()+"<----updateMemberLevelForm - getMemberNo");
		%>
		
		<h1>등급 수정</h1>
		
		
		<form method="post" action="./updateMemberLevelAction.jsp">
		
				<!-- 변경할 등급 입력 -->
				<div>memberLevel: </div>
				<div><input type = "text" name="memberLevel"></div>
				<div><input type = "text" name="memberNo" hidden="hidden" value = "<%=member.getMemberNo()%>"></div>s
				<button type= "submit">등급수정</button>
			
			</form>	
			
	</body>
	
</html>