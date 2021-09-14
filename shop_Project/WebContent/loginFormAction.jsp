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
		
		String memberId = request.getParameter("memberId");
		String memberPw = request.getParameter("memberPw");
		//디버깅
		System.out.println(memberId+"<-----loginFormAction - request.memberId");
		System.out.println(memberPw+"<-----loginFormAction - request.memberPw");
	
		MemberDao memberDao = new MemberDao();
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberPw(memberPw);
		//디버깅
		System.out.println(member.getMemberId()+"<---loginFormAction -  member.memberId");
		System.out.println(member.getMemberPw()+"<---loginFormAction -  member.memberPw");
		
		Member returnMember = memberDao.login(member);
		
		if(returnMember == null){
			System.out.println("실패");
			response.sendRedirect("./loginForm.jsp");
			return;
		}else{
			System.out.println("성공");
			//디버깅
			System.out.println(returnMember.getMemberId()+"<---loginFormAction -  returnMember.memberId");
			System.out.println(returnMember.getMemberName()+"<---loginFormAction -  returnMember.memberId");
			System.out.println(returnMember.getMemberLevel()+"<---loginFormAction -  returnMember.memberId");
			session.setAttribute("loginMember", returnMember);
			response.sendRedirect("./index.jsp");
		}
	 %>
	</body>

</html>