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
	int currentPage=1;
	int ROW_PER_PAGE=5;
	int beginRow = (currentPage-1)*ROW_PER_PAGE;
	
	
	MemberDao memberDao = new MemberDao();
	NoticeDao noticeDao = new NoticeDao();
	QnADao qnaDao = new QnADao();
	
	ArrayList<Notice> noticeList = noticeDao.selectNoticeNewest();
	ArrayList<QnA> QnAList = qnaDao.selectWaitingQnAList(beginRow, ROW_PER_PAGE);
	
	
%>
<!DOCTYPE html>
<html>

	<head>
	
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		
	</head>

	<body class="bg-secondary text-white">

		<!-- start : submenu include -->
		
		<div>
					
			<div class="row">
				
				<div class="col"><jsp:include page="/partial/adminMenu.jsp"></jsp:include></div>
					
			</div>
					
		</div>
		
		<!-- end : submenu include -->
	
		<br>
		<br>		
		
		<div class="row">
			
			<div class="container-fluid col-sm-3">
		  
		  		<div class="card bg-dark text-white" style="width:300px">
		    			
		    		<img class="card-img-top" src="<%=request.getContextPath()%>/img/admin.png" alt="Card image" height="350">
		    			
		    		<div class="card-body">
		      			
			      		<h4 class="card-title"><%=loginMember.getMemberId()%>님</h4>
			      
			      		<p class="card-text">프로필 내용 ~~~~~</p>
			      		
			      		<div class="btn-group btn-group-sm">	
			      		
				      		<a href="#" class="btn btn-primary">프로필 수정</a>
			    			
		    			</div>
		    			
		    			<div class="btn-group btn-group-sm">	
			      		
		    				<a href="#" class="btn btn-primary">회원 정보</a>
		    			
		    			</div>
		    			
		    			<div class="btn-group btn-group-sm">	
				      		
			    		<a href="<%=request.getContextPath()%>/logout.jsp" class="btn btn-primary">로그아웃</a>
			    			
			    		</div>
		    			
		    		</div>
		  			
		  		</div>
		  	
		  	</div>
  		
		  	<table class="table table-dark table-hover col-sm-9" style="width:200px" height="500">
				    
				<tbody>
				    
					<tr>
					      
						<td><br><a href="<%=request.getContextPath()%>/admin/selectMemberList.jsp">회원 관리</a></td>
						<td>회원을 관리하는 기능입니다.</td>
					        
					</tr>
					      
					<tr>
					      
						<td><br><a href="<%=request.getContextPath()%>/admin/selectCategoryList.jsp">전자책 카테고리 관리</a></td>
						<td>전자책 카테고리를 관리하는 기능입니다.</td>
					        
					</tr>
					      
					<tr>
					      
						<td><br><a href="<%=request.getContextPath()%>/admin/selectEbookList.jsp">전자책 관리</a></td>
						<td>전자책을 관리하는 기능입니다.</td>
					        
					</tr>
					
					<tr>
					      
						<td><br><a href="<%=request.getContextPath()%>/admin/selectOrderList.jsp">주문 관리</a></td>
						<td>회원 주문을 관리하는 기능입니다.</td>
					        
					</tr>
					      
					<tr>
					      
						<td><br><a href="<%=request.getContextPath()%>/admin/">상품평 관리</a></td>
						<td>상품평을 관리하는 기능입니다.</td>
					        
					</tr>
					
					<tr>
					      
						<td><br><a href="<%=request.getContextPath()%>/admin/selectNoticeList.jsp">공지게시판 관리</a></td>
						<td>공지게시판을 관리하는 기능입니다.</td>
					        
					</tr>
					
					<tr>
					      
						<td><br><a href="<%=request.getContextPath()%>/admin/selectQnAList.jsp">QnA게시판 관리</a></td>
						<td>QnA게시판을 관리하는 기능입니다.</td>
					        
					</tr>
				      
				</tbody>
				    
			</table>
			  	
		</div>
		
		<br>
		<br>
		
		<div>&nbsp<a class="btn btn-primary btn-sm" href="<%=request.getContextPath()%>/index.jsp">메인페이지로 가기</a></div>
		
		<h2>최근 공지사항</h2>
		
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
							<td width ="500"><a href="<%=request.getContextPath() %>/admin/selectNoticeOne.jsp?noticeNo=<%=n.getNoticeNo()%>"><%=n.getNoticeTitle()%></a></td>
							<td><%=memberDao.selectMemberConvertName(n.getMemberNo()) %></td>
							<td><%=n.getCreateDate() %></td>
							
						</tr>
					
				<% 
							
					}
				%>
					
			</tbody>
			
		</table>	
	
		<h2>답변대기중인 QnA</h2>
		
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
						
					for(QnA q : QnAList){
					System.out.println(q.getQnaNo());
				%>
					
						<tr>
							
							<td><%=q.getQnaNo() %></td>
							<td width ="500"><a href="<%=request.getContextPath() %>/admin/insertQnACommentForm.jsp?qnaNo=<%=q.getQnaNo()%>"><%=q.getQnaTitle()%></a></td>
							<td><%=memberDao.selectMemberConvertName(q.getMemberNo()) %></td>
							<td><%=q.getCreateDate() %></td>
							
						</tr>
					
				<% 
							
					}
				%>
					
			</tbody>
			
		</table>
	
	</body>
	
</html>