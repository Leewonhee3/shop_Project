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
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		
	</head>

	<!-- 관리자 메뉴 include -->
		
	<!-- start : submenu include -->
	<div>
				
		<div class="row">
			
			<div class="col"><jsp:include page="/partial/adminMenu.jsp"></jsp:include></div>
				
		</div>
				
	</div>
	<!-- end : submenu include -->
		
	<body>
		
		<br>
		<br>
		
		<div class="container row" style="float: none; margin:0 auto;"> 

			<div class="col-md-3" style="float: none; margin:0 auto;">

				<h1>관리자 메인</h1>
			
			</div>
			
		</div>
		
		<div class="container row" style="float: none; margin:0 auto;"> 

			<div class="col-md-3" style="float: none; margin:0 auto;">
		
				<div><%=loginMember.getMemberId()%></div>
				
				<div><a href="<%=request.getContextPath()%>/admin/selectMemberList.jsp">회원목록</a></div>
				
				
				<div><a class="btn btn-warning" href="<%=request.getContextPath()%>/index.jsp">뒤로가기</a></div>
				
			</div>
		
		</div>
		
	</body>
	
</html>