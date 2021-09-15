<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
	if(loginMember == null || loginMember.getMemberLevel() < 1) {
		System.out.println("오류");
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
		<!-- 관리자 메뉴 include -->
		
		<!-- start : submenu include -->
		<div>
				
			<jsp:include page="/partial/adminMenu.jsp"></jsp:include>
				
		</div>
		<!-- end : submenu include -->
		
		<h1>관리자페이지</h1>
		
		<div><%=loginMember.getMemberId()%></div>
		
		<div><a href="<%=request.getContextPath()%>/admin/selectMemberList.jsp">회원목록</a></div>
		
		
		<div><a class="btn btn-warning" href="<%=request.getContextPath()%>/index.jsp">뒤로</a></div>
		
	</body>
	
</html>