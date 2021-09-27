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
			request.setCharacterEncoding("utf-8");
			String categoryname = request.getParameter("name"); // 해당 카테고리 네임
			String categorystate = request.getParameter("state"); // y or n
			
			//디버깅
			System.out.println(categoryname+"<----categoryname");
			System.out.println(categorystate+"<----categorystate");
			
			
			Category category = new Category();
			category.setCategoryName(categoryname);
			category.setCategoryState(categorystate);
			
			CategoryDao categoryDao = new CategoryDao();
			categoryDao.updateCategoryState(category);
			response.sendRedirect(request.getContextPath()+"/admin/selectCategoryList.jsp"); // 성공하면 카테고리리스트
			
		
		%>

		<!-- 카테고리 사용 유무 수정 -->
	
	</body>

</html>