<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" import= "dao.*" import = "java.util.*" %>
<%
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

	</head>

	<body>
			
		<% 
			request.setCharacterEncoding("utf-8");
			Member member = new Member();
			member.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
			System.out.println(member.getMemberNo()+"<----updateMemberPwForm - getMemberNo");
		%>
		
		<h1>비밀번호 수정</h1>
		
		
		<form method="post" action="./updateMemberPwAction.jsp">
		
				<!-- 변경할 비밀번호 입력 -->
				<div>memberPw: </div>
				<div><input type = "text" name="memberPw"></div>
				<div><input type = "text" name="memberNo" hidden="hidden" value = "<%=member.getMemberNo()%>"></div>s
				<button type= "submit">비밀번호 수정</button>
			
			</form>	
			
	</body>
	
</html>