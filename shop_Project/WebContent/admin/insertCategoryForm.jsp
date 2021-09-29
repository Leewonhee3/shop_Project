<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>

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
	
		<h1>카테고리 추가</h1>
		
		<%
			request.setCharacterEncoding("utf-8"); //인코딩
			String insertName ="";//체크된 이름이 중복인 경우 공백을 categoryName vaule에 넣는다.
			String categoryNameCheck = "";
			if(request.getParameter("categoryNameCheck") != null){ // 체크할 이름이 입력된 경우
				categoryNameCheck = request.getParameter("categoryNameCheck"); // 실행
			}
			
		%>
		<%
			if(request.getParameter("categoryNameCheckResult")==null){
				insertName=request.getParameter("categoryNameCheck");
				System.out.println(insertName+"<--------- insertCategoryForm - insertName");
		%>
				<div>name is available</div> <!-- null인경우 사용가능한 아이디 -->
		<%		
			}else{
		%>
				<div><%=request.getParameter("categoryNameCheckResult") %></div> <!-- 이미 사용중인 아이디 -->
		<% 		
			}
		
		%>
		
		
		<!-- 카테고리명이 사용가능한지 확인하는 폼, 사용가능한 이름이면 categoryName에 입력 중복되면 공백-->
		<form action="<%=request.getContextPath() %>/admin/selectCategoryNameCheckAction.jsp" method="post">
			
			<div>
			
				categoryName : 
				<input type="text" name="categoryNameCheck">
				<button type = "submit">duplicate check</button>
			
			</div>
		
		</form>
		
		
		<form method="post" action="<%=request.getContextPath() %>/admin/insertCategoryAction.jsp">
				
			<!-- 카테고리명 -->
			<div>categoryName : </div>
			<div><input type = "text" name="categoryName" readonly="readonly" value="<%=insertName%>"></div>
			<!-- 카테고리 활성화 여부 -->
				
			<div>category_state : </div>
				
			<div>
				
				<select name = "state">
					
					<option value="Y">Y</option>
					<option value="N">N</option>
					
				</select>
					
			</div>
				
			<button type= "submit">추가</button>
			
		</form>
		
	</body>

</html>