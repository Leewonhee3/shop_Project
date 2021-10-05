<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" import="dao.*" %>    

<%
	
	request.setCharacterEncoding("utf-8");

	//protect code - login check
	if(session.getAttribute("loginMember") == null) {
		
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		System.out.println("not login!");
		return;
	
	}

	//parameter check
	
	System.out.println(request.getParameter("memberNo")+"<------- updateQnAAction - memberNo");
	System.out.println(request.getParameter("QnAtitle")+"<------- updateQnAAction - QnAtitle");
	System.out.println(request.getParameter("QnACategory")+"<------- updateQnAAction - QnACategory");
	System.out.println(request.getParameter("QnASecret")+"<------- updateQnAAction - QnASecret");
	System.out.println(request.getParameter("QnAcontent")+"<------- updateQnAAction - QnAcontent");
	
	//implemented
	QnADao qnaDao = new QnADao();
	QnA qna = new QnA();

	qna.setQnaNo(Integer.parseInt(request.getParameter("qnaNo")));
	qna.setQnaCategory(request.getParameter("QnACategory"));
	qna.setQnaTitle(request.getParameter("QnAtitle"));
	qna.setQnaContent(request.getParameter("QnAcontent"));
	qna.setQnaSecret(request.getParameter("QnASecret"));
	
	if(qna.getQnaSecret()==null){ // secret checkbox confirm
	
		System.out.println("active test");
		qna.setQnaSecret("N");
		
	}else{
		
		qna.setQnaSecret(request.getParameter("QnASecret"));
	
	}
	
	qna.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
	
	qnaDao.updateQnAByMember(qna);
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