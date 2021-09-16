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
			MemberDao memberDao = new MemberDao();
			
			member.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
			
			memberDao.deleteMemberByAdmin(member.getMemberNo());
			response.sendRedirect(request.getContextPath()+"/admin/selectMemberList.jsp"); // 성공하면 멤버리스트로
		
		%>	
			

	</body>

</html>