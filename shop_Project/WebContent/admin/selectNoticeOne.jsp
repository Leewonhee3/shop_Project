<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vo.*" import="dao.*"%>

<%

	request.setCharacterEncoding("utf-8");
	Member loginMember = (Member)session.getAttribute("loginMember");
	if(loginMember == null || loginMember.getMemberLevel() < 1) {
		System.out.println("오류");
		response.sendRedirect(request.getContextPath()+"/index.jsp");
			return;
	
	} // 세션이 null이거나 레벨이 0인경우 일반 인덱스 페이지로 이동 

	System.out.println(request.getParameter("noticeNo")+"<----- selectNoticeOne - noticeNo");
	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
	NoticeDao noticeDao = new NoticeDao();
	Notice notice = noticeDao.selectNoticeOne(noticeNo);
	MemberDao meberDao = new MemberDao();
	
%>

<!DOCTYPE html>
<html>

	<head>

		<meta charset="UTF-8">
		<title>Insert title here</title>

	</head>

	<body>
		
		<!-- start : adminMenu include -->
		<div>
			
			<jsp:include page="/partial/adminMenu.jsp"></jsp:include>
			
		</div>
		<!-- end : adminMenu include -->
			
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
					<td><%=meberDao.selectMemberConvertName(notice.getMemberNo()) %></td>
					<td><%=notice.getCreateDate() %></td>
				
				</tr>
			
			</tbody>
			
			<tr>
				
				<td><%=notice.getNoticeContent() %></td>
			
			</tr>
			
		</table>
		
	
	</body>

</html>