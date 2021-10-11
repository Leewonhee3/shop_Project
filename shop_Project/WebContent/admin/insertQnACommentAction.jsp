<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" import = "dao.*" import = "java.util.*" %>
<%

	request.setCharacterEncoding("utf-8");
	Member loginMember = (Member)session.getAttribute("loginMember");
	if(loginMember == null || loginMember.getMemberLevel() < 1) {
		System.out.println("오류");
		response.sendRedirect(request.getContextPath()+"/index.jsp");
   		return;
	
	} // 세션이 null이거나 레벨이 0인경우 일반 인덱스 페이지로 이동
	
	//check
	System.out.println(request.getParameter("qnaNo")+"<--------------- insertQnACommentAction");
	System.out.println(request.getParameter("memberNo")+"<--------------- insertQnACommentAction");
	System.out.println(request.getParameter("qnaCommentContent")+"<--------------- insertQnACommentAction");
	
	QnAComment qnaComment = new QnAComment();
	QnACommentDao qnaCommentDao = new QnACommentDao();
	
	qnaComment.setQnaNo(Integer.parseInt(request.getParameter("qnaNo")));
	qnaComment.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
	qnaComment.setQnaCommentContent(request.getParameter("qnaCommentContent"));
	
	//set chack
	
	System.out.println(qnaComment.toString()+"↑↑↑↑ insertQnACommentAction ↑↑↑↑");
	
	qnaCommentDao.insertQnAComment(qnaComment);
	
	response.sendRedirect(request.getContextPath()+"/admin/adminIndex.jsp");
	
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