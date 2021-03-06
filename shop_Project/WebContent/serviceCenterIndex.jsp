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
	ArrayList<QnA> qnaList = qnaDao.selectQnAListAll(beginRow, ROW_PER_PAGE);
	
	System.out.println(qnaList.size()+"<------- serviceCenterIndex - qnaList size");	


	NoticeDao noticeDao = new NoticeDao();
	ArrayList<Notice> noticeList = noticeDao.selectNoticeNewest();

%>

<!DOCTYPE html>
<html>

	<head>
	
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  		
  		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
		<!-- (Optional) Latest compiled and minified JavaScript translation files -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/i18n/defaults-*.min.js"></script>
		
		<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-2520980051100595" crossorigin="anonymous"></script>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
		
	</head>
	
	<body>
		
		<!-- start : topBillBoard include -->
		<div>
					
			<jsp:include page="/partial/topBillBoard.jsp"></jsp:include>
					
		</div>
		<!-- end : topBillBoard include -->
			
		  <!-- start : mainmenu include -->
		<div>
					
			<jsp:include page="/partial/mainMenu/topMenu.jsp"></jsp:include>
					
		</div>
		<!-- end : mainmenu include -->
			
		<!-- start : searchBar include -->
		<div>
					
			<jsp:include page="/partial/searchBar.jsp"></jsp:include>
					
		</div>
		<!-- end : searchBar include -->
		  	
		<!-- start : middlemenu include -->
		<div>
					
			<jsp:include page="/partial/mainMenu/middleMenu.jsp"></jsp:include>
				
		</div>	
		<!-- end : middlemenu include -->
		
		<div class="row">
			
			<div class="col-sm-2"></div>
				
			<div class="col">
			
				<h2>QnA ?????????</h2>
				
				<table border="1">
			
				<thead>
					
					<tr>
					
						<th>????????????</th>
						<th>????????????</th>
						<th>??????</th>
						<th>?????????</th>
						<th>?????????</th>
						<th>??????</th>
						<th>??????</th>
						
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
										<td width ="500"><a href="selectQnAOne.jsp?qnaNo=<%=q.getQnaNo()%>"><%=q.getQnaTitle()%></a><img src="<%=request.getContextPath()%>/img/lock.jpg" width="15" height="15"></td>
								
								<%		
										
									}else{
								
								%>
								
										<td width ="500"><a href="selectQnAOne.jsp?qnaNo=<%=q.getQnaNo()%>"><%=q.getQnaTitle()%></a></td>	
								
								<%		
								
									}
								
								%>
							
								<td><%=memberDao.selectMemberConvertName(q.getMemberNo()) %></td>
								<td><%=q.getCreateDate() %></td>
								
								<%
								
									if(session.getAttribute("loginMember") != null) {
								
								%>
								
										<td><a href="<%=request.getContextPath()%>/updateQnAForm.jsp?memberNo=<%=q.getMemberNo()%>&qnaNo=<%=q.getQnaNo()%>">??????</a></td>
										<td><a href="<%=request.getContextPath()%>/deleteQnAAction.jsp?memberNo=<%=q.getMemberNo()%>&qnaNo=<%=q.getQnaNo()%>">??????</a></td>
								
								<%
								
									}
								
								%>
							
							</tr>
				
					<% 
					
						}
					%>
						
					</tbody>
				
				</table>
				
				<h2>???????????? ?????????</h2>
							
				<table border="1">
								
					<thead>
										
						<tr>
										
							<th>????????????</th>
							<th>??????</th>
							<th>?????????</th>
							<th>?????????</th>
											
						</tr>
									
					</thead>
									
					<tbody>
										
					<%
											
						for(Notice n : noticeList){
										
					%>
										
							<tr>
												
								<td><%=n.getNoticeNo() %></td>
								<td width ="500"><a href="<%=request.getContextPath() %>/selectNoticeOne.jsp?noticeNo=<%=n.getNoticeNo()%>"><%=n.getNoticeTitle()%></a></td>
								<td><%=memberDao.selectMemberConvertName(n.getMemberNo()) %></td>
								<td><%=n.getCreateDate() %></td>
												
							</tr>
										
					<% 
												
						}
					
					%>
										
					</tbody>
								
				</table>	
				
			</div>
			
			<div class="col-sm-2"></div>
		
		</div>
		
	</body>
	
</html>