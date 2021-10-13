<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" import="vo.*" import = "dao.*" %>    
<%

	request.setCharacterEncoding("utf-8"); //인코딩	
	//인증 방어 코드 : 로그인 전 session.getAttribute("loginMember") == null 인 경우
	if(session.getAttribute("loginMember")==null){
		System.out.println("로그인 안됨");
		response.sendRedirect("./index.jsp"); //로그인 안되면 볼 수 없음.
		return;
	}
	
	//구현코드
	
	//paging
	
	int currentPage= 1; 
	if(request.getParameter("currentPage") != null){ // currentPage not null
		currentPage= Integer.parseInt(request.getParameter("currentPage"));
	}
	final int ROW_PER_PAGE = 10; // const
		
	int beginRow = (currentPage-1)*ROW_PER_PAGE;
	
	Member member = (Member)session.getAttribute("loginMember");
	System.out.println(member.getMemberNo()+"<--- selectOrderListByMember - memberNo");// check
	
	OrderDao orderDao = new OrderDao();
	CommentDao commentDao =  new CommentDao();
	ArrayList<OrderEbookMember> list = orderDao.selectMemberOrderList(beginRow, ROW_PER_PAGE,member.getMemberNo());
	
	System.out.println("!!!!!!!!!!!!!!selectOrderListByMember - test!!!!!!!!!");
	
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
		
		<br>
		<br>
		
		<div class="row">
			
			<div class="col-sm-3"></div>
			
			<div class="col">
			
				<h1>주문 목록</h1>
		
					<table border="1">
		
						<thead>
					
							<tr>
							
								<th>orderNo</th>
								<th>ebookTitle</th>
								<th>orderPrice</th>
								<th>orderDate</th>
								<th>memberId</th>
								<th>상세주문내역</th>
								<th>ebook후기</th>
						
							</tr>
					
						</thead>
					
						<tbody>
						
							<%
								for(OrderEbookMember oem : list){
							%>		
									<tr>
										
										<td><%=oem.getOrder().getOrderNo() %></td>
										<td><%=oem.getEbook().getEbookTitle() %></td>
										<td><%=oem.getOrder().getOrderPrice() %></td>
										<td><%=oem.getOrder().getOrderDate() %></td>
										<td><%=oem.getMember().getMemberId() %></td>
										<td><a href="">상세주문내역</a></td>
										<%
										
											if(commentDao.selectCheckCommentReview(oem.getOrder().getOrderNo(), oem.getEbook().getEbookNo()) == 0){ //오더넘버 + 이북넘버에 해당되는 데이터가 있는지 확인 리턴값 있으면 1 없으면 0
										
										%>
											
											<td><a href="<%=request.getContextPath()%>/insertOrderCommentForm.jsp?orderNo=<%=oem.getOrder().getOrderNo()%>&ebookNo=<%=oem.getEbook().getEbookNo()%>">ebook후기</a></td>
										
										<%
										
											}else{
										
										%>
										
											<td>후기 작성완료</td>
										
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
					
					if(currentPage == 1){ //first page
							
				%>
									
						<a href="<%=request.getContextPath()%>/selectOrderListByMember.jsp?currentPage=<%=currentPage+1%>&memberNo=<%=member.getMemberNo()%>">다음</a>
										
				<%	
							
					}else{
									
				%>
								
						<a href="<%=request.getContextPath()%>/selectOrderListByMember.jsp?currentPage=<%=currentPage-1%>&memberNo=<%=member.getMemberNo()%>">이전</a>
						<a href="<%=request.getContextPath()%>/selectOrderListByMember.jsp?currentPage=<%=currentPage+1%>&memberNo=<%=member.getMemberNo()%>">다음</a>
							
				<%		
						
					}
								
				%>
			
			</div>
			
			<div class="col-sm-3"></div>
			
		
		</div>
				
	</body>
	
</html>