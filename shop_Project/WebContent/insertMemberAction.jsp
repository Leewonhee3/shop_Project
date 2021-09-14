<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" import="dao.*" %>
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
		
		member.setMemberId(request.getParameter("memberId"));
		member.setMemberPw(request.getParameter("memberPw"));
		member.setMemberName(request.getParameter("memberName"));
		member.setMemberAge(Integer.parseInt(request.getParameter("memberAge")));
		member.setMemberGender(request.getParameter("memberGender"));
		
		System.out.println(member.getMemberId()+"<--- insertMemberAction - memberId");
		System.out.println(member.getMemberPw()+"<--- insertMemberAction - memberPw");
		System.out.println(member.getMemberAge()+"<--- insertMemberAction - memberAge");
		System.out.println(member.getMemberName()+"<--- insertMemberAction - memberName");
		System.out.println(member.getMemberGender()+"<--- insertMemberAction - memberGender");
		//디버깅
		
		memberDao.insertMember(member);
		response.sendRedirect("./loginForm.jsp");
	%>
	</body>

</html>