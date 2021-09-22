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
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		
	</head>

	<body>
			<!-- 
			
				1)Category.class // 카테고리 클래스
				2)categoryDao.class // 카테고리 관련 메소드
				3)selectCategoryList.jsp 페이징x //카테고리 목록출력
				4)selectCategoryNameCheckAction.jsp // 카데고리 이름 체크
				5)insertCategoryForm.jsp // 카테고리 추가
				6)insertCategoryAction.jsp // 추가 액션
				7)updateCategoryStateAction.jsp //카테고리 사용유무 설정
			
			 -->
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		  
			<a class="navbar-brand" href="<%=request.getContextPath()%>/admin/adminIndex.jsp">관리자 페이지</a>
		    
		  	<ul class="navbar-nav">
		    	
		    	<li class="nav-item">
		      	
		      		<a class="nav-link" href="<%=request.getContextPath()%>/admin/selectMemberList.jsp">[회원관리]</a>
		      		<!-- 목록, 추가 -->
		    	
		    	</li>
		    	
		    	<li class="nav-item">
		      	
		      		<a class="nav-link" href="<%=request.getContextPath()%>/admin/selectCategoryList.jsp">[전자책 카테고리 관리]</a>
		    		<!-- 목록, 추가, 이미지추가, 수정, 삭제 -->
		    	
		    	</li>
		    	
		    	<li class="nav-item">
		      	
		      		<a class="nav-link" href="<%=request.getContextPath()%>/admin/">[전자책 관리]</a>
		    	
		    	</li>
		    	
		    	<li class="nav-item">
		      	
		      		<a class="nav-link" href="<%=request.getContextPath()%>/admin/">[주문 관리]</a>
		    	
		    	</li>
		    	
		    	<li class="nav-item">
		      	
		      		<a class="nav-link" href="<%=request.getContextPath()%>/admin/">[상품평 관리]</a>
		    	
		    	</li>
		    	
		    	<li class="nav-item">
		      	
		      		<a class="nav-link" href="<%=request.getContextPath()%>/admin/">[공지게시판 관리]</a>
		    	
		    	</li>
		    	
		    	<li class="nav-item">
		      	
		      		<a class="nav-link" href="<%=request.getContextPath()%>/admin/">[QnA게시판 관리]</a>
		    	
		    	</li>
		    	
		  	</ul>
  	
		</nav>
		
	</body>
	
</html>