<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vo.*" import="dao.*" %>

<%

	request.setCharacterEncoding("utf-8");
	
	// login check
	if(session.getAttribute("loginMember") == null) {
		System.out.println("오류");
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		return;
	
	}
	
	QnA qna = new QnA();
	QnADao qnaDao = new QnADao();
	
	System.out.println(request.getParameter("memberNo")+"<--------deleteQnAAcition - memberNo");//check
	System.out.println(request.getParameter("QnANo")+"<--------deleteQnAAcition - QnANo");
	
	Member member = (Member)session.getAttribute("loginMember");
	qna.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
	
	// target memberNo == session memberNo check
	if(member.getMemberNo() != qna.getMemberNo()){
		
		System.out.println("삭제권한 없음.");
		response.sendRedirect(request.getContextPath()+"/selectQnAList.jsp");
		return;
		
	}
	
	qna.setQnaNo(Integer.parseInt(request.getParameter("qnaNo")));
	
	qnaDao.deleteQnAByMember(qna);
	response.sendRedirect(request.getContextPath()+"/selectQnAList.jsp"); // 성공

%>

<!DOCTYPE html>
<html>

	<head>

		<meta charset="UTF-8">
		<title>Insert title here</title>

	</head>

	<body>
	
	</body>

</html>