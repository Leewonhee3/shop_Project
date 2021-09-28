<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" import= "dao.*" import = "java.util.*" %>    
<%
	request.setCharacterEncoding("utf-8");
	
	Member loginMember = (Member)session.getAttribute("loginMember");
	if(loginMember == null || loginMember.getMemberLevel() < 1) {
		System.out.println("오류");
		response.sendRedirect(request.getContextPath()+"/index.jsp");
   		return;
	
	} // 세션이 null이거나 레벨이 0인경우 일반 인덱스 페이지로 이동 
	
	//페이지
	int currentPage= 1; 
	if(request.getParameter("currentPage") != null){
		currentPage= Integer.parseInt(request.getParameter("currentPage"));
	}
	final int ROW_PER_PAGE = 10; // 상수 const
		
	int beginRow = (currentPage-1)*ROW_PER_PAGE;
	
	// 리스트 구현
	OrderDao orderDao = new OrderDao();
	ArrayList<OrderEbookMember> list = orderDao.selectOrderList(beginRow, ROW_PER_PAGE); 
	
	
%>    
<!DOCTYPE html>
<html>

	<head>
	
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		
	</head>

	<body>
	
		<!-- 관리자 메뉴 include -->
		
		<!-- start : submenu include -->
		<div>
				
			<jsp:include page="/partial/adminMenu.jsp"></jsp:include>
				
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
						
						</tr>			
				<% 		
			
					}
				
				%>
			
			
			
			</tbody>
		
		</table>
		
		<a href="<%=request.getContextPath()%>/admin/selectOrderList.jsp?currentPage=<%=currentPage-1%>">이전</a>
		<a href="<%=request.getContextPath()%>/admin/selectOrderList.jsp?currentPage=<%=currentPage+1%>">다음</a>
				
	</body>
	
</html>