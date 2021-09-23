<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" import= "dao.*" import = "java.util.*" %>
<%
	request.setCharacterEncoding("utf-8"); //encode
	
	int beginRow=0;
	int ROW_PER_PAGE=10;
	String searchCategoryName="";//카데고리 이름 검색
	
	
	Member loginMember = (Member)session.getAttribute("loginMember");
	if(loginMember == null || loginMember.getMemberLevel() < 1) {
		System.out.println("오류");
  		response.sendRedirect(request.getContextPath()+"/index.jsp");
   		return;
	
	} // 세션이 null이거나 레벨이 0인경우 일반 인덱스 페이지로 이동 방어코드
	
	CategoryDao categoryDao = new CategoryDao();
	ArrayList<Category>categoryList = null;
	
	if(searchCategoryName.equals("") == true){ //검색내용이 없으면 리스트 출력
		categoryList = categoryDao.SelectCategoryListAllByPage(beginRow, ROW_PER_PAGE);
	}else{
		categoryList = categoryDao.SelectCategoryListAllBySearchCategoryName(beginRow, ROW_PER_PAGE, searchCategoryName);
	}
	
%>

<!DOCTYPE html>
<html>

	<head>

		<meta charset="UTF-8">
		<title>Insert title here</title>

	</head>

	<body>
		
		<h1>전자책 카테고리 관리</h1>
		
		<div>
			
			<a href="<%=request.getContextPath()%>/admin/insertCategoryForm.jsp">카테고리 추가</a>
		
		</div>
		
		<table border="1">
		
			<thead>
		
				<tr>
		
					<th>categoryName</th>
					<th>category_state</th>
					<th>updateDate</th>
					<th>createDate</th>
					<th>상태수정</th>
		
				</tr>
				
			</thead>
			
			<tbody>
				
				<% 
				for(Category c : categoryList){
				%>
					<tr>
					
						<td><%=c.getCategoryName() %></td>
						<td><%=c.getCategoryState() %></td>
						<td><%=c.getUpdateDate() %></td>
						<td><%=c.getCreateDate() %></td>
						
						<td>
							
							<form action="<%=request.getContextPath() %>/admin/updateCategoryStateAction.jsp" method="post">
							
								<input type="text" name="name" value="<%=c.getCategoryName() %>" hidden="hidden">
					
								<!-- 특정 카테고리의 상태를 수정 -->
								<select name="state">
								
								<%
									if(c.getCategoryState().equals("Y")){
								%>
										<option value="Y">Y</option>
										<option value="N">N</option>
								<%		
									}else{
								%>
										<option value="N">N</option>
										<option value="Y">Y</option>
								<%		
									}
								
								%>
								
								</select>
								
								<button type="submit">수정</button>
								
							</form>
							
						</td>
						
					</tr>
				<%
				}
				%>
				
			</tbody>
			
		</table>
		
		<div>
		
			<a href="<%=request.getContextPath()%>/admin/adminIndex.jsp">관리자페이지 가기</a>
		
		</div>	
			
	</body>

</html>