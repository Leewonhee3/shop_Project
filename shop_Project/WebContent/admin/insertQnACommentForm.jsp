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

	System.out.println(request.getParameter("qnaNo")+"<----- admin/selectQnAOne - qnaNo"); //check
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
			
			<jsp:include page="/partial/adminMenu.jsp"></jsp:include>
			
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
		
		<h2>답변하기</h2>
		
		<form action="<%=request.getContextPath() %>/admin/insertQnACommentAction.jsp" method="post">
			
			<input type="hidden" name="qnaNo" id="qnaNo" value="<%=qna.getQnaNo()%>">
			<input type="hidden" name="memberNo" id="memberNo" value="<%=loginMember.getMemberNo()%>">
			
			<div width="100" height="100">
				
				<textarea name = "qnaCommentContent" id="qnaCommentContent" rows=10 cols=100 style="text-align:center;"></textarea>
			
			</div>
						
			
			<div>
			
				<button type="submit">답변하기</button>
			
			</div>
		
		</form>
		
	</body>

</html>