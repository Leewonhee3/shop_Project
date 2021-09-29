<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" import= "dao.*" import = "java.util.*" %>
<%

	request.setCharacterEncoding("utf-8");
	Member loginMember = (Member)session.getAttribute("loginMember");
	if(loginMember == null || loginMember.getMemberLevel() < 1) {
		System.out.println("오류");
		response.sendRedirect(request.getContextPath()+"/index.jsp");
   		return;
	
	} // 세션이 null이거나 레벨이 0인경우 일반 인덱스 페이지로 이동 
%>
<!DOCTYPE html>
<html>

	<head>

		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

	</head>

	<body>
			
		<% 
			request.setCharacterEncoding("utf-8");
			Member member = new Member();
			member.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
			System.out.println(member.getMemberNo()+"<----deleteMemberForm - getMemberNo");
		%>
		
		<h1>등급 수정</h1>
		
		
		<form method="post" action="./deleteMemberAction.jsp">
		
				정말로 삭제하시겠습니까?
				<div><input type = "text" name="memberNo" hidden="hidden" value = "<%=member.getMemberNo()%>"></div>s
				<button type= "submit">삭제</button>
			
			</form>	
			
	</body>
	
</html>