<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" import="dao.*" import="java.util.*" %>    

<%

	request.setCharacterEncoding("utf-8");	
	
	//login check and need write value
	Member member = new Member();
	
	if(session.getAttribute("loginMember") != null) {
		
		member = (Member)session.getAttribute("loginMember");
	
	}
	
	int currentPage = 1; 
	if(request.getParameter("currentPage") != null){ // currentPage not null
		currentPage= Integer.parseInt(request.getParameter("currentPage"));
	}
	final int ROW_PER_PAGE = 10; // const
		
	int beginRow = (currentPage-1)*ROW_PER_PAGE;
	
	MemberDao memberDao = new MemberDao();
	QnADao qnaDao = new QnADao();
	ArrayList<QnA> qnaList = qnaDao.selectAnsweredQnAList(beginRow, ROW_PER_PAGE);
	
	System.out.println(qnaList.size()+"<------- selectQnAList - qnaList size");
	
%>

<!DOCTYPE html>
<html>

	<head>
	
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
	</head>
	
	<body>
	
		<!-- start : adminmenu include -->
		<div>
			
			<jsp:include page="/partial/adminMenu.jsp"></jsp:include>
			
		</div>
		<!-- end : adminmenu include -->
	
		<h2>Q&A 답변 목록</h2>
		
		<table border="1">
		
			<thead>
				
				<tr>
				
					<th>게시번호</th>
					<th>카테고리</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>수정</th>
					<th>삭제</th>
					
				</tr>
			
			</thead>
			
			<tbody>
				
				<%
					
					for(QnA q : qnaList){
				
				%>
				
						<tr>
						
							<td><%=q.getQnaNo() %></td>
							<td><%=q.getQnaCategory() %></td>
							
							<%
								if(q.getQnaSecret().equals("Y")){
									
							%>
									<td width ="500"><a href="<%=request.getContextPath() %>/admin/selectQnAOneAnswer.jsp?qnaNo=<%=q.getQnaNo()%>"><%=q.getQnaTitle()%></a><img src="<%=request.getContextPath()%>/img/lock.jpg" width="15" height="15"></td>
							
							<%		
									
								}else{
							
							%>
							
									<td width ="500"><a href="<%=request.getContextPath() %>/admin/selectQnAOneAnswer.jsp?qnaNo=<%=q.getQnaNo()%>"><%=q.getQnaTitle()%></a></td>	
							
							<%		
							
								}
							
							%>
						
							<td><%=memberDao.selectMemberConvertName(q.getMemberNo()) %></td>
							<td><%=q.getCreateDate() %></td>
							
							<%
							
								if(session.getAttribute("loginMember") != null) {
							
							%>
							
									<td><a href="<%=request.getContextPath()%>/updateQnAForm.jsp?memberNo=<%=q.getMemberNo()%>&qnaNo=<%=q.getQnaNo()%>">수정</a></td>
									<td><a href="<%=request.getContextPath()%>/deleteQnAAction.jsp?memberNo=<%=q.getMemberNo()%>&qnaNo=<%=q.getQnaNo()%>">삭제</a></td>
							
							<%
							
								}
							
							%>
						
						</tr>
			
				<% 
				
					}
				%>
				
			</tbody>
		
		
		</table>
		
		<%
			
			if(session.getAttribute("loginMember") != null) {
				
				System.out.println(member.getMemberNo()+"<---------member.getMemberNo()");
		
		%>
			
				<a href="<%=request.getContextPath()%>/insertQnAForm.jsp?memberNo=<%=member.getMemberNo()%>">글쓰기</a>	
		
		<%
			
			}
		
		%>	
		
	</body>

</html>