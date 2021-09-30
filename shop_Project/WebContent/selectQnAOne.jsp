<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vo.*" import="dao.*"%>

<%

	request.setCharacterEncoding("utf-8");
	System.out.println(request.getParameter("qnaNo")+"<----- selectQnAOne - qnaNo"); //check
	
	int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
	
	MemberDao memberDao = new MemberDao();
	QnADao qnaDao = new QnADao();
	QnA qna = qnaDao.selectQnAOne(qnaNo);
	
	
%>

<!DOCTYPE html>
<html>

	<head>

		<meta charset="UTF-8">
		<title>Insert title here</title>

	</head>

	<body>
		
		<!-- start : mainmenu include -->
		<div>
			
			<jsp:include page="/partial/mainMenu.jsp"></jsp:include>
			
		</div>
		<!-- end : mainmenu include -->
		
		<table border="1">
		
			<thead>
				
					<th>글번호</th>
					<th>카테고리</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>작성일</th>
				
			</thead>
		
			<tbody>
				
				<tr>
				
					<td><%=qna.getQnaNo() %></td>
					<td><%=qna.getQnaCategory() %></td>
					<td><%=qna.getQnaTitle() %></td>
					<td><%=memberDao.selectMemberConvertName(qna.getMemberNo()) %></td>
					<td><%=qna.getCreateDate() %></td>
				
				</tr>
			
			</tbody>
			
			<tr>
			
				<td>
				
					내용 : <%=qna.getQnaContent() %>
				
				</td>
			
			</tr>
			
		</table>
		
	
	</body>

</html>