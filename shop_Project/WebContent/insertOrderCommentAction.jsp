<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" import="dao.*" %>    
<%
	request.setCharacterEncoding("utf-8"); //인코딩	
	//인증 방어 코드 : 로그인 전 session.getAttribute("loginMember") == null 인 경우
	if(session.getAttribute("loginMember")==null){
		System.out.println("로그인 해야됨");
		response.sendRedirect("./index.jsp"); //로그인 안되면 후기 달수 없음.
		return;
	}
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
			Comment comment = new Comment();
			CommentDao commentDao = new CommentDao();
			
			System.out.println(Integer.parseInt(request.getParameter("orderNo"))+"<--- insertOrderCommentAction - getOrderNo");
			System.out.println(Integer.parseInt(request.getParameter("ebookNo"))+"<--- insertOrderCommentAction - getEbookNo");
			System.out.println(request.getParameter("content")+"<--- insertOrderCommentAction - getOrderCommentContent");
			System.out.println(Integer.parseInt(request.getParameter("score"))+"<--- insertOrderCommentAction - getOrderScore");
			//check
			
			comment.setOrderNo(Integer.parseInt(request.getParameter("orderNo")));
			comment.setEbookNo(Integer.parseInt(request.getParameter("ebookNo")));
			comment.setOrderCommentContent(request.getParameter("content"));
			comment.setOrderScore(Integer.parseInt(request.getParameter("score")));
			
			
			commentDao.insertOrderCommentReview(comment);
			response.sendRedirect(request.getContextPath()+"/selectOrderListByMember.jsp");
			
		%>
		
	</body>

</html>