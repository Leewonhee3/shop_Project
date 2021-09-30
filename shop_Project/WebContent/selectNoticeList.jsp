<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" import="dao.*" import="java.util.*" %>    

<%
	
	int currentPage= 1; 
	if(request.getParameter("currentPage") != null){ // currentPage not null
		currentPage= Integer.parseInt(request.getParameter("currentPage"));
	}
	final int ROW_PER_PAGE = 10; // const
		
	int beginRow = (currentPage-1)*ROW_PER_PAGE;
	
	MemberDao memberDao = new MemberDao();
	NoticeDao noticeDao = new NoticeDao();
	ArrayList<Notice> noticeList = noticeDao.selectNoticeListAll(beginRow, ROW_PER_PAGE);
	
	System.out.println(noticeList.get(0).getNoticeNo()+"<-----selectNoticeList - noticeList");
	System.out.println(noticeList.get(1).getNoticeNo()+"<-----selectNoticeList - noticeList");

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

		<h2>공지사항게시판</h2>
		
		<table border="1">
		
			<thead>
				
				<tr>
				
					<th>게시번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					
				</tr>
			
			</thead>
			
			<tbody>
				
				<%
					
					for(Notice n : noticeList){
				
				%>
				
						<tr>
						
							<td><%=n.getNoticeNo() %></td>
							<td width ="500"><a href="selectNoticeOne.jsp?noticeNo=<%=n.getNoticeNo()%>"><%=n.getNoticeTitle()%></a></td>
							<td><%=memberDao.selectMemberConvertName(n.getMemberNo()) %></td>
							<td><%=n.getCreateDate() %></td>
						
						</tr>
			
				<% 
				
					}
				%>
				
			</tbody>
		
		
		</table>
	
	</body>

</html>