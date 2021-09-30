<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" import="dao.*" %>    

<%
	
	request.setCharacterEncoding("utf-8");

	//login check
	if(session.getAttribute("loginMember") == null) {
		
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		System.out.println("not login!");
		return;
	
	}

	//parameter check
	
	System.out.println(request.getParameter("memberNo")+"<------- insertQnAAction - memberNo");
	System.out.println(request.getParameter("QnAtitle")+"<------- insertQnAAction - QnAtitle");
	System.out.println(request.getParameter("QnACategory")+"<------- insertQnAAction - QnACategory");
	System.out.println(request.getParameter("QnASecret")+"<------- insertQnAAction - QnASecret");
	System.out.println(request.getParameter("QnAcontent")+"<------- insertQnAAction - QnAcontent");
		
	QnADao qnaDao = new QnADao();
	QnA qna = new QnA();

	qna.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
	qna.setQnaTitle(request.getParameter("QnAtitle"));
	qna.setQnaCategory(request.getParameter("QnACategory"));
	
	if(request.getParameter("QnASecret")==null){ // secret checkbox confirm
	
		qna.setQnaSecret("N");
		
	}else{
		
		qna.setQnaSecret(request.getParameter("QnASecret"));
	
	}
	
	qna.setQnaContent(request.getParameter("QnAcontent"));
	
	qnaDao.insertQnAByMember(qna);
	response.sendRedirect(request.getContextPath()+"/selectQnAList.jsp");
	
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