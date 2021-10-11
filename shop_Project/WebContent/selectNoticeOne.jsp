<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vo.*" import="dao.*"%>

<%

	request.setCharacterEncoding("utf-8");
	System.out.println(request.getParameter("noticeNo")+"<----- selectNoticeOne - noticeNo");
	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
	NoticeDao noticeDao = new NoticeDao();
	Notice notice = noticeDao.selectNoticeOne(noticeNo);
	MemberDao memberDao = new MemberDao();
	
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
			
			<jsp:include page="/partial/mainMenu/mainMenu.jsp"></jsp:include>
			
		</div>
		<!-- end : mainmenu include -->
			
		<table border="1">
		
			<thead>
				
					<th>글번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>작성일</th>
				
			</thead>
		
			<tbody>
				
				<tr>
				
					<td><%=notice.getNoticeNo() %></td>
					<td><%=notice.getNoticeTitle() %></td>
					<td><%=memberDao.selectMemberConvertName(notice.getMemberNo()) %></td>
					<td><%=notice.getCreateDate() %></td>
				
				</tr>
			
			</tbody>
			
			<tr>
				
				<td><%=notice.getNoticeContent() %></td>
			
			</tr>
			
		</table>
		
	
	</body>

</html>