<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" import="dao.*" import="java.util.*" %>
<%

	request.setCharacterEncoding("utf-8");
	Member loginMember = (Member)session.getAttribute("loginMember");
	if(loginMember == null || loginMember.getMemberLevel() < 1) {
		System.out.println("오류");
		response.sendRedirect(request.getContextPath()+"/index.jsp");
   		return;
	
	} // 세션이 null이거나 레벨이 0인경우 일반 인덱스 페이지로 이동 
	
	int currentPage= 1; 
	if(request.getParameter("currentPage") != null){ // currentPage not null
		currentPage= Integer.parseInt(request.getParameter("currentPage"));
	}
	final int ROW_PER_PAGE = 10; // const
		
	int beginRow = (currentPage-1)*ROW_PER_PAGE;
	
	MemberDao memberDao = new MemberDao();
	NoticeDao noticeDao = new NoticeDao();
	ArrayList<Notice> noticeList = noticeDao.selectNoticeListAll(beginRow, ROW_PER_PAGE);
	
%>
<!DOCTYPE html>
<html>

	<head>

		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> <!-- jquery -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		
	</head>

	<body class="bg-secondary text-white">
			
		<!-- start : adminmenu include -->
		
		<div>
					
			<div class="row">
				
				<div class="col"><jsp:include page="/partial/adminMenu.jsp"></jsp:include></div>
					
			</div>
					
		</div>
		
		<!-- end : adminmenu include -->
	
		<h1>공지사항 관리</h1>
		
			<table border="1">
			
				<thead>
					
					<tr>
					
						<th>게시번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>삭제</th>
						<th>수정</th>
						
					</tr>
				
				</thead>
				
				<tbody>
					
					<%
						
						for(Notice n : noticeList){
					
					%>
					
							<tr>
							
								<td><%=n.getNoticeNo() %></td>
								<td width ="500"><a href="<%=request.getContextPath() %>/admin/selectNoticeOne.jsp?noticeNo=<%=n.getNoticeNo()%>"><%=n.getNoticeTitle()%></a></td>
								<td><%=memberDao.selectMemberConvertName(n.getMemberNo()) %></td>
								<td><%=n.getCreateDate() %></td>
								<td><a href="<%=request.getContextPath()%>/admin/deleteNoticeAction.jsp?noticeNo=<%=n.getNoticeNo()%>&memberNo=<%=n.getMemberNo()%>">삭제</a></td>
								<td><a href="<%=request.getContextPath()%>/admin/updateNoticeForm.jsp?noticeNo=<%=n.getNoticeNo()%>&memberNo=<%=n.getMemberNo()%>">수정</a></td>
								
							</tr>
					
					<% 
							
						}
					%>
					
				</tbody>
			
			</table>
		
		<a href="<%=request.getContextPath()%>/admin/insertNoticeForm.jsp?memberNo=<%=loginMember.getMemberNo()%>"><button type="button">글쓰기</button></a>
		
	</body>

</html>