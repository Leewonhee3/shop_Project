<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
	if(loginMember == null || loginMember.getMemberLevel() < 1) {
  	response.sendRedirect(request.getContextPath()+"/index.jsp");
   	return;
	
	} // 세션이 null이거나 레벨이 0인경우 일반 인덱스 페이지로 이동 
%>
<!DOCTYPE html>
<html>

	<head>
	
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
	</head>

	<body>
	
		<ul>
		
			<li><a href="<%=request.getContextPath()%>/admin/selectMemberList.jsp">회원관리</a></li>
			<li><a href="<%=request.getContextPath()%>/admin/">[전자책 카테고리 관리]</a></li>
			<li><a href="<%=request.getContextPath()%>/admin/">[전자책 관리]</a></li>
			<li><a href="<%=request.getContextPath()%>/admin/">[주문 관리]</a></li>
			<li><a href="<%=request.getContextPath()%>/admin/">[상품평 관리]</a></li>
			<li><a href="<%=request.getContextPath()%>/admin/">[공지게시판 관리]</a></li>
			<li><a href="<%=request.getContextPath()%>/admin/">[QnA게시판 관리]</a></li>
		
		</ul>
		
	</body>
	
</html>