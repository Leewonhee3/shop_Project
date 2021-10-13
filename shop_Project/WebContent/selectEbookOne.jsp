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
	final int ROW_PER_PAGE = 5; // const
		
	int beginRow = (currentPage-1)*ROW_PER_PAGE;
	
%>
<!DOCTYPE html>
<html>

	<head>
	
		<meta charset="UTF-8">
		<title>메인화면</title>
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
			
			<div class="col-sm-3">
			
			</div>
			
			<div class="col border">
				
				<h1>도서 상세정보</h1>
				
				<div>
					
					<!-- More information for book -->
					
					<%
					
						EbookDao ebookDao = new EbookDao();
						Ebook ebook = ebookDao.selectEbookOne(ebookNo);
					
					%>
					
					<img src="<%=request.getContextPath()%>/img/<%=ebook.getEbookImg()%>" class="border" width="800" height="400">
					
					<p>도서명  : <%=ebook.getEbookTitle() %></p>
					<p>작가  : <%=ebook.getEbookAuthor() %></p>
					<p>출판사  : <%=ebook.getEbookCompany() %></p>
					<p>페이지수  : <%=ebook.getEbookPageCount() %></p>
					<p>ISBN  : <%=ebook.getEbookISBN() %></p>
					<p>가격  : <%=ebook.getEbookPrice() %></p>
					<p>판매상태  : <%=ebook.getEbookState() %></p>
					<p>도서설명 : <%=ebook.getEbookSummary() %></p>
					
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
						
						<br>
						
						별점 평균 : <%=avgScore %>
					
					</div>
					
					<div>
						
						<br>
						
						<h2>구매 후기</h2>
						
						<!-- book review(paging) -->
						<!-- select * from order_comment where ebook_no=? limit ?,? -->
						
						<%
							
							ArrayList<Comment> commentList = commentDao.selectOrderReviewByPage(ebookNo, beginRow, ROW_PER_PAGE);	
							int i=0;
							
							if(commentList.size()==0){
						%>
								
								<div>구매 후기가 없습니다.</div>
						
						<%	
							}else{
						
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
								
						<%		
							
							}
						
						%>
						
					</div>
					
				</div>
			
			</div>
		
			<div class="col-sm-3"></div>
		
		</div>

	</body>

</html>