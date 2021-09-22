<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" import="vo.*" %>
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