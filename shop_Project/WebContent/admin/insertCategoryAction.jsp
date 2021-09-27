<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" import="vo.*" %>
<%
	request.setCharacterEncoding("utf-8");
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
	
		<%
			request.setCharacterEncoding("utf-8"); //인코딩
			String categoryName = request.getParameter("categoryName");
			String categoryState = request.getParameter("state");
			
			//디버깅
			System.out.println(categoryName+"<---categoryName");
			System.out.println(categoryState+"<---categoryState");
			
			Category category = new Category();
			CategoryDao categoryDao = new CategoryDao();
			
			category.setCategoryName(categoryName);
			category.setCategoryState(categoryState);
			
			categoryDao.insertCategory(category);
			response.sendRedirect(request.getContextPath()+"/admin/selectCategoryList.jsp"); // 성공하면 카테고리리스트		
		%>
	
	</body>
	
</html>