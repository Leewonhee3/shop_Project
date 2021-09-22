<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>

		<meta charset="UTF-8">
		<title>Insert title here</title>

	</head>

	<body>
	
		<h1>카테고리 추가</h1>
		
		<form method="post" action="<%=request.getContextPath() %>/admin/insertCategoryAction.jsp">
				<!-- 카테고리명 -->
				<div>categoryName: </div>
				<div><input type = "text" name="categoryName"></div>
				<!-- 카테고리 활성화 여부 -->
				
				<div>category_state: </div>
				
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