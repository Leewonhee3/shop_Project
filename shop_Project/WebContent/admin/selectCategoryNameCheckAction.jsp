<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" import="dao.*" %>
<%

	Member loginMember = (Member)session.getAttribute("loginMember");
	if(loginMember == null || loginMember.getMemberLevel() < 1) {
		System.out.println("오류");
			response.sendRedirect(request.getContextPath()+"/index.jsp");
			return;
	
	} // 세션이 null이거나 레벨이 0인경우 일반 인덱스 페이지로 이동 방어코드

%>
<!DOCTYPE html>
<html>

	<head>

		<meta charset="UTF-8">
		<title>Insert title here</title>

	</head>

	<body>

		<!-- 카테고리 이름 중복 체크 -->
		
		<%
		
			request.setCharacterEncoding("utf-8");
		
			//categoryNameCheck값이 공백 or null인지 유효성 검사 
			if(request.getParameter("categoryNameCheck") == null || request.getParameter("categoryNameCheck").equals("")){ // 파라메터가 null or 공백인경우
				response.sendRedirect(request.getContextPath()+"/admin/insertCategoryForm.jsp"); //insertCategoryForm.jsp로 반환
				return;
			}
			
			String categoryNameCheck = request.getParameter("categoryNameCheck");
			
		
			//categoryDao.selectCategoryName() 호출
			CategoryDao categoryDao = new CategoryDao();
			
			String result = categoryDao.selectCategoryName(categoryNameCheck);
			
			if(result == null){
				System.out.println(request.getContextPath()+"/admin/insertCategoryForm.jsp?categoryNameCheck="+categoryNameCheck+"<-------selectCategoryNameCheckAction - categoryNameCheck");
				
				String encText = URLEncoder.encode(categoryNameCheck, "UTF-8");//get으로 파라메터 보낼시 URL에서 한글 깨짐 현상 있음. 해결됨
				response.sendRedirect(request.getContextPath()+"/admin/insertCategoryForm.jsp?categoryNameCheck="+encText);
					
			}else{
			
				response.sendRedirect(request.getContextPath()+"/admin/insertCategoryForm.jsp?categoryNameCheckResult=This name is already taken.");
				
			}
	
		%>
		
	</body>

</html>