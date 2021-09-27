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
	
	int currentPage = 1;
	int ROW_PER_PAGE=10;
	int beginRow = (currentPage-1)*ROW_PER_PAGE;
	Member member = (Member)session.getAttribute("loginMember");
	System.out.println(member.getMemberNo()+"<--- selectOrderListByMember - memberNo");// check
	OrderDao orderDao = new OrderDao();
	CommentDao commentDao =  new CommentDao();
	ArrayList<OrderEbookMember> list = orderDao.selectMemberOrderList(beginRow, ROW_PER_PAGE,member.getMemberNo());
	
%> 
<!DOCTYPE html>
<html>

	<head>
	
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		
	</head>

	<body>
	
		<!-- 메인 메뉴 include -->
		
		<!-- start : menu include -->
		<div>
				
			<jsp:include page="/partial/mainMenu.jsp"></jsp:include>
				
		</div>
		<!-- end : submenu include -->
		
		<br>
		<br>
		
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
		
		<a href="<%=request.getContextPath() %>/selectOrderListByMember.jsp?currentPage=<%=currentPage-1%>">이전</a>
		<a href="<%=request.getContextPath() %>/selectOrderListByMember.jsp?currentPage=<%=currentPage+1%>">다음</a>
				
	</body>
	
</html>