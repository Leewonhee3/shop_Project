<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" import="dao.*" import="java.util.*"%>
<%

	request.setCharacterEncoding("utf-8");
	Member loginMember = (Member)session.getAttribute("loginMember");
	int ebookNo = Integer.parseInt(request.getParameter("ebookNo"));
	System.out.println(ebookNo+"<-------selectEbookOne - ebookNo"); //check
	
	//paging
	int currentPage= 1; 
	if(request.getParameter("currentPage") != null){
		currentPage= Integer.parseInt(request.getParameter("currentPage"));
	}
	final int ROW_PER_PAGE = 10; // const
		
	int beginRow = (currentPage-1)*ROW_PER_PAGE;
	
%>
<!DOCTYPE html>
<html>

	<head>
	
		<meta charset="UTF-8">
		<title>상품상세보기(주문)</title>
	
	</head>

	<body>

		<h1>상품상세보기</h1>
		
		<div>
			
			<!-- More information for book -->
			
			<%
			
				EbookDao ebookDao = new EbookDao();
				Ebook ebook = ebookDao.selectEbookOne(ebookNo);
			
			%>
			
		</div>
		
		<div>
		
			<!-- insert order form -->
			
			<% 
			
				if(loginMember == null){
					
			%>
					
					<div>
						
						로그인 후 주문 가능합니다.
						<a href="<%=request.getContextPath()%>/loginForm.jsp">로그인 페이지로</a>
						
					</div>
					
			<%		
				
				}else{
			
			%>
			
					<form method="post" action="<%=request.getContextPath()%>/insertOrderAction.jsp">
					
						<input type="hidden" name="ebookNo" value="<%=ebookNo%>">
						<input type="hidden" name="memberNo" value="<%=loginMember.getMemberNo()%>">
						<input type="hidden" name="orderPrice" value="<%=ebook.getEbookPrice()%>">
						<button type="submit">주문하기</button>
					
					</form>
			
			<% 
				}
			%>
			
			
		
		</div>
		
		<div>
		
			<!-- book score avg -->
			<!-- select avg(order_score) from order_comment where ebook_no=? order by ebook_no -->
			<div>
				
				<% 
					
					CommentDao commentDao = new CommentDao();
					double avgScore= commentDao.selectOrderScoreAvg(ebookNo);
				
				%>
				
				별점 평균 : <%=avgScore %>
			
			</div>
			
			<div>
				
				<h2>후기 목록(페이징)</h2>
				
				<!-- book review(paging) -->
				<!-- select * from order_comment where ebook_no=? limit ?,? -->
				
				<%
					
					ArrayList<Comment> commentList = commentDao.selectOrderReviewByPage(ebookNo, beginRow, ROW_PER_PAGE);	
					int i=0;
					for(Comment c : commentList){
						
				%>
				
						<div>점수 : <%=c.getOrderScore() %></div>
						<div>내용 : <%=c.getOrderCommentContent() %></div>
						<div>작성일 : <%=c.getCreateDate() %></div>
						<br>
				<%		
					
					}
				
				
				
					if(currentPage == 1){ //first page
				
				%>
						
						<a href="<%=request.getContextPath()%>/selectEbookOne.jsp?currentPage=<%=currentPage+1%>&ebookNo=<%=ebookNo%>">다음</a>
							
				<%	
				
					}else{
						
				%>
					
					<a href="<%=request.getContextPath()%>/selectEbookOne.jsp?currentPage=<%=currentPage-1%>&ebookNo=<%=ebookNo%>">이전</a>
					<a href="<%=request.getContextPath()%>/selectEbookOne.jsp?currentPage=<%=currentPage+1%>&ebookNo=<%=ebookNo%>">다음</a>
				
				<%		
					
					}
					
				%>	
				
			</div>
			
		</div>

	</body>

</html>