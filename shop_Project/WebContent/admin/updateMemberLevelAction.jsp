<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" import= "dao.*" import = "java.util.*" %>
<%
<<<<<<< HEAD
=======
	request.setCharacterEncoding("utf-8");
>>>>>>> ce854bba22e3187dcb03732f5cf4982cbaf57825
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
			MemberDao memberDao = new MemberDao();
			
			member.setMemberLevel(Integer.parseInt(request.getParameter("memberLevel")));
			member.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
			memberDao.updateMemberLevelByAdmin(member,loginMember.getMemberPw());// 파라미터(변경할 회원의 넘버와 레벨,관리자의 비밀번호)
			response.sendRedirect(request.getContextPath()+"/admin/selectMemberList.jsp"); // 성공하면 멤버리스트로
		
		%>	
			

	</body>

</html>